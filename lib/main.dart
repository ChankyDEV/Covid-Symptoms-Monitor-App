import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:symptoms_monitor/app_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(AppConfig());
}
