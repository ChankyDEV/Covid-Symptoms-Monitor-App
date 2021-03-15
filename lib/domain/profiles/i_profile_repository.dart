import 'package:dartz/dartz.dart';
import 'package:symptoms_monitor/domain/measurement/measurement_failure.dart';
import 'package:symptoms_monitor/domain/profiles/profile_failure.dart';
import 'package:symptoms_monitor/models/profile/profile.dart';

abstract class IProfileRepository {
  Future<Either<ProfileFailure, Unit>> saveProfile(Profile profiles);
  Future<Either<ProfileFailure, Unit>> getProfiles();
}
