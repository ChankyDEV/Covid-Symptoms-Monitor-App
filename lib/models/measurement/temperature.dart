import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Temperature implements Equatable {
  final double value;

  Temperature({@required this.value});

  Map<String, dynamic> toMap() {
    return {
      'value': value,
    };
  }

  factory Temperature.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Temperature(
      value: map['value'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Temperature.fromJson(String source) =>
      Temperature.fromMap(json.decode(source));

  @override
  List<Object> get props => [value];

  @override
  bool get stringify => true;
}
