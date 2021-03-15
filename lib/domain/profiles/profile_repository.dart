import 'package:injectable/injectable.dart';
import 'package:symptoms_monitor/domain/measurement/measurement_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:symptoms_monitor/domain/profiles/i_profile_repository.dart';
import 'package:symptoms_monitor/domain/registration/i_authenticate_repository.dart';
import 'package:symptoms_monitor/inject.dart';
import 'package:symptoms_monitor/models/profile/profile.dart';

@LazySingleton(as: IProfileRepository)
class ProfileRepository implements IProfileRepository {
  @override
  Future<Either<MeasurementFailure, Unit>> getProfiles() {}

  @override
  Future<Either<MeasurementFailure, Unit>> saveProfiles(
      List<Profile> profiles) async {
    //var user = await getIt<IAuthRepository>().getSignedInUser();
  }
}
