import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import 'package:symptoms_monitor/models/measurement/measurement.dart';

class MeasurementDTO implements Equatable {
  final int pulse;
  final double temperature;
  final int saturation;
  final String date;
  String id;

  MeasurementDTO({
    this.pulse,
    this.temperature,
    this.saturation,
    this.date,
  });

  factory MeasurementDTO.toDomain(Measurement measurement) {
    return MeasurementDTO(
      pulse: measurement.pulse.value,
      temperature: measurement.temperature.value,
      saturation: measurement.saturation.value,
    );
  }

  factory MeasurementDTO.fromFirestore(DocumentSnapshot doc) {
    return MeasurementDTO.fromMap(doc.data());
  }

  Map<String, dynamic> toMap() {
    return {
      'pulse': pulse,
      'temperature': temperature,
      'saturation': saturation,
      'date': date,
    };
  }

  factory MeasurementDTO.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return MeasurementDTO(
      pulse: map['pulse'],
      temperature: map['temperature'],
      saturation: map['saturation'],
      date: map['date'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MeasurementDTO.fromJson(String source) =>
      MeasurementDTO.fromMap(json.decode(source));

  @override
  List<Object> get props => [pulse, temperature, saturation, date];

  @override
  bool get stringify => true;

  @override
  String toString() {
    return 'MeasurementDTO(pulse: $pulse, temperature: $temperature, saturation: $saturation, date: $date)';
  }
}
