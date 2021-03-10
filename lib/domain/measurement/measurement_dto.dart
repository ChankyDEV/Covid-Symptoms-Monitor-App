import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:symptoms_monitor/models/measurement/measurement.dart';

class MeasurementDTO {
  final int heartRate;
  final double temperature;
  final int bloodSaturation;
  final String date;
  MeasurementDTO({
    this.heartRate,
    this.temperature,
    this.bloodSaturation,
    this.date,
  });

  factory MeasurementDTO.toDomain(Measurement measurement) {
    return MeasurementDTO(
        heartRate: measurement.heartRate.value,
        temperature: measurement.temperature.value,
        bloodSaturation: measurement.bloodSaturation.value,
        date: measurement.date.toString());
  }

  factory MeasurementDTO.fromFirestore(DocumentSnapshot doc) {
    return MeasurementDTO.fromMap(doc.data());
  }

  MeasurementDTO copyWith({
    int heartRate,
    double temperature,
    int bloodSaturation,
    String date,
  }) {
    return MeasurementDTO(
      heartRate: heartRate ?? this.heartRate,
      temperature: temperature ?? this.temperature,
      bloodSaturation: bloodSaturation ?? this.bloodSaturation,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'heartRate': heartRate,
      'temperature': temperature,
      'bloodSaturation': bloodSaturation,
      'date': date,
    };
  }

  factory MeasurementDTO.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return MeasurementDTO(
      heartRate: map['heartRate'],
      temperature: map['temperature'],
      bloodSaturation: map['bloodSaturation'],
      date: map['date'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MeasurementDTO.fromJson(String source) =>
      MeasurementDTO.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MeasurementDTO(heartRate: $heartRate, temperature: $temperature, bloodSaturation: $bloodSaturation, date: $date)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is MeasurementDTO &&
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
