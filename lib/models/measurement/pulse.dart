import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Pulse implements Equatable {
  final int value;

  Pulse({@required this.value});

  Map<String, dynamic> toMap() {
    return {
      'value': value,
    };
  }

  factory Pulse.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Pulse(
      value: map['value'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Pulse.fromJson(String source) =>
      Pulse.fromMap(json.decode(source));

  @override
  List<Object> get props => [value];

  @override
  bool get stringify => true;
}
