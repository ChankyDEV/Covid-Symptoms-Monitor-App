import 'dart:convert';
import 'package:flutter/material.dart';

class HeartRate {
  final int value;

  HeartRate({@required this.value});

  Map<String, dynamic> toMap() {
    return {
      'value': value,
    };
  }

  factory HeartRate.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return HeartRate(
      value: map['value'],
    );
  }

  String toJson() => json.encode(toMap());

  factory HeartRate.fromJson(String source) =>
      HeartRate.fromMap(json.decode(source));
}
