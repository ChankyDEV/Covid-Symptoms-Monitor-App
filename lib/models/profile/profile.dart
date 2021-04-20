import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:symptoms_monitor/models/profile/gender_enum.dart';

part 'profile.g.dart';

@HiveType(typeId: 0)
class Profile extends Equatable {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final bool hasImage;
  @HiveField(2)
  final String gender;
  @HiveField(3)
  final PickedFile avatar;
  @HiveField(4)
  String uid;

  Profile(
      {@required this.name,
      @required this.hasImage,
      this.gender,
      this.avatar,
      this.uid});

  @override
  List<Object> get props => [name, hasImage];

  @override
  bool get stringify => true;

  factory Profile.empty() {
    return Profile(
      hasImage: false,
      name: '',
      uid: '',
      gender: 'none',
    );
  }

  bool isEmpty() {
    if (this.hasImage == false && this.name == '' && this.gender == 'none') {
      return true;
    } else {
      return false;
    }
  }

  Profile copyWith({
    String name,
    bool hasImage,
    String uid,
    PickedFile avatar,
  }) {
    return Profile(
      name: name ?? this.name,
      uid: uid ?? this.uid,
      hasImage: hasImage ?? this.hasImage,
      gender: gender ?? this.gender,
      avatar: avatar ?? this.avatar,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'hasImage': hasImage,
      'uid': uid,
      'gender': gender.toString(),
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      name: map['name'],
      uid: map['uid'],
      hasImage: map['hasImage'],
      gender: _stringToGender(map['gender']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Profile.fromJson(String source) =>
      Profile.fromMap(json.decode(source));
}

String _stringToGender(String input) {
  switch (input) {
    case 'Gender.male':
      return 'male';
      break;
    case 'Gender.female':
      return 'female';
      break;
    case 'Gender.none':
      return 'none';
      break;
    case 'male':
      return 'male';
      break;
    case 'female':
      return 'female';
      break;
    case 'none':
      return 'none';
      break;
    default:
      return null;
  }
}
