import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:symptoms_monitor/domain/registration/i_authenticate_repository.dart';
import 'logged_in_state.dart';

@injectable
class LoggedInCubit extends Cubit<LoggedInState> {
  final IAuthRepository _authRepository;
  StreamSubscription _streamSubscription;
  LoggedInCubit(this._authRepository) : super(LoggedInState.unauthenticated()) {
    _streamSubscription =
        _authRepository.onAuthStateChanged().listen((User user) {
      if (user != null) {
        DateTime userCreationDate = user.metadata.creationTime;
        DateTime now = DateTime.now();
        int minuteDifference = now.difference(userCreationDate).inMinutes;
        if (minuteDifference > 0) {
          emit(LoggedInState.login(user));
        } else {
          emit(LoggedInState.register(user));
        }
      } else {
        emit(LoggedInState.unauthenticated());
      }
    });
  }

  void logout() async {
    await _authRepository.logout();
  }

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }
}
