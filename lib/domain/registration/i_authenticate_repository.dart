import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:symptoms_monitor/domain/registration/auth_failure.dart';

abstract class IAuthRepository {
  Future<Either<AuthFailure, Unit>> login(String email, String password);
  Future<Either<AuthFailure, Unit>> register(String email, String password);
  Future<void> logout();
  Future<Option<User>> getSignedInUser();
  Stream<User> onAuthStateChanged();
}
