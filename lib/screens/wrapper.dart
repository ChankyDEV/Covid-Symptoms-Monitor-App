import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:symptoms_monitor/blocs/auth/auth_cubit.dart';
import 'package:symptoms_monitor/blocs/logged_in/logged_in_cubit.dart';
import 'package:symptoms_monitor/blocs/logged_in/logged_in_state.dart';
import 'package:symptoms_monitor/screens/registration/auth_screen.dart';
import '../inject.dart';
import 'main/main_screen.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoggedInCubit, LoggedInState>(builder: (context, state) {
      return state.when(
          unauthenticated: () => BlocProvider.value(
              value: getIt<AuthCubit>(), child: AuthScreen(isLogin: true)),
          authenticated: (User user) => MainScreen()
              );
    });
  }
}
