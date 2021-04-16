import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:symptoms_monitor/blocs/front_screen/front_screen_cubit.dart';
import 'package:symptoms_monitor/models/profile/profile.dart';
import 'package:symptoms_monitor/screens/const.dart';

class FrontScreen extends StatefulWidget {
  final Function startAnim;

  const FrontScreen({Key key, this.startAnim}) : super(key: key);

  @override
  _FrontScreenState createState() => _FrontScreenState();
}

class _FrontScreenState extends State<FrontScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    Profile user = Hive.box("User").get("current");
    print("USER ${user.uid}");
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
        body: BlocBuilder<FrontScreenCubit, FrontScreenState>(
          builder: (context, state) {
            return Container(
              child: Column(
                children: [
                  CircleButton(
                    animateTitle: () {
                      BlocProvider.of<FrontScreenCubit>(context)
                          .clickOrReleaseButton();
                      BlocProvider.of<FrontScreenCubit>(context).animateTitle();
                      _animationController.forward();
                    },
                    clicked: state.isButtonClicked,
                    radius: radius,
                    title: state.title,
                  ),
                  state.isDataReady
                      ? Container(
                          margin: const EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Text('Saturacja krwi'),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  Text('79%',
                                      style: const TextStyle(fontSize: 20.0)),
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
                          ))
                      : Container(
                          alignment: Alignment.center,
                        ),
                  state.isDataReady
                      ? Container(
                          margin: const EdgeInsets.only(top: 20),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  _animationController.reverse();
                                  BlocProvider.of<FrontScreenCubit>(context)
                                      .clickOrReleaseButton();
                                  BlocProvider.of<FrontScreenCubit>(context)
                                      .resetTitle();
                                },
                                child: SaveButton(),
                              ),
                              const SizedBox(
                                width: 40,
                              ),
                              GestureDetector(
                                onTap: () {
                                  _animationController.reverse();
                                  BlocProvider.of<FrontScreenCubit>(context)
                                      .clickOrReleaseButton();
                                  BlocProvider.of<FrontScreenCubit>(context)
                                      .resetTitle();
                                },
                                child: DiscardButton(),
                              )
                            ],
                          ),
                        )
                      : Container(
                          alignment: Alignment.center,
                        ),
                  Expanded(
                    child: AnimatedBuilder(
                      animation: _animationController,
                      builder: (context, child) {
                        return Container(
                          width: width - 15,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16.0),
                                topRight: Radius.circular(16.0)),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 0),
                                color: Colors.transparent,
                                spreadRadius: 2,
                                blurRadius: 3,
                              )
                            ],
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 6,
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: width / 1.1,
                                    child: LineChartSample1(
                                      chosenStat: state.chosenStatistic,
                                    ),
                                    // chosenStatistics[0]
                                    //     ? Text('Saturacja')
                                    //     : chosenStatistics[1]
                                    //         ? Text('Tętno')
                                    //         : Text('Temperatura'),
                                  ),
                                ),
                                const SizedBox(
                                  height: 12.0,
                                ),
                                Container(
                                  width: width / 1.1,
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Color(cBlueDark), width: 1),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0))),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: GestureDetector(
                                        onTap: () =>
                                            BlocProvider.of<FrontScreenCubit>(
                                                    context)
                                                .switchChosenStatistic(0),
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: height / 17,
                                          child: Text('Saturacja krwi',
                                              style: state.chosenStatistic[0]
                                                  ? TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w500)
                                                  : const TextStyle(
                                                      color: Colors.black)),
                                          decoration: BoxDecoration(
                                            color: state.chosenStatistic[0]
                                                ? Color(cBlueDark)
                                                : Colors.transparent,
                                            border: Border(
                                                right: BorderSide(
                                                    color: Color(cBlueDark),
                                                    width: 1)),
                                          ),
                                        ),
                                      )),
                                      Expanded(
                                          child: GestureDetector(
                                        onTap: () =>
                                            BlocProvider.of<FrontScreenCubit>(
                                                    context)
                                                .switchChosenStatistic(1),
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: height / 17,
                                          child: Text(
                                            'Tętno',
                                            style: state.chosenStatistic[1]
                                                ? TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500)
                                                : const TextStyle(
                                                    color: Colors.black),
                                          ),
                                          decoration: BoxDecoration(
                                            color: state.chosenStatistic[1]
                                                ? Color(cBlueDark)
                                                : Colors.transparent,
                                            border: Border(
                                                right: BorderSide(
                                                    color: Color(cBlueDark),
                                                    width: 1)),
                                          ),
                                        ),
                                      )),
                                      Expanded(
                                          child: GestureDetector(
                                        onTap: () =>
                                            BlocProvider.of<FrontScreenCubit>(
                                                    context)
                                                .switchChosenStatistic(2),
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: height / 17,
                                          decoration: BoxDecoration(
                                            color: state.chosenStatistic[2]
                                                ? Color(cBlueDark)
                                                : Colors.transparent,
                                          ),
                                          child: Text('Temperatura',
                                              style: state.chosenStatistic[2]
                                                  ? TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w500)
                                                  : const TextStyle(
                                                      color: Colors.black)),
                                        ),
                                      )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            );
          },
        ));
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

class LineChartSample1 extends StatefulWidget {
  final List<bool> chosenStat;

  const LineChartSample1({Key key, this.chosenStat}) : super(key: key);

  @override
  State<StatefulWidget> createState() => LineChartSample1State();
}

class LineChartSample1State extends State<LineChartSample1> {
  bool isShowingMainData;

  @override
  void initState() {
    super.initState();
    isShowingMainData = true;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: AspectRatio(
        aspectRatio: 1.3,
        child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              color: Color(cBlueDark)),
          child: Stack(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                      alignment: Alignment.center,
                      child: Text(
                          widget.chosenStat[0]
                              ? 'Saturacja krwi'
                              : widget.chosenStat[1]
                                  ? 'Tetno'
                                  : 'Temperatura',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20.0))),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 36.0, left: 6.0),
                      child: widget.chosenStat[0]
                          ? LineChart(
                              sampleData1(),
                              swapAnimationDuration:
                                  const Duration(milliseconds: 250),
                            )
                          : widget.chosenStat[1]
                              ? LineChart(
                                  sampleData1(),
                                  swapAnimationDuration:
                                      const Duration(milliseconds: 250),
                                )
                              : LineChart(
                                  sampleData1(),
                                  swapAnimationDuration:
                                      const Duration(milliseconds: 250),
                                ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  LineChartData sampleData1() {
    return LineChartData(
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.black.withOpacity(0.8),
        ),
        touchCallback: (LineTouchResponse touchResponse) {},
        handleBuiltInTouches: true,
      ),
      gridData: FlGridData(
        show: false,
      ),
      titlesData: FlTitlesData(
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 25,
          getTextStyles: (value) => const TextStyle(
            color: Colors.white,
            //fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          margin: 15,
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '02.04';
              case 2:
                return '03.04';
              case 3:
                return '04.04';
              case 4:
                return '05.04';
              case 5:
                return '06.04';
              case 6:
                return '07.04';
              case 7:
                return '08.04';
            }
            return '';
          },
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
            color: Colors.white,
            //fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 35:
                return '35';
              case 37:
                return '37';
              case 39:
                return '39';
              case 41:
                return '41';
            }
            return '';
          },
          margin: 15,
          reservedSize: 25,
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: const Border(
          bottom: BorderSide(
            color: Colors.black,
            width: 4,
          ),
          left: BorderSide(
            color: Colors.black,
            width: 4,
          ),
          right: BorderSide(
            color: Colors.transparent,
          ),
          top: BorderSide(
            color: Colors.transparent,
          ),
        ),
      ),
      minX: 1,
      maxX: 7,
      maxY: 41,
      minY: 34,
      lineBarsData: temperatureData(),
    );
  }

  List<LineChartBarData> temperatureData() {
    final LineChartBarData lineChartBarData1 = LineChartBarData(
      spots: [
        FlSpot(1, 35.9),
        FlSpot(2, 36.6),
        FlSpot(3, 37.1),
        FlSpot(4, 38.9),
        FlSpot(5, 36.6),
        FlSpot(6, 37.3),
        FlSpot(7, 35.5),
      ],
      isCurved: true,
      colors: [
        const Color(cBlueLight),
      ],
      barWidth: 3,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: true,
      ),
      belowBarData: BarAreaData(
        show: false,
      ),
    );

    return [
      lineChartBarData1,
    ];
  }
}
