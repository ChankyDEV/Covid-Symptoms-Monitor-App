import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:symptoms_monitor/blocs/logged_in/logged_in_cubit.dart';
import 'package:symptoms_monitor/domain/profiles/i_profile_repository.dart';
import 'package:symptoms_monitor/models/profile/profile.dart';
import '../../inject.dart';

class ProfileSelection extends StatefulWidget {
  @override
  _ProfileSelectionState createState() => _ProfileSelectionState();
}

class _ProfileSelectionState extends State<ProfileSelection> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Object>(
        future: getIt<IProfileRepository>().getProfiles(),
        builder: (context, snapshot) {
          return Scaffold(
              backgroundColor: Colors.black,
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                leading: IconButton(
                  color: Color(0xff4F5563),
                  icon: Container(
                    child: Icon(
                      Icons.logout,
                      size: 30,
                    ),
                  ),
                  onPressed: () {
                    context.read<LoggedInCubit>().logout();
                  },
                ),
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Kto przeprowadza pomiar ?",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          wordSpacing: 2.2,
                          letterSpacing: 1.0,
                          fontFamily: "BebasNeueRegular"),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  decideWidget(snapshot.hasData, snapshot.data)
                ],
              ));
        });
  }

  Widget decideWidget(bool hasData, var data) {
    List<Profile> profiles;
    if (hasData) {
      data.fold((l) {
        profiles = [];
      }, (r) {
        profiles = r;
      });
      print("data $profiles");
      if (profiles.isNotEmpty) {
        return Flexible(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 5,
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.all(15.0),
                children: List.generate(
                  profiles.length,
                  (index) => Column(
                    children: [
                      Container(
                          color: Colors.black,
                          child: Container(
                            width: 130,
                            height: 130,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: profiles[index]
                                      .name
                                      .toLowerCase()
                                      .endsWith("a")
                                  ? SvgPicture.asset('assets/images/dos.svg')
                                  : SvgPicture.asset('assets/images/uno.svg'),
                            ),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        profiles[index].name,
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      )
                    ],
                  ),
                )),
          ),
        );
      } else {
        return SizedBox();
      }
    } else {
      return SizedBox();
    }
  }
}
