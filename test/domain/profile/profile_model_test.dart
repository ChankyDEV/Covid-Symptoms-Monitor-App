import 'package:flutter_test/flutter_test.dart';
import 'package:symptoms_monitor/models/profile/gender_enum.dart';
import 'package:symptoms_monitor/models/profile/profile.dart';

void main() {
  final profile = Profile(
    name: 'Kamil',
    hasImage: true,
    gender: Gender.male,
  );

  test('fromMap', () {
    final map = {
      'name': 'Kamil',
      'hasImage': true,
      'gender': Gender.male.toString(),
    };

    var result = Profile.fromMap(map);

    expect(result, equals(profile));
  });

  test('toMap', () {
    final map = {
      'name': 'Kamil',
      'hasImage': true,
      'gender': Gender.male.toString(),
    };

    var result = profile.toMap();

    expect(result, equals(map));
  });
}
