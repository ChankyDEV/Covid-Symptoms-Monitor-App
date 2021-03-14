import 'package:freezed_annotation/freezed_annotation.dart';
part 'auth_failure.freezed.dart';

@freezed
abstract class AuthFailure with _$AuthFailure {
  const factory AuthFailure.serverError() = ServerError;
  const factory AuthFailure.emailAlreadyInUse() = EmailAlreadyInUse;
  const factory AuthFailure.wrongPassword() = WrongPassword;
  const factory AuthFailure.invalidEmailAndPasswordCombination() =
      InvalidEmailAndPasswordCombination;
}

String mapAuthFaiulureToString(AuthFailure failure) {
  return failure.when(
      wrongPassword: () => "Podano złe hasło",
      serverError: () => "Błąd serwera",
      emailAlreadyInUse: () => "Podany email już zarejestrowany",
      invalidEmailAndPasswordCombination: () => "Nie odnaleziono danego konta");
}
