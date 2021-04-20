import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:symptoms_monitor/blocs/add_profile/add_profile_cubit.dart';
import 'package:symptoms_monitor/blocs/auth/auth_cubit.dart';
import 'package:symptoms_monitor/blocs/logged_in/logged_in_cubit.dart';
import 'package:symptoms_monitor/blocs/logged_in/logged_in_state.dart';
import 'package:symptoms_monitor/screens/profile/add_profiles.dart';
import 'package:symptoms_monitor/screens/profile_selection/profile_selection.dart';
import 'package:symptoms_monitor/screens/registration/auth_screen.dart';
import '../inject.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoggedInCubit, LoggedInState>(builder: (context, state) {
      print("STATE $state");
      return state.when(
          unauthenticated: () => BlocProvider.value(
              value: getIt<AuthCubit>(), child: AuthScreen(isLogin: true)),
          login: (User user) => ProfileSelection(),
          register: (User user) {
            Navigator.pop(context);
            return BlocProvider.value(
              value: getIt<AddProfileCubit>(),
              child: AddProfiles(),
            );
          });
    });
  }
}
