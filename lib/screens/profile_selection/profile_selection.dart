import 'package:flutter/material.dart';
import 'package:symptoms_monitor/blocs/logged_in/logged_in_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        GestureDetector(onTap: (){
          context.read<LoggedInCubit>().logout();
        },child: Icon(Icons.logout,size: 30,))
      ],),
    );
  }
}
