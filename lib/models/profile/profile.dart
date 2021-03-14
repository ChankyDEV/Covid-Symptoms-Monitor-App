import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:symptoms_monitor/models/profile/gender_enum.dart';

class Profile extends Equatable {
  final String name;
  final String imageUrl;
  final bool hasImage;
  final Gender gender;
  final PickedFile avatar;

  Profile(
      {@required this.name,
      @required this.imageUrl,
      @required this.hasImage,
      @required this.gender,
      this.avatar});

  factory Profile.empty() {
    return Profile(
      hasImage: false,
      imageUrl: '',
      name: '',
      gender: Gender.none,
    );
  }

  bool isEmpty() {
    if (this.imageUrl == '' && this.name == '') {
      return true;
    }
    return false;
  }

  @override
  List<Object> get props => [name, imageUrl, hasImage, gender, avatar];

  Profile copyWith({
    String name,
    String imageUrl,
    bool hasImage,
    PickedFile avatar,
  }) {
    return Profile(
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      hasImage: hasImage ?? this.hasImage,
      gender: gender ?? this.gender,
      avatar: avatar ?? this.avatar,
    );
  }
}
