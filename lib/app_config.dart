import 'package:flutter/material.dart';
import 'package:symptoms_monitor/router/custom_router.dart';

class AppConfig extends StatelessWidget {
  final _customRouter = CustomRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: _customRouter.onGenerateRoute,
      initialRoute: '/add_profiles',
    );
  }
}
