import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:symptoms_monitor/models/measurement/measurement.dart';

class MeasurementDTO implements Equatable {
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
  List<Object> get props => [heartRate, temperature, bloodSaturation, date];

  @override
  bool get stringify => true;
}
