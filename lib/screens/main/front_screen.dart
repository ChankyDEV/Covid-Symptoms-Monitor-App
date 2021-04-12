import 'package:dartz/dartz_unsafe.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:symptoms_monitor/screens/const.dart';

class FrontScreen extends StatefulWidget {
  final Function startAnim;

  const FrontScreen({Key key, this.startAnim}) : super(key: key);

  @override
  _FrontScreenState createState() => _FrontScreenState();
}

class _FrontScreenState extends State<FrontScreen>
    with SingleTickerProviderStateMixin {
  bool clicked = false;
  String title = "";
  AnimationController _animationController;

  void animateTitle() async {
    title = "";
    if (clicked) {
      String acquisition = "Akwizycja...";
      String saving = "Zapisywanie...";
      String ready = "Gotowe!";

      for (int i = 0; i < acquisition.length; i++) {
        await Future.delayed(Duration(milliseconds: 100), () {
          setState(() {
            title += acquisition[i];
          });
        });
      }
      await Future.delayed(Duration(milliseconds: 1500), () async {
        title = "";
        for (int i = 0; i < ready.length; i++) {
          await Future.delayed(Duration(milliseconds: 100), () {
            setState(() {
              title += ready[i];
            });
          });
        }
      });
      _animationController.forward();
    }
  }

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final radius = width / 2;
    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: widget.startAnim,
            icon: Icon(
              Icons.menu,
              color: Colors.black,
            ),
          )),
      body: Container(
        child: Column(
          children: [
            CircleButton(
              animateTitle: () {
                setState(() {
                  clicked = !clicked;
                  animateTitle();
                });
              },
              clicked: clicked,
              radius: radius,
              title: title,
            ),
            title == 'Gotowe!'
                ? Padding(
                    padding: const EdgeInsets.only(top: 36.0),
                    child: Container(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text('Saturacja krwi'),
                            const SizedBox(
                              height: 7,
                            ),
                            Text('79%', style: const TextStyle(fontSize: 20.0)),
                          ],
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Column(
                          children: [
                            Text('Tętno'),
                            const SizedBox(
                              height: 7,
                            ),
                            Text('74 BPM',
                                style: const TextStyle(fontSize: 20.0)),
                          ],
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Column(
                          children: [
                            Text('Temperatura'),
                            const SizedBox(
                              height: 7,
                            ),
                            Text('37.0 \u2103',
                                style: const TextStyle(fontSize: 20.0)),
                          ],
                        ),
                      ],
                    )),
                  )
                : Container(),
            title == 'Gotowe!'
                ? Padding(
                    padding: const EdgeInsets.only(top: 36.0),
                    child: Container(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                print('ZAPISZ');
                                _animationController.reverse();
                                clicked = !clicked;
                                title = '';
                              });
                            },
                            child: SaveButton(),
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                print('Odrzuć');
                                _animationController.reverse();
                                clicked = !clicked;
                                title = '';
                              });
                            },
                            child: DiscardButton(),
                          )
                        ],
                      ),
                    ),
                  )
                : Container(),
            Expanded(
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Padding(
                    padding: EdgeInsets.only(
                        top: title == 'Gotowe!'
                            ? 24 * _animationController.value
                            : 24.0),
                    child: Container(
                      width: width - 30,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16.0),
                              topRight: Radius.circular(16.0)),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 0),
                              color: Color(cBlueDark),
                              spreadRadius: 2,
                              blurRadius: 3,
                            )
                          ]),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SaveButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      alignment: Alignment.center,
      child: Text(
        'Zapisz',
        style: const TextStyle(color: Colors.white),
      ),
      decoration: BoxDecoration(
          color: Color(cBlueDark),
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          )),
    );
  }
}

class DiscardButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      alignment: Alignment.center,
      child: Text(
        'Odrzuć',
        style: const TextStyle(
          color: Color(cBlueDark),
        ),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
          border: Border.all(width: 2, color: Color(cBlueDark))),
    );
  }
}

class CircleButton extends StatelessWidget {
  final Function animateTitle;
  final bool clicked;
  final String title;
  final double radius;

  const CircleButton(
      {Key key, this.animateTitle, this.clicked, this.title, this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: radius,
            height: radius,
            decoration: BoxDecoration(
              color: Color(cBlueDark),
              shape: BoxShape.circle,
            ),
          ),
          GestureDetector(
            onTap: animateTitle,
            child: Container(
                width: radius - 30,
                height: radius - 30,
                child: Container(
                    alignment: Alignment.center,
                    child: Text(clicked ? title : 'START',
                        style: const TextStyle(
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ))),
                decoration: BoxDecoration(
                  color: Color(cBlueDark),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(0, 0),
                      spreadRadius: clicked ? 6 : 2, // lub 6
                      blurRadius: 5,
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
