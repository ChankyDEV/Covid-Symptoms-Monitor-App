import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:symptoms_monitor/domain/measurement/measurement_dto.dart';
import 'package:symptoms_monitor/models/measurement/saturation.dart';
import 'package:symptoms_monitor/models/measurement/pulse.dart';
import 'package:symptoms_monitor/models/measurement/temperature.dart';

class Measurement implements Equatable {
  final Pulse pulse;
  final Temperature temperature;
  final Saturation saturation;
  final DateTime date;

  Measurement.withDate(
      {@required this.pulse,
      @required this.temperature,
      @required this.saturation,
      this.date});

  Measurement(
      {@required this.pulse,
      @required this.temperature,
      @required this.saturation})
      : this.date = DateTime.now();

  factory Measurement.fromDomain(MeasurementDTO measurement) {
    return Measurement.withDate(
        pulse: Pulse(value: measurement.pulse),
        temperature: Temperature(value: measurement.temperature),
        saturation: Saturation(value: measurement.saturation),
        date: DateFormat("yyyy.MM.dd HH:mm").parse(measurement.date)
        
        );
  }
  factory Measurement.empty() {
    return Measurement(
      pulse: Pulse(value: 0),
      temperature: Temperature(value: 0.0),
      saturation: Saturation(value: 0),
    );
  }

  @override
  List<Object> get props => [pulse, temperature, saturation, date];

  @override
  bool get stringify => true;
}
