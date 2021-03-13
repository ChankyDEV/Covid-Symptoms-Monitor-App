import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:symptoms_monitor/blocs/cubit/add_profile_cubit.dart';
import 'package:symptoms_monitor/screens/auth/add_profiles.dart';
import 'package:symptoms_monitor/screens/main/main_screen.dart';

class CustomRouter {
  //TODO: CHANGE ROUTES
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => MainScreen());
        break;
      case '/main':
        return MaterialPageRoute(builder: (_) => MainScreen());
        break;
      case '/add_profiles':
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider.value(
              value: AddProfileCubit(),
              child: AddProfiles(),
            );
          },
        );
        break;
      default:
        return null;
    }
  }
}
