import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:symptoms_monitor/blocs/auth/auth_cubit.dart';
import 'package:symptoms_monitor/blocs/auth/auth_state.dart';
import 'package:symptoms_monitor/screens/core/utils.dart';

class AuthScreen extends StatelessWidget {
  final bool isLogin;
  AuthScreen({this.isLogin});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
          body: BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
        if (state.isCorrect) {
          if (state.canGo) {
            
          }
        } else {
          showError(context, state.errorText);
        }
      }, builder: (context, state) {
        return Material(
          child: SafeArea(
            child: Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/image.jpg'),
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter)),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.38),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(23, 10, 23, 23),
                    child: ListView(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Covid-19 monitor",
                                style: GoogleFonts.robotoSlab(
                                  textStyle: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ))
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20, left: 5),
                          child: Row(
                            children: <Widget>[
                              Text(
                                isLogin ? 'Zaloguj się' : 'Zarejestruj się',
                                style: GoogleFonts.robotoSlab(
                                  textStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        ...buildForms(isLogin, state, context),
                        Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: MaterialButton(
                            onPressed: () {
                              isLogin
                                  ? context.read<AuthCubit>().login()
                                  : context.read<AuthCubit>().register();
                            },
                            child: Text(
                              isLogin ? 'Logowanie' : 'Rejestracja',
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            color: Color(0xff29486A),
                            elevation: 0,
                            minWidth: 400,
                            height: 50,
                            textColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: GestureDetector(
                            onTap: () {
                              isLogin
                                  ? Navigator.of(context).pushNamed('/register')
                                  : Navigator.of(context).pushNamed('/login');
                            },
                            child: Center(
                              child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                    text: !isLogin
                                        ? "Masz już konto?"
                                        : "Nie masz konta?",
                                    style: GoogleFonts.robotoSlab(
                                      textStyle: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  TextSpan(
                                    text: !isLogin
                                        ? " Zaloguj się"
                                        : "  Zarejestruj się",
                                    style: GoogleFonts.robotoSlab(
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff29486A),
                                        fontSize: 15,
                                      ),
                                    ),
                                  )
                                ]),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  List<Widget> buildForms(bool isLogin, AuthState state, BuildContext context) {
    return List<Widget>.generate(
        isLogin ? 2 : 3,
        (index) => Padding(
              padding: index == 0
                  ? const EdgeInsets.only(top: 20)
                  : const EdgeInsets.only(top: 15),
              child: Container(
                color: Color(0xfff5f5f5),
                child: TextFormField(
                  initialValue: decideInitialValue(state, index),
                  onChanged: (value) {
                    saveQueryChanges(value, index, context);
                  },
                  obscureText: index == 0 ? false : true,
                  style: GoogleFonts.robotoSlab(
                    textStyle: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: decideLabelText(index),
                      prefixIcon: index == 0
                          ? Icon(Icons.person_outline)
                          : Icon(Icons.lock_outline),
                      labelStyle: TextStyle(fontSize: 15)),
                ),
              ),
            ));
  }

  String decideLabelText(int index) {
    if (index == 0) {
      return 'E-mail';
    } else if (index == 1) {
      return 'Hasło';
    } else {
      return 'Powtórz hasło';
    }
  }

  String decideInitialValue(AuthState state, int index) {
    if (index == 0) {
      return state.email;
    } else if (index == 1) {
      return state.password;
    } else {
      return state.passwordRe;
    }
  }

  void saveQueryChanges(String query, int index, BuildContext context) {
    if (index == 0) {
      context.read<AuthCubit>().emailChanged(query);
    } else if (index == 1) {
      context.read<AuthCubit>().passwordChanged(query);
    } else {
      context.read<AuthCubit>().passwordReChanged(query);
    }
  }
}
