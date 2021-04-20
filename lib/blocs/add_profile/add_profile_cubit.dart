import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:symptoms_monitor/domain/profiles/i_profile_repository.dart';
import 'package:symptoms_monitor/models/profile/profile.dart';
part 'add_profile_state.dart';
part 'add_profile_cubit.freezed.dart';

@injectable
class AddProfileCubit extends Cubit<AddProfileState> {
  final IProfileRepository profileRepository;

  AddProfileCubit({@required this.profileRepository})
      : super(AddProfileState.initial(
          profilesCount: 0,
          profiles: [],
          profileName: '',
          genders: [true, false, false],
          genderIndex: 0,
          emptyProfile: Profile.empty(),
          errorText: '',
          showError: false,
          canGo: false,
          isLoading: false,
        ));

  void add() {
    if (state.profileName.isNotEmpty) {
      var profiles = state.profiles;

      String gender;
      if (state.genderIndex == 0) {
        gender = 'male';
      } else if (state.genderIndex == 1) {
        gender = 'female';
      } else {
        gender = 'none';
      }
      var name =
          state.profileName.replaceAll(new RegExp(r"\s+"), "").toUpperCase();

      bool hasImage;
      if (state.emptyProfile.avatar != null) {
        hasImage = true;
      } else {
        hasImage = false;
      }

      profiles.insert(
          0,
          Profile(
            hasImage: hasImage,
            name: name,
            gender: gender,
            avatar: state.emptyProfile.avatar,
          ));

      var emptyProfile = Profile.empty();
      emptyProfile = emptyProfile.copyWith(name: state.profileName);

      emit(state.copyWith(
        profilesCount: profiles.length,
        profiles: profiles,
        emptyProfile: emptyProfile,
      ));
    }
  }

  void remove(Profile profile) {
    print(profile.name);
    var profs = state.profiles;
    profs.remove(profile);
    emit(state.copyWith(
      profilesCount: profs.length,
      profiles: profs,
    ));
  }

  Future<void> chooseImage() async {
    emit(state.copyWith(
      isLoading: true,
    ));

    final avatar = await profileRepository.getImage();

    avatar.fold(
        (failure) => emit(state.copyWith(
              isLoading: false,
            )),
        (file) => emit(state.copyWith(
              emptyProfile:
                  state.emptyProfile.copyWith(avatar: file, hasImage: true),
              isLoading: false,
            )));
  }

  void nameChanged(String input) {
    emit(state.copyWith(
      profileName: input,
    ));
  }

  void ganderChanged(int index) {
    for (int i = 0; i < state.genders.length; i++) {
      if (state.genders[i] == true) {
        state.genders[i] = false;
      }
      if (i == index) {
        state.genders[i] = true;
      }
    }

    emit(state.copyWith(
      genderIndex: index,
      genders: state.genders,
    ));
  }

  void save() async {
    if (state.profiles.isEmpty) {
      emit(state.copyWith(
        showError: true,
        errorText: 'Dodaj członków rodziny',
      ));
    } else {
      emit(
        state.copyWith(
          isLoading: true,
        ),
      );

      state.profiles.forEach((profile) async {
        final failureOrSuccess = await profileRepository.saveProfile(profile);

        if (failureOrSuccess.isLeft()) {
          emit(state.copyWith(
            errorText: 'Błąd połączenia z serwerem',
            showError: true,
          ));
          return;
        }

        emit(state.copyWith(
          showError: false,
          canGo: true,
        ));
      });
    }
    emit(state.copyWith(
      showError: false,
    ));
  }
}
