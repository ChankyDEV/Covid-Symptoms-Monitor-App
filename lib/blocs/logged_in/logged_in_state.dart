import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'logged_in_state.freezed.dart';

@freezed
abstract class LoggedInState with _$LoggedInState {
  const factory LoggedInState.unauthenticated() = Unauthenticated;
  const factory LoggedInState.authenticated(User user) = Authenticated;
}