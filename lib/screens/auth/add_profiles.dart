import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:symptoms_monitor/blocs/cubit/add_profile_cubit.dart';
import 'package:symptoms_monitor/models/profile/gender_enum.dart';
import 'package:symptoms_monitor/models/profile/profile.dart';

import '../const.dart';

class AddProfiles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddProfileCubit, AddProfileState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: Container(),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            centerTitle: true,
            title: Text(
              'Twoja rodzina',
              style: const TextStyle(color: Colors.black),
            ),
          ),
          body: Column(
            children: [
              Expanded(
                flex: 9,
                child: _buildItem(state.profilesCount, state.profiles,
                    state.genderIndex, state.genders),
              ),
            ],
          ),
        );
      },
    );
  }
}

Widget _buildItem(
    int count, List<Profile> profiles, int genderIndex, List<bool> genders) {
  return ListView.builder(
    itemCount: count,
    itemBuilder: (context, index) {
      return Dismissible(
          key: Key(index.toString()),
          child: profiles[index].isEmpty()
              ? EmptyCard(
                  genderIndex: genderIndex,
                  genders: genders,
                )
              : ValidProfile(profile: profiles[index]));
    },
  );
}

class EmptyCard extends StatelessWidget {
  final int genderIndex;
  final List<bool> genders;

  EmptyCard({Key key, this.genderIndex, this.genders}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 0.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(cBlueLight),
                          width: 3,
                        ),
                        color: Color(cBlueDark),
                        shape: BoxShape.circle),
                    child: IconButton(
                      onPressed: () {
                        print('add button');
                      },
                      icon: Icon(
                        Icons.add_a_photo,
                        color: Colors.white,
                        size: 14.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        onChanged: (input) {
                          BlocProvider.of<AddProfileCubit>(context)
                              .nameChanged(input);
                        },
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                    flex: 4,
                    child: ToggleButtons(
                      borderWidth: 0,
                      renderBorder: false,
                      children: [
                        Text('M'),
                        Text('F'),
                        Text('Other'),
                      ],
                      onPressed: (index) {
                        BlocProvider.of<AddProfileCubit>(context)
                            .ganderChanged(index);
                      },
                      isSelected: genders,
                    )),
              ],
            ),
            FlatButton(
                onPressed: () {
                  BlocProvider.of<AddProfileCubit>(context).add();
                },
                child: Text('Dodaj'))
          ],
        ),
      ),
    );
  }
}

class ValidProfile extends StatelessWidget {
  final Profile profile;

  const ValidProfile({Key key, this.profile}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(cBlueLight),
                        width: 3,
                      ),
                      color: Color(cBlueDark),
                      shape: BoxShape.circle),
                  child: profile.hasImage
                      ? Image.network(profile.imageUrl)
                      : Image.asset(
                          'assets/images/' + _returnProperAvatar(profile))),
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
