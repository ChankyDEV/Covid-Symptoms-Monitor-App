import 'package:flutter/material.dart';
import 'package:symptoms_monitor/models/measurement/blood_saturation.dart';
import 'package:symptoms_monitor/models/measurement/heart_rate.dart';
import 'package:symptoms_monitor/models/measurement/measurement.dart';
import 'package:symptoms_monitor/models/measurement/temperature.dart';

class ProfileHistory extends StatelessWidget {
  List<Measurement> measurements = [
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
    )
  ];

  bool isProper(Measurement measurement) {
    if (measurement.temperature.value >= 37.0 ||
        measurement.heartRate.value >= 100 ||
        measurement.bloodSaturation.value < 80) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: measurements.length,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: EdgeInsets.only(
                  top: 36.0, left: 6.0, right: 6.0, bottom: 6.0),
              child: ExpansionTile(
                leading: Icon(
                  Icons.healing,
                  color:
                      isProper(measurements[index]) ? Colors.green : Colors.red,
                ),
                title: Text(measurements[index].date.toString()),
                children: <Widget>[
                  Row(
                    children: [
                      Text('Tętno: ${measurements[index].heartRate.value}'),
                    ],
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    children: [
                      Text(
                          'Temperatura: ${measurements[index].temperature.value}'),
                    ],
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    children: [
                      Text(
                          'Saturacja krwi: ${measurements[index].bloodSaturation.value}'),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
