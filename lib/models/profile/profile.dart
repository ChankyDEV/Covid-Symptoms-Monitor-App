import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

import 'package:symptoms_monitor/models/profile/gender_enum.dart';

class Profile extends Equatable {
  final String name;
  final bool hasImage;
  final Gender gender;
  final PickedFile avatar;

  Profile(
      {@required this.name, @required this.hasImage, this.gender, this.avatar});

  @override
  List<Object> get props => [name, hasImage];

  @override
  bool get stringify => false;

  factory Profile.empty() {
    return Profile(
      hasImage: false,
      name: '',
      gender: Gender.none,
    );
  }

  bool isEmpty() {
    if (this.hasImage == false &&
        this.name == '' &&
        this.gender == Gender.none) {
      return true;
    } else {
      return false;
    }
  }

  Profile copyWith({
    String name,
    bool hasImage,
    PickedFile avatar,
  }) {
    return Profile(
      name: name ?? this.name,
      hasImage: hasImage ?? this.hasImage,
      gender: gender ?? this.gender,
      avatar: avatar ?? this.avatar,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'hasImage': hasImage,
      'gender': gender.toString(),
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      name: map['name'],
      hasImage: map['hasImage'],
      gender: _stringToGender(map['gender']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Profile.fromJson(String source) =>
      Profile.fromMap(json.decode(source));
}

Gender _stringToGender(String input) {
  switch (input) {
    case 'male':
      return Gender.male;
      break;
    case 'female':
      return Gender.female;
      break;
    case 'none':
      return Gender.none;
      break;
    default:
      return null;
  }
}
