import 'package:dartz/dartz.dart';
import 'package:symptoms_monitor/domain/measurement/measurement_failure.dart';
import 'package:symptoms_monitor/models/profile/profile.dart';

abstract class IProfileRepository {
  Future<Either<MeasurementFailure, Unit>> saveProfiles(List<Profile> profiles);
  Future<Either<MeasurementFailure, Unit>> getProfiles();
}
