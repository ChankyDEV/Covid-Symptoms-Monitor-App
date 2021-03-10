import 'dart:convert';

import 'package:flutter/material.dart';

class BloodSaturation {
  final int value;

  BloodSaturation({@required this.value});

  Map<String, dynamic> toMap() {
    return {
      'value': value,
    };
  }

  factory BloodSaturation.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return BloodSaturation(
      value: map['value'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BloodSaturation.fromJson(String source) =>
      BloodSaturation.fromMap(json.decode(source));
}
