import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:symptoms_monitor/domain/profiles/i_profile_repository.dart';
import 'package:symptoms_monitor/domain/profiles/profile_repository.dart';
import 'package:symptoms_monitor/models/profile/gender_enum.dart';
import 'package:symptoms_monitor/models/profile/profile.dart';

import 'profile_usecases.dart';

class MockProfileRepository extends Mock implements IProfileRepository {}

void main() {
  MockProfileRepository repository;
  ProfileUsecases usecase;
  setUp(() {
    repository = MockProfileRepository();
    usecase = ProfileUsecases(repository);
  });

  final profile = Profile(
    name: 'Kamil',
    gender: Gender.male,
    hasImage: false,
  );

  test('should get unit from repository while saving profile', () async {
    when(repository.saveProfile(profile)).thenAnswer((_) async => right(unit));

    final infoAboutSaving = await usecase.save(profile);

    expect(infoAboutSaving, right(unit));
    verify(repository.saveProfile(profile));
    verifyNoMoreInteractions(repository);
  });

  final profiles = [
    Profile(
      name: 'Kamil',
      gender: Gender.male,
      hasImage: false,
    ),
    Profile(
      name: 'Ania',
      gender: Gender.female,
      hasImage: false,
    )
  ];

  test('should get list of profiles from repository', () async {
    when(repository.getProfiles()).thenAnswer((_) async => right(profiles));

    final infoAboutGetting = await usecase.getProfiles();

    expect(infoAboutGetting, right(profiles));
    verify(repository.getProfiles());
    verifyNoMoreInteractions(repository);
  });

  test('should return profile from repository if exists', () async {
    when(repository.getActualProfile()).thenAnswer((_) => profile);

    final infoAboutProfile = repository.getActualProfile();

    expect(infoAboutProfile, profile);
    verify(repository.getActualProfile());
    verifyNoMoreInteractions(repository);
  });

  test('should return empty profile from repository if not exists', () async {
    when(repository.getActualProfile()).thenAnswer((_) => Profile.empty());
    final infoAboutProfile = repository.getActualProfile();

    expect(infoAboutProfile, Profile.empty());
    verify(repository.getActualProfile());
    verifyNoMoreInteractions(repository);
  });
}
