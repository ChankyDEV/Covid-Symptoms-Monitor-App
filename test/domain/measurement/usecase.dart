import 'package:dartz/dartz.dart';
import 'package:symptoms_monitor/domain/measurement/i_measurement_repsitory.dart';
import 'package:symptoms_monitor/domain/measurement/measurement_failure.dart';
import 'package:symptoms_monitor/models/measurement/measurement.dart';

class GetAll {
  final IMeasurementRepository repository;

  GetAll(this.repository);

  Future<Either<MeasurementFailure, List<Measurement>>> execute() async {
    return await repository.getAll();
  }

  Future<Either<MeasurementFailure, Unit>> executeCreate(
      Measurement measurement) async {
    return await repository.create(measurement);
  }

  Future<Either<MeasurementFailure, List<Measurement>>> executeLimit() async {
    return await repository.getLimited(2);
  }
}
