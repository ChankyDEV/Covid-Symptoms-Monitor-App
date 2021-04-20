import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:symptoms_monitor/blocs/add_profile/add_profile_cubit.dart';
import 'package:symptoms_monitor/screens/core/loading_indicator.dart';
import 'package:symptoms_monitor/screens/core/utils.dart';
import 'package:symptoms_monitor/screens/profile/profile_card.dart';

import '../const.dart';
import 'new_profile_form.dart';

class AddProfiles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
  print("kurwa");
    return BlocConsumer<AddProfileCubit, AddProfileState>(
      listener: (context, state) {
        if (state.showError) {
          showError(context, state.errorText);
        } else {
          if (state.canGo) {
            Navigator.of(context).pushReplacementNamed('/main');
          }
        }
      },
      builder: (context, state) {
        return state.isLoading
            ? LoadingIndicator()
            : Scaffold(
                backgroundColor: Color(cBlueDark),
                appBar: AppBar(
                  leading: Container(),
                  actions: [
                    IconButton(
                        icon: Icon(Icons.save, color: Colors.white),
                        onPressed: () {
                          BlocProvider.of<AddProfileCubit>(context).save();
                        })
                  ],
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                  centerTitle: true,
                  title: Text(
                    'Twoja rodzina',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                body: Column(
                  children: [
                    Expanded(child: _build(state)),
                  ],
                ),
              );
      },
    );
  }
}

Widget _build(AddProfileState state) {
  return Column(
    children: [
      Expanded(
        flex: 2,
        child: ListView.builder(
          itemCount: state.profilesCount,
          itemBuilder: (context, index) {
            return state.profilesCount != 0
                ? ProfileCard(profile: state.profiles[index])
                : Container();
          },
        ),
      ),
      Expanded(
        flex: 1,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0)),
              child: Container(
                color: Colors.white,
              ),
            ),
            NewProfileForm(state: state)
          ],
        ),
      ),
    ],
  );
}
