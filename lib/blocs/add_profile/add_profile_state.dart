part of 'add_profile_cubit.dart';

@freezed
abstract class AddProfileState with _$AddProfileState {
  const factory AddProfileState.initial({
    int profilesCount,
    List<Profile> profiles,
    String profileName,
    List<bool> genders,
    int genderIndex,
    Profile emptyProfile,
  }) = _Initial;
}
