import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:symptoms_monitor/models/measurement/blood_saturation.dart';
import 'package:symptoms_monitor/models/measurement/heart_rate.dart';
import 'package:symptoms_monitor/models/measurement/measurement.dart';
import 'package:symptoms_monitor/models/measurement/temperature.dart';
import 'package:symptoms_monitor/screens/core/texts.dart';

class ProfileHistory extends StatefulWidget {
  @override
  _ProfileHistoryState createState() => _ProfileHistoryState();
}

class _ProfileHistoryState extends State<ProfileHistory> {
  bool isExpanded = false;

  final List<Measurement> measurements = [
    Measurement(
      heartRate: HeartRate(value: 76),
      temperature: Temperature(value: 36.6),
      bloodSaturation: BloodSaturation(value: 94),
    ),
    Measurement(
      heartRate: HeartRate(value: 72),
      temperature: Temperature(value: 37.1),
      bloodSaturation: BloodSaturation(value: 85),
    ),
    Measurement(
      heartRate: HeartRate(value: 85),
      temperature: Temperature(value: 36.7),
      bloodSaturation: BloodSaturation(value: 96),
    ),
    Measurement(
      heartRate: HeartRate(value: 65),
      temperature: Temperature(value: 38.7),
      bloodSaturation: BloodSaturation(value: 54),
    )
  ];

  bool isProper(Measurement measurement) {
    if (measurement.temperature.value >= 37.0 ||
        measurement.temperature.value < 35.0 ||
        measurement.heartRate.value >= 100 ||
        measurement.heartRate.value < 50 ||
        measurement.bloodSaturation.value < 70) {
      return false;
    } else {
      return true;
    }
  }

  bool isProperValue(dynamic stat) {
    if (stat is HeartRate) {
      HeartRate heartRate = stat as HeartRate;

      if (heartRate.value > 100 || heartRate.value < 50) {
        return false;
      }
      return true;
    } else if (stat is Temperature) {
      Temperature temperature = stat as Temperature;

      if (temperature.value >= 37.0 || temperature.value < 35.0) {
        return false;
      }
      return true;
    } else {
      BloodSaturation bloodSaturation = stat as BloodSaturation;
      if (bloodSaturation.value <= 70.0) {
        return false;
      }
      return true;
    }
  }

  String dateFormat(DateTime date) {
    String dateString = '';
    dateString = date.day.toString() +
        ' ' +
        months[date.month] +
        ' ' +
        date.year.toString();
    return dateString;
  }

  String dayName(DateTime date) {
    String dayName = '';
    String englishDayName = DateFormat('EEEE').format(date);

    switch (englishDayName) {
      case 'Monday':
        dayName = 'Poniedziałek';
        break;
      case 'Tuesday':
        dayName = 'Wtorek';
        break;
      case 'Wednesday':
        dayName = 'Wtorek';
        break;
      case 'Thursday':
        dayName = 'Wtorek';
        break;
      case 'Friday':
        dayName = 'Wtorek';
        break;
      case 'Saturday':
        dayName = 'Wtorek';
        break;
      case 'Sunday':
        dayName = 'Wtorek';
        break;
      default:
        dayName = '';
        break;
    }

    return dayName;
  }

  @override
  Widget build(BuildContext context) {
    final actualTheme = Theme.of(context)
        .copyWith(dividerColor: Colors.transparent, accentColor: Colors.black);
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Icon(
              Icons.filter_list_alt,
              color: Colors.grey[800],
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemCount: measurements.length,
        itemBuilder: (context, index) {
          DateTime date = measurements[index].date;
          HeartRate heartRate = measurements[index].heartRate;
          Temperature temperature = measurements[index].temperature;
          BloodSaturation bloodSaturation = measurements[index].bloodSaturation;

          return Card(
            child: Padding(
              padding: EdgeInsets.only(
                  top: 36.0, left: 6.0, right: 6.0, bottom: 6.0),
              child: Theme(
                data: actualTheme,
                child: ExpansionTile(
                  onExpansionChanged: (value) {
                    setState(() {
                      isExpanded = value;
                    });
                  },
                  leading: Icon(
                    Icons.medical_services,
                    size: 32.0,
                    color: isProper(measurements[index])
                        ? Colors.green
                        : Colors.red,
                  ),
                  title: Text(dateFormat(date)),
                  subtitle: Text(
                    dayName(date).toUpperCase(),
                    style: TextStyle(
                        fontSize: 10.0,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey[800]),
                  ),
                  expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: Text('Saturacja krwi'),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: Text('Tętno'),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: Text('Temperatura'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 6,
                          width: 6,
                          color: Colors.black,
                        ),
                        Expanded(
                          child: Container(
                            height: isProperValue(bloodSaturation) ? 2 : 4,
                            color: isProperValue(bloodSaturation)
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),
                        Container(
                          height: 6,
                          width: 6,
                          color: Colors.black,
                        ),
                        Expanded(
                          child: Container(
                            height: isProperValue(heartRate) ? 2 : 4,
                            color: isProperValue(heartRate)
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),
                        Container(
                          height: 6,
                          width: 6,
                          color: Colors.black,
                        ),
                        Expanded(
                          child: Container(
                            height: isProperValue(temperature) ? 2 : 4,
                            color: isProperValue(temperature)
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),
                        Container(
                          height: 6,
                          width: 6,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              '${bloodSaturation.value} %',
                              style: const TextStyle(fontSize: 20.0),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: Text('${heartRate.value} BPM',
                                style: const TextStyle(fontSize: 20.0)),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: Text('${temperature.value}' + ' \u2103',
                                style: const TextStyle(fontSize: 20.0)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
