import 'package:flutter/material.dart';

class FrontScreen extends StatelessWidget {
  final Function startAnim;

  const FrontScreen({Key key, this.startAnim}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: startAnim,
            icon: Icon(
              Icons.menu,
              color: Colors.black,
            ),
          )),
    );
  }
}
