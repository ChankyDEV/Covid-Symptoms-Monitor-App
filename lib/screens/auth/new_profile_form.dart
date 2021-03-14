import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:symptoms_monitor/blocs/cubit/add_profile_cubit.dart';
import 'package:symptoms_monitor/screens/const.dart';

class NewProfileForm extends StatelessWidget {
  final AddProfileState state;
  const NewProfileForm({Key key, this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 2,
            ),
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              child: Container(
                color: Color(cBlueDark),
                width: MediaQuery.of(context).size.width / 4,
                height: 3,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                    flex: 1,
                    child: state.emptyProfile.hasImage
                        ? _buildImageFromFile(
                            state, MediaQuery.of(context).size.width / 5)
                        : _buildImageButton(
                            MediaQuery.of(context).size.width / 5,
                            BlocProvider.of<AddProfileCubit>(context)
                                .chooseImage)),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Color(cBlueDark), width: 1),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(16))),
                          focusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Color(cBlueDark), width: 1),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(16))),
                          labelText: 'Imie',
                          labelStyle: const TextStyle(color: Color(cBlueDark)),
                          errorStyle: const TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                        onChanged: (input) {
                          BlocProvider.of<AddProfileCubit>(context)
                              .nameChanged(input);
                        },
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            ToggleButtons(
              borderWidth: 1,
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              fillColor: Color(cBlueDark),
              color: Colors.black,
              selectedColor: Colors.white,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 4.0, vertical: 0.0),
                  child: Text('Mężczyzna'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 4.0, vertical: 0.0),
                  child: Text('Kobieta'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 4.0, vertical: 0.0),
                  child: Text('Inna'),
                ),
              ],
              onPressed: (index) {
                BlocProvider.of<AddProfileCubit>(context).ganderChanged(index);
              },
              isSelected: state.genders,
            ),
            const SizedBox(
              height: 15,
            ),
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              child: Container(
                height: 35.0,
                color: Color(cBlueDark),
                child: FlatButton(
                    onPressed: () {
                      BlocProvider.of<AddProfileCubit>(context).add();
                    },
                    child: Text('Dodaj',
                        style: const TextStyle(color: Colors.white))),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget _buildImageFromFile(AddProfileState state, double size) {
  return Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
        border: Border.all(
          color: Color(cBlueLight),
          width: 3,
        ),
        color: Color(cBlueDark),
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.fill,
          image: FileImage(File(state.emptyProfile.avatar.path)),
        )),
  );
}

Widget _buildImageButton(double size, Function chooseImage) {
  return Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
      border: Border.all(
        color: Color(cBlueLight),
        width: 3,
      ),
      color: Color(cBlueDark),
      shape: BoxShape.circle,
    ),
    child: IconButton(
      onPressed: chooseImage,
      icon: Icon(
        Icons.add_a_photo,
        color: Colors.white,
        size: 20.0,
      ),
    ),
  );
}
