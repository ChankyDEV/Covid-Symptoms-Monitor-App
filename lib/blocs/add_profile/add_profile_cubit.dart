import 'package:bloc/bloc.dart';
import 'package:flutter/animation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:symptoms_monitor/domain/profiles/i_profile_repository.dart';
import 'package:symptoms_monitor/models/profile/gender_enum.dart';
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
            emptyProfile: Profile.empty()));

  void add() {
    if (state.profileName.isNotEmpty) {
      var profiles = state.profiles;

      Gender gender;
      if (state.genderIndex == 0) {
        gender = Gender.male;
      } else if (state.genderIndex == 1) {
        gender = Gender.female;
      } else {
        gender = Gender.none;
      }

      profiles.insert(
          0,
          Profile(
            hasImage: true,
            imageUrl: '',
            name: state.profileName,
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
    emit(state.copyWith(profilesCount: profs.length, profiles: profs));
  }

  Future<void> chooseImage() async {
    //TODO: Change location of taking pictures. Move to repo
    var imgPicker = ImagePicker();
    PickedFile avatar;
    try {
      avatar = await imgPicker.getImage(source: ImageSource.gallery);
    } catch (e) {}

    if (avatar != null) {
      var empty = state.emptyProfile.copyWith(avatar: avatar, hasImage: true);
      emit(state.copyWith(emptyProfile: empty));
    }
  }

  void nameChanged(String input) {
    emit(state.copyWith(profileName: input));
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

    emit(state.copyWith(genderIndex: index, genders: state.genders));
  }

  Future<void> save() async {
    var failureOrSuccess = await profileRepository.saveProfiles(state.profiles);
    if (failureOrSuccess.isLeft()) {
    } else {
      emit(state.copyWith(profilesSaved: true));
    }
  }
}
