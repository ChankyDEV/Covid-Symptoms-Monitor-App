import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:symptoms_monitor/domain/measurement/i_measurement_repsitory.dart';
import 'package:symptoms_monitor/domain/measurement/measurement_dto.dart';
import 'package:symptoms_monitor/domain/measurement/measurement_failure.dart';
import 'package:symptoms_monitor/models/measurement/measurement.dart';

@LazySingleton(as: IMeasurementRepository)
class MeasurementRepository implements IMeasurementRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _uid = "User ID";
  final _profileName = "profiles name";

  @override
  Future<Either<MeasurementFailure, List<Measurement>>> getAll() async {
    try {
      var list = await _firestore
          .collection('families')
          .doc('OZUGLMzwLl8Y5ogZPVCy')
          .collection('Anna')
          .orderBy('date', descending: true)
          .get()
          .then((snapshot) => _fromFirebaseQuery(snapshot));

      return right(list);
    } catch (e) {
      return left(MeasurementFailure());
    }
  }

  @override
  Future<Either<MeasurementFailure, List<Measurement>>> getLimited() async {
    try {
      var list = await _firestore
          .collection('families')
          .doc('OZUGLMzwLl8Y5ogZPVCy')
          .collection('Anna')
          .orderBy('date', descending: true)
          .limit(5)
          .get()
          .then((snapshot) => _fromFirebaseQuery(snapshot));

      return right(list);
    } catch (e) {
      return left(MeasurementFailure());
    }
  }

  List<Measurement> _fromFirebaseQuery(QuerySnapshot snapshot) {
    List<Measurement> measurements = [];
    snapshot.docs.forEach((doc) {
      measurements
          .add(Measurement.fromDomain(MeasurementDTO.fromFirestore(doc)));
    });
    return measurements;
  }

  @override
  Future<Either<MeasurementFailure, Unit>> create(
      Measurement measurement) async {
    final measurementDTO = MeasurementDTO.toDomain(measurement);
    try {
      var result = await _firestore
          .collection('families')
          .doc(_uid)
          .collection(_profileName)
          .add(measurementDTO.toMap())
          .then((value) => unit);

      return right(result);
    } on FirebaseException catch (_) {
      return left(MeasurementFailure());
    }
  }
}
