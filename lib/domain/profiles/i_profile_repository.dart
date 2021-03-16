import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:symptoms_monitor/domain/profiles/profile_failure.dart';
import 'package:symptoms_monitor/models/profile/profile.dart';

abstract class IProfileRepository {
  Future<Either<ProfileFailure, Unit>> saveProfile(Profile profile);
  Future<Either<ProfileFailure, List<Profile>>> getProfiles();
  Future<Either<ProfileFailure, PickedFile>> getImage();
  void chooseProfile(Profile profile);
  Profile getActualProfile();
}
