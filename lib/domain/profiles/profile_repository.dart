import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:symptoms_monitor/domain/profiles/i_profile_repository.dart';
import 'package:symptoms_monitor/domain/profiles/profile_failure.dart';
import 'package:symptoms_monitor/domain/registration/i_authenticate_repository.dart';
import 'package:symptoms_monitor/inject.dart';
import 'package:symptoms_monitor/models/profile/profile.dart';

@LazySingleton(as: IProfileRepository)
class ProfileRepository implements IProfileRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  @override
  Future<Either<ProfileFailure, Unit>> getProfiles() {}

  @override
  Future<Either<ProfileFailure, Unit>> saveProfile(Profile profile) async {
    var result = await getIt<IAuthRepository>().getSignedInUser();
    String uid;

    if (result.isSome()) {
      uid = result.getOrElse(() => null).uid;

      var infoAboutAddingProfiles;

      infoAboutAddingProfiles = await _firestore
          .collection('families')
          .doc(uid)
          .collection('profiles')
          .add(profile.toMap())
          .then((value) => unit)
          .catchError((onError) => ProfileFailure());

      if (infoAboutAddingProfiles is Unit) {
        if (profile.hasImage) {
          Either<ProfileFailure, Unit> infoAboutImage;
          infoAboutImage = await _savePhotoToFirebase(profile, uid);

          if (infoAboutImage.isRight()) {
            return right(unit);
          } else {
            return left(ProfileFailure());
          }
        }
        return right(unit);
      } else {
        return left(ProfileFailure());
      }
    } else {
      return left(ProfileFailure());
    }
  }

  Future<Either<ProfileFailure, Unit>> _savePhotoToFirebase(
      Profile profile, String uid) async {
    try {
      var ref = _storage.ref().child(uid).child('/${profile.name}');
      ref.putFile(File(profile.avatar.path));

      return right(unit);
    } on FirebaseException catch (e) {
      return left(ProfileFailure());
    }
  }
}
