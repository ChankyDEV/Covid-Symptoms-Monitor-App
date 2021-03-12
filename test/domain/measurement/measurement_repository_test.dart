import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:symptoms_monitor/domain/measurement/i_measurement_repsitory.dart';
import 'package:symptoms_monitor/models/measurement/blood_saturation.dart';
import 'package:symptoms_monitor/models/measurement/heart_rate.dart';
import 'package:symptoms_monitor/models/measurement/measurement.dart';
import 'package:symptoms_monitor/models/measurement/temperature.dart';

import 'usecase.dart';

class MockMeasurementRepository extends Mock implements IMeasurementRepository {
}

void main() {
  MockMeasurementRepository repository;
  GetAll usecase;

  setUp(() {
    repository = MockMeasurementRepository();
    usecase = GetAll(repository);
  });

  final tListOfMeasurements = [
    Measurement(
        heartRate: HeartRate(value: 74),
        temperature: Temperature(value: 36.6),
        bloodSaturation: BloodSaturation(value: 93))
  ];

  test('should get list of measurements from repository', () async {
    when(repository.getAll())
        .thenAnswer((_) async => right(tListOfMeasurements));

    final result = await usecase.execute();

    expect(result, right(tListOfMeasurements));
    verify(repository.getAll());
    verifyNoMoreInteractions(repository);
  });

  final measurement = Measurement(
      heartRate: HeartRate(value: 74),
      temperature: Temperature(value: 36.6),
      bloodSaturation: BloodSaturation(value: 93));
  test('should get unit from repository after create new measurement',
      () async {
    when(repository.create(measurement)).thenAnswer((_) async => right(unit));

    final result = await usecase.executeCreate(measurement);

    expect(result, right(unit));
    verify(repository.create(measurement));
    verifyNoMoreInteractions(repository);
  });

  test('should return (limited) list of measurements from repository',
      () async {
    when(repository.getLimited())
        .thenAnswer((_) async => right(tListOfMeasurements));

    final result = await usecase.executeLimit();

    expect(result, right(tListOfMeasurements));
    verify(repository.getLimited());
    verifyNoMoreInteractions(repository);
  });
}
