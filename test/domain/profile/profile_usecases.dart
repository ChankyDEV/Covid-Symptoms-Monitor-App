import 'package:dartz/dartz.dart';
import 'package:symptoms_monitor/domain/profiles/i_profile_repository.dart';
import 'package:symptoms_monitor/domain/profiles/profile_failure.dart';
import 'package:symptoms_monitor/models/profile/profile.dart';

class ProfileUsecases {
  final IProfileRepository repository;

  ProfileUsecases(this.repository);

  Future<Either<ProfileFailure, Unit>> save(Profile profile) async {
    return repository.saveProfile(profile);
  }

  Future<Either<ProfileFailure, List<Profile>>> getProfiles() async {
    return repository.getProfiles();
  }
}
