import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class BloodSaturation implements Equatable {
  final int value;

  BloodSaturation({@required this.value});

  @override
  List<Object> get props => [value];

  @override
  bool get stringify => true;
}
