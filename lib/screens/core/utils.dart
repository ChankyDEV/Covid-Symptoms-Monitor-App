import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:symptoms_monitor/screens/const.dart';

void showError(BuildContext context, String text) {
  Flushbar flushbar;
  flushbar = Flushbar(
    title: 'Wystąpił problem',
    message: text,
    duration: Duration(seconds: 15),
    flushbarPosition: FlushbarPosition.BOTTOM,
    flushbarStyle: FlushbarStyle.GROUNDED,
    reverseAnimationCurve: Curves.decelerate,
    forwardAnimationCurve: Curves.elasticInOut,
    backgroundColor: Colors.red,
    boxShadows: [
      BoxShadow(
        color: Colors.blue[800],
        offset: Offset(0.0, 2.0),
        blurRadius: 3.0,
      ),
    ],
    backgroundGradient: LinearGradient(
      colors: [Color(0xffEF7676), Color(0xff884343)],
    ),
    isDismissible: false,
    icon: Icon(
      Icons.error_outline,
      color: Color(0xffF6F7D7),
    ),
    mainButton: FlatButton(
      onPressed: () {
        flushbar.dismiss();
      },
      child: Text(
        'Ok',
        style: TextStyle(color: Colors.white),
      ),
    ),
  )..show(context);
}

class SwitchButton extends StatelessWidget {
  final List<bool> chosenStatistic;
  final List<String> statisticsNames;
  final int length;
  final Function(int) onItemChoose;

  const SwitchButton(
      {Key key,
      this.chosenStatistic,
      this.statisticsNames,
      this.length,
      this.onItemChoose})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      width: width / 1.1,
      height: height / 17,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          border: Border.all(color: Color(cBlueDark), width: 1),
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: renderSwitchButton(
          context: context,
          length: length,
          names: statisticsNames,
          chosenStatistic: chosenStatistic,
          onItemChoose: onItemChoose),
    );
  }
}

Widget renderSwitchButton(
    {@required BuildContext context,
    @required int length,
    @required List<String> names,
    @required List<bool> chosenStatistic,
    @required Function(int) onItemChoose}) {
  List<Widget> items = new List<Widget>();

  for (int i = 0; i < length; i++) {
    items.add(
      Expanded(
        child: GestureDetector(
          onTap: () => onItemChoose(i),
          child: Container(
            alignment: Alignment.center,
            child: Text(names[i],
                style: chosenStatistic[i]
                    ? TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500)
                    : const TextStyle(color: Colors.black)),
            decoration: BoxDecoration(
              color: chosenStatistic[i] ? Color(cBlueDark) : Colors.transparent,
              border:
                  Border(right: BorderSide(color: Color(cBlueDark), width: 1)),
            ),
          ),
        ),
      ),
    );
  }
  return Row(children: items);
}

class DarkBlueButton extends StatelessWidget {
  final String title;
  final Function onTap;

  const DarkBlueButton({Key key, this.title, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        alignment: Alignment.center,
        child: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        decoration: BoxDecoration(
            color: Color(cBlueDark),
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            )),
      ),
    );
  }
}

class TransparentButton extends StatelessWidget {
  final String title;
  final Function onTap;

  const TransparentButton({Key key, this.title, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        alignment: Alignment.center,
        child: Text(
          title,
          style: const TextStyle(
            color: Color(cBlueDark),
          ),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
            border: Border.all(width: 2, color: Color(cBlueDark))),
      ),
    );
  }
}

class MakeRequestAgainErrorCard extends StatelessWidget {
  final String message;
  final Function reQuery;

  const MakeRequestAgainErrorCard({Key key, this.reQuery, this.message})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          child: Text(
            message,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: IconButton(
            icon: Icon(
              Icons.file_download,
              color: Colors.white,
            ),
            onPressed: reQuery,
          ),
        ),
      ],
    );
  }
}
