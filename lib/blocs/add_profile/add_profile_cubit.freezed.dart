// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'add_profile_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$AddProfileStateTearOff {
  const _$AddProfileStateTearOff();

// ignore: unused_element
  _Initial initial(
      {int profilesCount,
      List<Profile> profiles,
      String profileName,
      List<bool> genders,
      int genderIndex,
      Profile emptyProfile,
      bool profilesSaved}) {
    return _Initial(
      profilesCount: profilesCount,
      profiles: profiles,
      profileName: profileName,
      genders: genders,
      genderIndex: genderIndex,
      emptyProfile: emptyProfile,
      profilesSaved: profilesSaved,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $AddProfileState = _$AddProfileStateTearOff();

/// @nodoc
mixin _$AddProfileState {
  int get profilesCount;
  List<Profile> get profiles;
  String get profileName;
  List<bool> get genders;
  int get genderIndex;
  Profile get emptyProfile;
  bool get profilesSaved;

  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required
        TResult initial(
            int profilesCount,
            List<Profile> profiles,
            String profileName,
            List<bool> genders,
            int genderIndex,
            Profile emptyProfile,
            bool profilesSaved),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(
        int profilesCount,
        List<Profile> profiles,
        String profileName,
        List<bool> genders,
        int genderIndex,
        Profile emptyProfile,
        bool profilesSaved),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    @required TResult orElse(),
  });

  @JsonKey(ignore: true)
  $AddProfileStateCopyWith<AddProfileState> get copyWith;
}

/// @nodoc
abstract class $AddProfileStateCopyWith<$Res> {
  factory $AddProfileStateCopyWith(
          AddProfileState value, $Res Function(AddProfileState) then) =
      _$AddProfileStateCopyWithImpl<$Res>;
  $Res call(
      {int profilesCount,
      List<Profile> profiles,
      String profileName,
      List<bool> genders,
      int genderIndex,
      Profile emptyProfile,
      bool profilesSaved});
}

/// @nodoc
class _$AddProfileStateCopyWithImpl<$Res>
    implements $AddProfileStateCopyWith<$Res> {
  _$AddProfileStateCopyWithImpl(this._value, this._then);

  final AddProfileState _value;
  // ignore: unused_field
  final $Res Function(AddProfileState) _then;

  @override
  $Res call({
    Object profilesCount = freezed,
    Object profiles = freezed,
    Object profileName = freezed,
    Object genders = freezed,
    Object genderIndex = freezed,
    Object emptyProfile = freezed,
    Object profilesSaved = freezed,
  }) {
    return _then(_value.copyWith(
      profilesCount: profilesCount == freezed
          ? _value.profilesCount
          : profilesCount as int,
      profiles:
          profiles == freezed ? _value.profiles : profiles as List<Profile>,
      profileName:
          profileName == freezed ? _value.profileName : profileName as String,
      genders: genders == freezed ? _value.genders : genders as List<bool>,
      genderIndex:
          genderIndex == freezed ? _value.genderIndex : genderIndex as int,
      emptyProfile: emptyProfile == freezed
          ? _value.emptyProfile
          : emptyProfile as Profile,
      profilesSaved: profilesSaved == freezed
          ? _value.profilesSaved
          : profilesSaved as bool,
    ));
  }
}

/// @nodoc
abstract class _$InitialCopyWith<$Res>
    implements $AddProfileStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
  @override
  $Res call(
      {int profilesCount,
      List<Profile> profiles,
      String profileName,
      List<bool> genders,
      int genderIndex,
      Profile emptyProfile,
      bool profilesSaved});
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$AddProfileStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;

  @override
  $Res call({
    Object profilesCount = freezed,
    Object profiles = freezed,
    Object profileName = freezed,
    Object genders = freezed,
    Object genderIndex = freezed,
    Object emptyProfile = freezed,
    Object profilesSaved = freezed,
  }) {
    return _then(_Initial(
      profilesCount: profilesCount == freezed
          ? _value.profilesCount
          : profilesCount as int,
      profiles:
          profiles == freezed ? _value.profiles : profiles as List<Profile>,
      profileName:
          profileName == freezed ? _value.profileName : profileName as String,
      genders: genders == freezed ? _value.genders : genders as List<bool>,
      genderIndex:
          genderIndex == freezed ? _value.genderIndex : genderIndex as int,
      emptyProfile: emptyProfile == freezed
          ? _value.emptyProfile
          : emptyProfile as Profile,
      profilesSaved: profilesSaved == freezed
          ? _value.profilesSaved
          : profilesSaved as bool,
    ));
  }
}

/// @nodoc
class _$_Initial implements _Initial {
  const _$_Initial(
      {this.profilesCount,
      this.profiles,
      this.profileName,
      this.genders,
      this.genderIndex,
      this.emptyProfile,
      this.profilesSaved});

  @override
  final int profilesCount;
  @override
  final List<Profile> profiles;
  @override
  final String profileName;
  @override
  final List<bool> genders;
  @override
  final int genderIndex;
  @override
  final Profile emptyProfile;
  @override
  final bool profilesSaved;

  @override
  String toString() {
    return 'AddProfileState.initial(profilesCount: $profilesCount, profiles: $profiles, profileName: $profileName, genders: $genders, genderIndex: $genderIndex, emptyProfile: $emptyProfile, profilesSaved: $profilesSaved)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Initial &&
            (identical(other.profilesCount, profilesCount) ||
                const DeepCollectionEquality()
                    .equals(other.profilesCount, profilesCount)) &&
            (identical(other.profiles, profiles) ||
                const DeepCollectionEquality()
                    .equals(other.profiles, profiles)) &&
            (identical(other.profileName, profileName) ||
                const DeepCollectionEquality()
                    .equals(other.profileName, profileName)) &&
            (identical(other.genders, genders) ||
                const DeepCollectionEquality()
                    .equals(other.genders, genders)) &&
            (identical(other.genderIndex, genderIndex) ||
                const DeepCollectionEquality()
                    .equals(other.genderIndex, genderIndex)) &&
            (identical(other.emptyProfile, emptyProfile) ||
                const DeepCollectionEquality()
                    .equals(other.emptyProfile, emptyProfile)) &&
            (identical(other.profilesSaved, profilesSaved) ||
                const DeepCollectionEquality()
                    .equals(other.profilesSaved, profilesSaved)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(profilesCount) ^
      const DeepCollectionEquality().hash(profiles) ^
      const DeepCollectionEquality().hash(profileName) ^
      const DeepCollectionEquality().hash(genders) ^
      const DeepCollectionEquality().hash(genderIndex) ^
      const DeepCollectionEquality().hash(emptyProfile) ^
      const DeepCollectionEquality().hash(profilesSaved);

  @JsonKey(ignore: true)
  @override
  _$InitialCopyWith<_Initial> get copyWith =>
      __$InitialCopyWithImpl<_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required
        TResult initial(
            int profilesCount,
            List<Profile> profiles,
            String profileName,
            List<bool> genders,
            int genderIndex,
            Profile emptyProfile,
            bool profilesSaved),
  }) {
    assert(initial != null);
    return initial(profilesCount, profiles, profileName, genders, genderIndex,
        emptyProfile, profilesSaved);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(
        int profilesCount,
        List<Profile> profiles,
        String profileName,
        List<bool> genders,
        int genderIndex,
        Profile emptyProfile,
        bool profilesSaved),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(profilesCount, profiles, profileName, genders, genderIndex,
          emptyProfile, profilesSaved);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
  }) {
    assert(initial != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AddProfileState {
  const factory _Initial(
      {int profilesCount,
      List<Profile> profiles,
      String profileName,
      List<bool> genders,
      int genderIndex,
      Profile emptyProfile,
      bool profilesSaved}) = _$_Initial;

  @override
  int get profilesCount;
  @override
  List<Profile> get profiles;
  @override
  String get profileName;
  @override
  List<bool> get genders;
  @override
  int get genderIndex;
  @override
  Profile get emptyProfile;
  @override
  bool get profilesSaved;
  @override
  @JsonKey(ignore: true)
  _$InitialCopyWith<_Initial> get copyWith;
}
