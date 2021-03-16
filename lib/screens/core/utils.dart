import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

void showError(BuildContext context, String text) {
  Flushbar flushbar;
  flushbar = Flushbar(
    title: 'Wystąpił problem',
    message: text,
    duration: Duration(seconds: 15),
    flushbarPosition: FlushbarPosition.BOTTOM,
    flushbarStyle: FlushbarStyle.GROUNDED,
    reverseAnimationCurve: Curves.decelerate,
    forwardAnimationCurve: Curves.elasticInOut,
    backgroundColor: Colors.red,
    boxShadows: [
      BoxShadow(
        color: Colors.blue[800],
        offset: Offset(0.0, 2.0),
        blurRadius: 3.0,
      ),
    ],
    backgroundGradient: LinearGradient(
      colors: [Color(0xffEF7676), Color(0xff884343)],
    ),
    isDismissible: false,
    icon: Icon(
      Icons.error_outline,
      color: Color(0xffF6F7D7),
    ),
    mainButton: FlatButton(
      onPressed: () {
        flushbar.dismiss();
      },
      child: Text(
        'Ok',
        style: TextStyle(color: Colors.white),
      ),
    ),
  )..show(context);
}
