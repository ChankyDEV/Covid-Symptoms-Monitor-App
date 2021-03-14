// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'blocs/auth/auth_cubit.dart' as _i8;
import 'blocs/logged_in/logged_in_cubit.dart' as _i7;
import 'domain/measurement/i_measurement_repsitory.dart' as _i5;
import 'domain/measurement/measurement_repository.dart' as _i6;
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
  gh.factory<_i7.LoggedInCubit>(
      () => _i7.LoggedInCubit(get<_i3.IAuthRepository>()));
  gh.factory<_i8.AuthCubit>(() => _i8.AuthCubit(get<_i3.IAuthRepository>()));
  return get;
}
