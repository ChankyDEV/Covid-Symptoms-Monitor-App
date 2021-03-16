import 'package:flutter/material.dart';
import 'package:symptoms_monitor/screens/const.dart';

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(cBlueDark),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
