import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:symptoms_monitor/models/profile/gender_enum.dart';

class Profile extends Equatable {
  final String name;
  final String imageUrl;
  final bool hasImage;
  final Gender gender;

  Profile({
    @required this.name,
    @required this.imageUrl,
    @required this.hasImage,
    @required this.gender,
  });

  factory Profile.empty() {
    return Profile(
      hasImage: false,
      imageUrl: '',
      name: '',
      gender: Gender.none,
    );
  }

  bool isEmpty() {
    if (this.hasImage == false && this.imageUrl == '' && this.name == '') {
      return true;
    }
    return false;
  }

  @override
  List<Object> get props => [name, imageUrl, hasImage, gender];

  Profile copyWith({
    String name,
    String imageUrl,
    bool hasImage,
  }) {
    return Profile(
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      hasImage: hasImage ?? this.hasImage,
      gender: gender ?? this.gender,
    );
  }
}
