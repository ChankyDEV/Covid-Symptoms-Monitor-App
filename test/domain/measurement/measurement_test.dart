import 'package:flutter_test/flutter_test.dart';
import 'package:symptoms_monitor/domain/measurement/measurement_dto.dart';
import 'package:symptoms_monitor/models/measurement/measurement.dart';
import 'package:symptoms_monitor/models/measurement/pulse.dart';
import 'package:symptoms_monitor/models/measurement/saturation.dart';
import 'package:symptoms_monitor/models/measurement/temperature.dart';

void main() {
  final date = DateTime(2020, 11, 05);
  final measurement = Measurement.withDate(
      pulse: Pulse(value: 74),
      temperature: Temperature(value: 36.6),
      saturation: Saturation(value: 90),
      date: date);

  final measurementDTO = MeasurementDTO(
      pulse: 74,
      temperature: 36.6,
      saturation: 90,
      date: date.toString());

  group('fromDomain', () {
    test('should return valid measurement model from his DTO', () {
      final result = Measurement.fromDomain(measurementDTO);
      expect(result.pulse.value, measurement.pulse.value);
      expect(result.temperature.value, measurement.temperature.value);
      expect(result.saturation.value, measurement.saturation.value);
      expect(result.date, measurement.date);
    });
  });

  group('toDomain', () {
    test('should return DTO from valid measurement model', () {
      final result = MeasurementDTO.toDomain(measurement);

      expect(result.pulse, measurementDTO.pulse);
      expect(result.temperature, measurementDTO.temperature);
      expect(result.saturation, measurementDTO.saturation);
      expect(result.date, measurementDTO.date);
    });
  });
}
