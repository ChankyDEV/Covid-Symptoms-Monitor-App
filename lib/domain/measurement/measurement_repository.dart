import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:symptoms_monitor/domain/measurement/i_measurement_repsitory.dart';
import 'package:symptoms_monitor/domain/measurement/measurement_dto.dart';
import 'package:symptoms_monitor/domain/measurement/measurement_failure.dart';
import 'package:symptoms_monitor/domain/registration/i_authenticate_repository.dart';
import 'package:symptoms_monitor/inject.dart';
import 'package:symptoms_monitor/models/measurement/measurement.dart';

@LazySingleton(as: IMeasurementRepository)
class MeasurementRepository implements IMeasurementRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<Either<MeasurementFailure, List<Measurement>>> getAll() async {
    final user = await _getUser();
    String uid = user.getOrElse(() => null).uid;

    String myID = Hive.box("User").get("current").uid;

    if (user.isSome()) {
      final infoAboutListOfMeasurements = await _firestore
          .collection('families')
          .doc(uid)
          .collection('profiles')
          .doc(myID)
          .collection('measurement')
          .orderBy('date', descending: true)
          .get()
          .then((snapshot) => _fromFirebaseQuery(snapshot))
          .catchError((onError) => null);

      if (infoAboutListOfMeasurements is List<Measurement>) {
        return right(infoAboutListOfMeasurements);
      } else {
        return left(MeasurementFailure());
      }
    } else {
      return left(MeasurementFailure());
    }
  }

  @override
  Future<Either<MeasurementFailure, List<Measurement>>> getLimited(
      int limit) async {
    final user = await _getUser();
    String uid = user.getOrElse(() => null).uid;
    String myID = Hive.box("User").get("current").uid;

    if (user.isSome()) {
      final infoAboutListOfMeasurements = await _firestore
          .collection('families')
          .doc(uid)
          .collection('profiles')
          .doc(myID)
          .collection('measurement')
          .orderBy('date', descending: true)
          .limit(limit)
          .get()
          .then((snapshot) => _fromFirebaseQuery(snapshot))
          .catchError((onError) => MeasurementFailure());

      if (infoAboutListOfMeasurements is List<Measurement>) {
        return right(infoAboutListOfMeasurements);
      } else {
        return left(MeasurementFailure());
      }
    } else {
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
    final user = await _getUser();
    String uid = user.getOrElse(() => null).uid;
    String myID = Hive.box("User").get("current").uid;

    final measurementDTO = MeasurementDTO.toDomain(measurement);

    if (user.isSome()) {
      final infoAboutCreatingMeasurement = await _firestore
          .collection('families')
          .doc(uid)
          .collection('profiles')
          .doc(myID)
          .collection('measurement')
          .add(measurementDTO.toMap())
          .then((value) => unit)
          .catchError((onError) => MeasurementFailure());

      if (infoAboutCreatingMeasurement is Unit) {
        return right(unit);
      } else {
        return left(MeasurementFailure());
      }
    }else {
        return left(MeasurementFailure());
      }
  }

  Future<Option<User>> _getUser() async {
    return await getIt<IAuthRepository>().getSignedInUser();
  }
}
