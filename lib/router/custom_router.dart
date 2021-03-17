import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:symptoms_monitor/blocs/add_profile/add_profile_cubit.dart';
import 'package:symptoms_monitor/blocs/auth/auth_cubit.dart';
import 'package:symptoms_monitor/blocs/logged_in/logged_in_cubit.dart';
import 'package:symptoms_monitor/screens/main/main_screen.dart';
import 'package:symptoms_monitor/screens/profile/add_profiles.dart';
import 'package:symptoms_monitor/screens/profile_selection/profile_selection.dart';
import 'package:symptoms_monitor/screens/registration/auth_screen.dart';
import 'package:symptoms_monitor/screens/wrapper.dart';
import '../inject.dart';

class CustomRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                value: getIt<LoggedInCubit>(), child: Wrapper()));
        break;
      case '/login':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                value: getIt<AuthCubit>(), child: AuthScreen(isLogin: true)));
        break;
      case '/register':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                value: getIt<AuthCubit>(), child: AuthScreen(isLogin: false)));
        break;
      case '/main':
        return MaterialPageRoute(builder: (_) => MainScreen());
        break;
      case '/add_profiles':
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider.value(
              value: getIt<AddProfileCubit>(),
              child: AddProfiles(),
            );
          },
        );
        break;
      case '/profile_selection':
        return MaterialPageRoute(
          builder: (context) {
            return ProfileSelection();
          },
        );
        break;
      default:
        return null;
    }
  }
}
