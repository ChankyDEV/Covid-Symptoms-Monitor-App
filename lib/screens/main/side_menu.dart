import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:symptoms_monitor/blocs/logged_in/logged_in_cubit.dart';
import 'package:symptoms_monitor/screens/const.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool hasPhoto = false;

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
                        color:
                            hasPhoto ? Colors.transparent : Color(cBlueLight),
                        shape: BoxShape.circle),
                    child: hasPhoto
                        ? Image.network(
                            'https://cdn3.iconfinder.com/data/icons/avatars-round-flat/33/avat-01-512.png')
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
              height: 104.0,
            ),
            TextButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/profile_selection');
                },
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
