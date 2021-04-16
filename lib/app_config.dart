import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:symptoms_monitor/router/custom_router.dart';

class AppConfig extends StatefulWidget {
  @override
  _AppConfigState createState() => _AppConfigState();
}

class _AppConfigState extends State<AppConfig> {
  final _customRouter = CustomRouter();

  @override
  void initState() {
    Hive.openBox("User").then((value) => print(value));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: _customRouter.onGenerateRoute,
    );
  }

  @override
  void dispose() {
    Hive.box('User').compact();
    Hive.close();
    super.dispose();
  }
}
