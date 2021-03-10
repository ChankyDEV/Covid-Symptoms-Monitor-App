import 'package:flutter/material.dart';
import 'package:symptoms_monitor/screens/main/main_screen.dart';
import 'package:symptoms_monitor/screens/wrapper.dart';

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
      default:
        return null;
    }
  }
}
