import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class FrontScreen extends StatelessWidget {
  final Function startAnim;

  const FrontScreen({Key key, this.startAnim}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: startAnim,
            icon: Icon(
              Icons.menu,
              color: Colors.black,
            ),
          )),
      body: LineChartSample1(),
    );
  }
}

class LineChartSample1 extends StatefulWidget {
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
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: AspectRatio(
        aspectRatio: 1.8,
        child: Container(
         
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(18)),
            color: Color(0xff252443)
          ),
          child: Stack(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                    const SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 36.0, left: 6.0),
                      child: LineChart(
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
          tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
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
            color: Color(0xff72719b),
            fontWeight: FontWeight.bold,
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
            color: Color(0xff75729e),
            fontWeight: FontWeight.bold,
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
            color: Color(0xff4e4965),
            width: 4,
          ),
          left: BorderSide(
            color: Color(0xff4e4965),
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
      lineBarsData: linesBarData1(),
    );
  }

  List<LineChartBarData> linesBarData1() {
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
        const Color(0xff4af699),
      ],
      
      barWidth: 3,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
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
