import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:symptoms_monitor/models/profile/gender_enum.dart';
import 'package:symptoms_monitor/models/profile/profile.dart';

part 'add_profile_state.dart';
part 'add_profile_cubit.freezed.dart';

class AddProfileCubit extends Cubit<AddProfileState> {
  AddProfileCubit()
      : super(AddProfileState.initial(
            profilesCount: 1,
            profiles: [Profile.empty()],
            profileName: '',
            genders: [true, false, false],
            genderIndex: 0));

  void add() {
    var profs = state.profiles;
    Gender gen;
    if (state.genderIndex == 0) {
      gen = Gender.male;
    } else if (state.genderIndex == 1) {
      gen = Gender.female;
    } else {
      gen = Gender.none;
    }

    profs.insert(
        0,
        Profile(
            hasImage: false,
            imageUrl: '',
            name: state.profileName,
            gender: gen));
    emit(state.copyWith(profilesCount: profs.length, profiles: profs));
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

  void remove(Profile profile) {
    print(profile.name);
    var profs = state.profiles;
    profs.remove(profile);
    emit(state.copyWith(profilesCount: profs.length, profiles: profs));
  }
}
