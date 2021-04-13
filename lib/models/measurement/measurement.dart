import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:symptoms_monitor/domain/measurement/measurement_dto.dart';
import 'package:symptoms_monitor/models/measurement/blood_saturation.dart';
import 'package:symptoms_monitor/models/measurement/heart_rate.dart';
import 'package:symptoms_monitor/models/measurement/temperature.dart';

class Measurement implements Equatable {
  final HeartRate heartRate;
  final Temperature temperature;
  final BloodSaturation bloodSaturation;
  final DateTime date;

  Measurement.withDate(
      {@required this.heartRate,
      @required this.temperature,
      @required this.bloodSaturation,
      this.date});

  Measurement(
      {@required this.heartRate,
      @required this.temperature,
      @required this.bloodSaturation})
      : this.date = DateTime.now();

  factory Measurement.fromDomain(MeasurementDTO measurement) {
    return Measurement.withDate(
        heartRate: HeartRate(value: measurement.heartRate),
        temperature: Temperature(value: measurement.temperature),
        bloodSaturation: BloodSaturation(value: measurement.bloodSaturation),
        date: DateTime.parse(measurement.date));
  }
  factory Measurement.empty() {
    return Measurement(
      heartRate: HeartRate(value: 0),
      temperature: Temperature(value: 0.0),
      bloodSaturation: BloodSaturation(value: 0),
    );
  }

  @override
  List<Object> get props => [heartRate, temperature, bloodSaturation, date];

  @override
  bool get stringify => true;
}
