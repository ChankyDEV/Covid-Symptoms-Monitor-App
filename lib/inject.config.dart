// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'blocs/add_profile/add_profile_cubit.dart' as _i10;
import 'blocs/auth/auth_cubit.dart' as _i11;
import 'blocs/logged_in/logged_in_cubit.dart' as _i9;
import 'domain/measurement/i_measurement_repsitory.dart' as _i5;
import 'domain/measurement/measurement_repository.dart' as _i6;
import 'domain/profiles/i_profile_repository.dart' as _i7;
import 'domain/profiles/profile_repository.dart' as _i8;
import 'domain/registration/authenticate_repository.dart' as _i4;
import 'domain/registration/i_authenticate_repository.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String environment, _i2.EnvironmentFilter environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.IAuthRepository>(() => _i4.AuthRepository());
  gh.lazySingleton<_i5.IMeasurementRepository>(
      () => _i6.MeasurementRepository());
  gh.lazySingleton<_i7.IProfileRepository>(() => _i8.ProfileRepository());
  gh.factory<_i9.LoggedInCubit>(
      () => _i9.LoggedInCubit(get<_i3.IAuthRepository>()));
  gh.factory<_i10.AddProfileCubit>(() =>
      _i10.AddProfileCubit(profileRepository: get<_i7.IProfileRepository>()));
  gh.factory<_i11.AuthCubit>(() => _i11.AuthCubit(get<_i3.IAuthRepository>()));
  return get;
}
