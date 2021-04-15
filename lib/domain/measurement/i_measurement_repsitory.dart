import 'package:dartz/dartz.dart';
import 'package:symptoms_monitor/models/measurement/measurement.dart';
import 'measurement_failure.dart';

abstract class IMeasurementRepository {
  Future<Either<MeasurementFailure, Unit>> create(Measurement measurement);
  Future<Either<MeasurementFailure, List<Measurement>>> getAll();
  Future<Either<MeasurementFailure, List<Measurement>>> getLimited(int limit);
}
