import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:symptoms_monitor/domain/measurement/measurement_dto.dart';
import 'package:symptoms_monitor/models/measurement/pulse.dart';
import 'package:symptoms_monitor/models/measurement/saturation.dart';
import 'package:symptoms_monitor/models/measurement/temperature.dart';

class Measurement implements Equatable {
  final Pulse pulse;
  final Temperature temperature;
  final Saturation saturation;
  final DateTime date;
  final String id;

  Measurement.withDate(
      {@required this.pulse,
      @required this.temperature,
      @required this.saturation,
      this.id,
      this.date});

  Measurement(
      {@required this.pulse,
      @required this.temperature,
      this.id,
      @required this.saturation})
      : this.date = DateTime.now();

  factory Measurement.fromDomain(MeasurementDTO measurement) {
    return Measurement.withDate(
        pulse: Pulse(value: measurement.pulse),
        id : measurement.id,
        temperature: Temperature(value: measurement.temperature),
        saturation: Saturation(value: measurement.saturation),
        date: DateFormat("yyyy.MM.dd HH:mm").parse(measurement.date));
  }
  factory Measurement.empty() {
    return Measurement(
      pulse: Pulse(value: 0),
      id : "",
      temperature: Temperature(value: 0.0),
      saturation: Saturation(value: 0),
    );
  }

  @override
  List<Object> get props => [pulse, temperature, saturation, date,id];

  @override
  bool get stringify => true;

  @override
  String toString() {
    return 'Measurement(pulse: $pulse, temperature: $temperature, saturation: $saturation, date: $date)';
  }
}
