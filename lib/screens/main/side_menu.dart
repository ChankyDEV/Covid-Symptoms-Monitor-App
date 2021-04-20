import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:symptoms_monitor/blocs/logged_in/logged_in_cubit.dart';
import 'package:symptoms_monitor/domain/profiles/i_profile_repository.dart';
import 'package:symptoms_monitor/inject.dart';
import 'package:symptoms_monitor/models/profile/profile.dart';
import 'package:symptoms_monitor/screens/const.dart';

class SideMenu extends StatefulWidget {
  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  Profile profile;

  @override
  void initState() {
    super.initState();

    if (Hive.isBoxOpen('User')) {
      profile = Hive.box('User').values.first as Profile;
    } else {
      Hive.openBox('User');
      profile = Hive.box('User').values.first as Profile;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(cBlueDark),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(4.0, 64.0, 0.0, 0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  const SizedBox(
                    width: 24.0,
                  ),
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(cBlueLight),
                          width: 3,
                        ),
                        color: profile.hasImage
                            ? Colors.transparent
                            : Color(cBlueLight),
                        shape: BoxShape.circle),
                    child: profile.hasImage
                        ? FutureBuilder(
                            future: getIt<IProfileRepository>()
                                .getPhotoFromFirebase(
                                    profile.name, profile.uid),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                var data = snapshot.data;
                                return data.fold((l) {
                                  return SizedBox();
                                }, (r) {
                                  return Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(r),
                                        )),
                                  );
                                });
                              } else {
                                return CircularProgressIndicator(
                                  backgroundColor: Colors.black,
                                );
                              }
                            },
                          )
                        : IconButton(
                            onPressed: () {
                              print('Add photo');
                            },
                            iconSize: 36,
                            icon: Icon(
                              Icons.add_a_photo,
                              color: Colors.white,
                            ),
                          ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            TextButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.swap_horizontal_circle_outlined,
                  color: Colors.white,
                ),
                label: Text(
                  'Zmień profil',
                  style: const TextStyle(color: Colors.white),
                )),
            TextButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/profile_history');
                },
                icon: Icon(
                  Icons.history,
                  color: Colors.white,
                ),
                label: Text(
                  'Historia',
                  style: const TextStyle(color: Colors.white),
                )),
            TextButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.info_outline,
                  color: Colors.white,
                ),
                label: Text(
                  'Więcej informacji',
                  style: const TextStyle(color: Colors.white),
                )),
            TextButton.icon(
                onPressed: () {
                  Navigator.of(context).pushNamed('/add_profiles');
                },
                icon: Icon(
                  Icons.aspect_ratio,
                  color: Colors.white,
                ),
                label: Text(
                  'Tworzenie profili - testowo',
                  style: const TextStyle(color: Colors.white),
                )),
            Expanded(
              flex: 8,
              child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 0.0, vertical: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton.icon(
                          onPressed: () {
                            context.read<LoggedInCubit>().logout();
                          },
                          icon: Icon(
                            Icons.logout,
                            color: Colors.white,
                          ),
                          label: Text(
                            'Wyloguj się',
                            style: const TextStyle(color: Colors.white),
                          )),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
