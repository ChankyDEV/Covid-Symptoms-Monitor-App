import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:email_validator/email_validator.dart';
import 'package:injectable/injectable.dart';
import 'package:symptoms_monitor/domain/registration/auth_failure.dart';
import 'package:symptoms_monitor/domain/registration/i_authenticate_repository.dart';
import 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final IAuthRepository _authRepository;
  AuthCubit(this._authRepository) : super(AuthState.empty());

  Future login() async {
    if (state.password.isNotEmpty | state.email.isNotEmpty) {
      if (EmailValidator.validate(state.email)) {
        Either<AuthFailure, Unit> loginResult =
            await _authRepository.login(state.email, state.password);
        loginResult.fold(
            (l) => emit(state.copyWith(
                isCorrect: false, errorText: mapAuthFaiulureToString(l))),
            (r) => emit(state.copyWith(isCorrect: true, canGo: true)));
      } else {
        emit(state.copyWith(
            isCorrect: false, errorText: "Podano e-mail w złym formacie"));
      }
    } else {
      emit(state.copyWith(
          isCorrect: false, errorText: "Uzupełnij wszystkie pola"));
    }
  }

  Future register() async {
    if (state.password.isNotEmpty ||
        state.email.isNotEmpty ||
        state.passwordRe.isNotEmpty) {
      if (state.password == state.passwordRe) {
        if (EmailValidator.validate(state.email)) {
          Either<AuthFailure, Unit> registerResult =
              await _authRepository.register(state.email, state.password);
          registerResult.fold(
              (l) => emit(state.copyWith(
                  isCorrect: false, errorText: mapAuthFaiulureToString(l))),
              (r) => emit(state.copyWith(isCorrect: true, canGo: true)));
        } else {
          emit(state.copyWith(
              isCorrect: false, errorText: "Podano e-mail w złym formacie"));
        }
      } else {
        emit(state.copyWith(
            isCorrect: false, errorText: "Hasła muszą być identyczne"));
      }
    } else {
      emit(state.copyWith(
          isCorrect: false, errorText: "Uzupełnij wszystkie pola"));
    }
  }

  void emailChanged(String emailQuery) {
    emit(state.copyWith(email: emailQuery, isCorrect: true, canGo: false));
  }

  void passwordChanged(String passwordQuery) {
    emit(
        state.copyWith(password: passwordQuery, isCorrect: true, canGo: false));
  }

  void passwordReChanged(String passwordReQuery) {
    emit(state.copyWith(
        passwordRe: passwordReQuery, isCorrect: true, canGo: false));
  }
}
