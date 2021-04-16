import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:symptoms_monitor/app_config.dart';
import 'package:symptoms_monitor/inject.dart';
import 'package:path_provider/path_provider.dart';

import 'models/profile/profile.dart';

void main() async {
  configureInjection(Environment.prod);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var documentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(documentDirectory.path);
  Hive.registerAdapter(ProfileAdapter());
  runApp(AppConfig());
}
