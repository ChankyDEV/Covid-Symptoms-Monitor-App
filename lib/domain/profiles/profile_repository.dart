import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
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

  Profile _profile;

  Profile get actualProfile {
    return this._profile;
  }

  set actualProfile(Profile profile) {
    this._profile = profile;
  }

  @override
  void chooseProfile(Profile profile) {
    actualProfile = profile;
  }

  @override
  Profile getActualProfile() {
    return actualProfile != null ? actualProfile : Profile.empty();
  }

  @override
  Future<Either<ProfileFailure, List<Profile>>> getProfiles() async {
    var user = await getIt<IAuthRepository>().getSignedInUser();

    if (user.isSome()) {
      String uid = user.getOrElse(() => null).uid;

      final infoAboutListOfProfiles = await _firestore
          .collection('families')
          .doc(uid)
          .collection('profiles')
          .get()
          .then((query) => _queryToProfiles(query))
          .catchError((onError) => ProfileFailure());

      if (infoAboutListOfProfiles is List<Profile>) {
        return right(infoAboutListOfProfiles);
      } else {
        return left(ProfileFailure());
      }
    } else {
      return left(ProfileFailure());
    }
  }

  @override
  Future<Either<ProfileFailure, Unit>> saveProfile(Profile profile) async {
    var user = await getIt<IAuthRepository>().getSignedInUser();

    if (user.isSome()) {
      String uid = user.getOrElse(() => null).uid;

      final infoAboutAddingProfiles = await _firestore
          .collection('families')
          .doc(uid)
          .collection('profiles')
          .add(profile.toMap())
          .then((value) => unit)
          .catchError((onError) => ProfileFailure());

      if (infoAboutAddingProfiles is Unit) {
        if (profile.hasImage) {
          final infoAboutImage = await _savePhotoToFirebase(profile, uid);

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

  @override
  Future<Either<ProfileFailure, PickedFile>> getImage() async {
    ImagePicker imagePicker = ImagePicker();

    try {
      final infoAboutTakenPhoto =
          await imagePicker.getImage(source: ImageSource.gallery);

      return right(infoAboutTakenPhoto);
    } on Exception catch (e) {
      return left(ProfileFailure());
    }
  }

  List<Profile> _queryToProfiles(QuerySnapshot snapshot) {
    List<Profile> profiles = [];
    snapshot.docs.forEach((doc) {
      profiles.add(Profile.fromMap(doc.data()));
    });
    return profiles;
  }
}
