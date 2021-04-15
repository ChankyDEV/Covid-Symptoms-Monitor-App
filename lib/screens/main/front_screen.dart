import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:symptoms_monitor/blocs/front_screen/front_screen_cubit.dart';
import 'package:symptoms_monitor/models/measurement/blood_saturation.dart';
import 'package:symptoms_monitor/models/measurement/measurement.dart';
import 'package:symptoms_monitor/models/measurement/measurements_enum.dart';
import 'package:symptoms_monitor/screens/const.dart';
import 'package:symptoms_monitor/screens/core/utils.dart';

class FrontScreen extends StatefulWidget {
  final Function startAnim;
  const FrontScreen({Key key, this.startAnim}) : super(key: key);

  @override
  _FrontScreenState createState() => _FrontScreenState();
}

class _FrontScreenState extends State<FrontScreen> {
  final statisticsNames = ['Saturacja krwi', 'Tętno', 'Temperatura'];
  final measurementsEnum = [
    MeasurementsEnum.bloodSaturation,
    MeasurementsEnum.heartRate,
    MeasurementsEnum.temperature
  ];
  @override
  void initState() {
    //BlocProvider.of<FrontScreenCubit>(context).getLastMeasurements();
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
                    animateTitle: () async {
                      BlocProvider.of<FrontScreenCubit>(context)
                          .getMeasurement();
                    },
                    clicked: state.isButtonClicked,
                    radius: radius,
                    title: state.title,
                  ),
                  MeasurementResults(
                      dataHasError: state.newMeasurementsHadError,
                      isDataDownloaded: state.isDataDownloaded,
                      onSave: () => BlocProvider.of<FrontScreenCubit>(context)
                          .onSaveClick(),
                      onDiscard: () =>
                          BlocProvider.of<FrontScreenCubit>(context)
                              .onDiscardClick(),
                      actualMeasurement: state.measurement),
                  Expanded(
                    child: Container(
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
                                child: DataLineChart(
                                  chosenStat: state.chosenStatistic,
                                  lastMeasurementsLoading:
                                      state.lastMeasurementsLoading,
                                  lastMeasurementsHadError:
                                      state.lastMeasurementsHadError,
                                  titles: statisticsNames,
                                  chosenIndex: state.chosenIndex,
                                  measurements: state.lastMeasurements,
                                  measurementsEnum: measurementsEnum,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 12.0,
                            ),
                            state.lastMeasurementsLoading
                                ? Container(
                                    width: width / 1.1,
                                    height: height / 17,
                                  )
                                : state.lastMeasurementsHadError
                                    ? Container(
                                        width: width / 1.1,
                                        height: height / 17,
                                      )
                                    : SwitchButton(
                                        chosenStatistic: state.chosenStatistic,
                                        length: state.chosenStatistic.length,
                                        onItemChoose: (index) =>
                                            BlocProvider.of<FrontScreenCubit>(
                                                    context)
                                                .switchChosenStatistic(index),
                                        statisticsNames: [
                                          'Saturacja Krwi',
                                          'Tętno',
                                          'Temperatura'
                                        ],
                                      ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ));
  }
}

class MeasurementResults extends StatelessWidget {
  final bool isDataDownloaded;
  final bool dataHasError;
  final Function onSave;
  final Function onDiscard;
  final Measurement actualMeasurement;
  const MeasurementResults({
    Key key,
    @required this.isDataDownloaded,
    @required this.onSave,
    @required this.onDiscard,
    @required this.actualMeasurement,
    @required this.dataHasError,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return isDataDownloaded
        ? dataHasError
            ? Container(
                margin: const EdgeInsets.only(top: 40),
                alignment: Alignment.bottomCenter,
                child: Text('Wystąpił błąd podczas pobierania danych',
                    style: const TextStyle(fontSize: 20.0)),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
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
                              Text(
                                  '${actualMeasurement.bloodSaturation.value} %',
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
                              Text('${actualMeasurement.heartRate.value} BPM',
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
                              Text(
                                  '${actualMeasurement.temperature.value} \u2103',
                                  style: const TextStyle(fontSize: 20.0)),
                            ],
                          ),
                        ],
                      )),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DarkBlueButton(
                          onTap: onSave,
                          title: 'Zapisz',
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        TransparentButton(
                          onTap: onDiscard,
                          title: 'Odrzuć',
                        ),
                      ],
                    ),
                  )
                ],
              )
        : Container();
  }
}

class DataLineChart extends StatefulWidget {
  final List<bool> chosenStat;
  final bool lastMeasurementsLoading;
  final bool lastMeasurementsHadError;
  final List<String> titles;
  final int chosenIndex;
  final List<Measurement> measurements;
  final List<MeasurementsEnum> measurementsEnum;

  const DataLineChart(
      {Key key,
      this.chosenStat,
      this.lastMeasurementsLoading,
      this.lastMeasurementsHadError,
      this.titles,
      this.chosenIndex,
      this.measurements,
      this.measurementsEnum})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => DataLineChartState();
}

class DataLineChartState extends State<DataLineChart> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      height: height / 3,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          color: Color(cBlueDark)),
      child: widget.lastMeasurementsLoading
          ? LoadingIndicator()
          : widget.lastMeasurementsHadError
              ? MakeRequestAgainErrorCard(
                  message: 'Błąd w trakcie pobierania danych.\nPonów',
                  reQuery: () => BlocProvider.of<FrontScreenCubit>(context)
                      .getLastMeasurements(),
                )
              : Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: _renderTitle(
                              isTitleChosen: widget.chosenStat,
                              names: widget.titles),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(right: 24.0, left: 24.0),
                            child: _renderChart(
                                chosenIndex: widget.chosenIndex,
                                measurements: widget.measurements,
                                measurementsEnum: widget.measurementsEnum),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ],
                ),
    );
  }

  Widget _renderChart(
      {@required int chosenIndex,
      List<Measurement> measurements,
      List<MeasurementsEnum> measurementsEnum}) {
    return LineChart(
        chartData(
            enumName: measurementsEnum[chosenIndex],
            measurements: measurements),
        swapAnimationDuration: const Duration(milliseconds: 250));
  }

  LineChartData chartData(
      {@required MeasurementsEnum enumName,
      @required List<Measurement> measurements}) {
    var data = [];
    List<DateTime> dates = [];
    if (enumName == MeasurementsEnum.bloodSaturation) {
      measurements.forEach((element) {
        data.add(element.bloodSaturation.value);
        dates.add(element.date);
      });
    } else if (enumName == MeasurementsEnum.heartRate) {
      measurements.forEach((element) {
        data.add(element.heartRate.value);
        dates.add(element.date);
      });
    } else {
      measurements.forEach((element) {
        data.add(element.temperature.value);
        dates.add(element.date);
      });
    }

    dynamic max = data[0];
    dynamic min = data[0];

    data.forEach((value) {
      if (max < value) {
        max = value;
      }
      if (min > value) {
        min = value;
      }
    });

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
          reservedSize: measurements.length.toDouble(),
          getTextStyles: (value) => const TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
          margin: 15,
          getTitles: (value) {
            int i = value.toInt();
            return '${dates[i].day}.${dates[i].month}';
          },
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
          reservedSize: 10,
          interval: enumName == MeasurementsEnum.temperature ? 0.5 : 6,
          margin: 15,
          getTitles: (value) {
            int i = value.toInt();
            int differ = enumName == MeasurementsEnum.temperature ? 6 : 2;

            return '$i';
          },
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
      minX: 0,
      maxX: dates.length - 1.toDouble(),
      maxY: max.toDouble(),
      minY: (enumName == MeasurementsEnum.temperature ? -1 : -10) +
          min.toDouble(),
      lineBarsData: drawData(data: data),
    );
  }

  List<LineChartBarData> drawData({List<dynamic> data}) {
    List<FlSpot> spots = [];

    for (int i = 0; i < data.length; i++) {
      spots.add(FlSpot(i.toDouble(), data[i].toDouble()));
    }
    return [
      LineChartBarData(
        spots: spots,
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
      )
    ];
  }
}

Widget _renderTitle(
    {@required List<bool> isTitleChosen, @required List<String> names}) {
  for (int i = 0; i < names.length; i++) {
    if (isTitleChosen[i] == true) {
      return Text(
        names[i],
        style: const TextStyle(color: Colors.white, fontSize: 20.0),
      );
    }
  }
  return Container();
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
                    child: Text(title,
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

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: CircularProgressIndicator(
        backgroundColor: Color(cBlueDark),
      ),
    );
  }
}
