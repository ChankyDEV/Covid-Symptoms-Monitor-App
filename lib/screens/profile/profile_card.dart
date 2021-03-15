import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:symptoms_monitor/blocs/add_profile/add_profile_cubit.dart';
import 'package:symptoms_monitor/models/profile/gender_enum.dart';
import 'package:symptoms_monitor/models/profile/profile.dart';
import 'package:symptoms_monitor/screens/const.dart';

class ProfileCard extends StatelessWidget {
  final Profile profile;

  const ProfileCard({Key key, this.profile}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: profile.avatar != null
                  ? Container(
                      width: MediaQuery.of(context).size.width / 5,
                      height: MediaQuery.of(context).size.width / 5,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(cBlueLight),
                            width: 3,
                          ),
                          color: Color(cBlueDark),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: FileImage(File(profile.avatar.path)),
                          )),
                    )
                  : Container(
                      width: MediaQuery.of(context).size.width / 5,
                      height: MediaQuery.of(context).size.width / 5,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(cBlueLight),
                          width: 3,
                        ),
                        color: Color(cBlueDark),
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                          'assets/images/' + _returnProperAvatar(profile)),
                    ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    profile.name.toUpperCase(),
                    style: const TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
                flex: 1,
                child: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    BlocProvider.of<AddProfileCubit>(context).remove(profile);
                  },
                ))
          ],
        ),
      ),
    );
  }
}

String _returnProperAvatar(Profile profile) {
  switch (profile.gender) {
    case Gender.male:
      return 'man_av.png';
      break;
    case Gender.female:
      return 'girl_av.png';
      break;
    case Gender.none:
      return 'none_av.png';
      break;
    default:
      return 'man_av.png';
  }
}
