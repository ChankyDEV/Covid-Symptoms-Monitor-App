import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:symptoms_monitor/domain/measurement/measurement_dto.dart';
import 'package:symptoms_monitor/models/measurement/blood_saturation.dart';
import 'package:symptoms_monitor/models/measurement/heart_rate.dart';
import 'package:symptoms_monitor/models/measurement/temperature.dart';

class Measurement {
  final HeartRate heartRate;
  final Temperature temperature;
  final BloodSaturation bloodSaturation;
  DateTime date;

  Measurement._(
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
    return Measurement._(
        heartRate: HeartRate(value: measurement.heartRate),
        temperature: Temperature(value: measurement.temperature),
        bloodSaturation: BloodSaturation(value: measurement.bloodSaturation),
        date: DateTime.parse(measurement.date));
  }

  Measurement copyWith({
    HeartRate heartRate,
    Temperature temperature,
    BloodSaturation bloodSaturation,
    DateTime date,
  }) {
    return Measurement._(
      heartRate: heartRate ?? this.heartRate,
      temperature: temperature ?? this.temperature,
      bloodSaturation: bloodSaturation ?? this.bloodSaturation,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'heartRate': heartRate?.toMap(),
      'temperature': temperature?.toMap(),
      'bloodSaturation': bloodSaturation?.toMap(),
      'date': date?.millisecondsSinceEpoch,
    };
  }

  factory Measurement.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Measurement._(
      heartRate: HeartRate.fromMap(map['heartRate']),
      temperature: Temperature.fromMap(map['temperature']),
      bloodSaturation: BloodSaturation.fromMap(map['bloodSaturation']),
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Measurement.fromJson(String source) =>
      Measurement.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Measurement(heartRate: $heartRate, temperature: $temperature, bloodSaturation: $bloodSaturation, date: $date)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Measurement &&
        o.heartRate == heartRate &&
        o.temperature == temperature &&
        o.bloodSaturation == bloodSaturation &&
        o.date == date;
  }

  @override
  int get hashCode {
    return heartRate.hashCode ^
        temperature.hashCode ^
        bloodSaturation.hashCode ^
        date.hashCode;
  }
}
