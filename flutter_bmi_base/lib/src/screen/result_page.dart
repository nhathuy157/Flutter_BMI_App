import 'package:flutter/material.dart';
import 'package:flutter_bmi_base/src/values/constants.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(
      {Key? key, required this.bmi, required this.result, required this.status})
      : super(key: key);
  final double bmi;
  final String result;
  final String status;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: kInactiveCardColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 60, left: 12),
                child: Text(
                  'Your Result',
                  style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: Card(
                  color: colorButtonOn,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        status.toString(),
                        style: kResultTextStyle,
                      ),
                      Text(
                        bmi.toStringAsFixed(1),
                        style: kBMITextStyle.copyWith(color: Colors.white),
                      ),
                      Text(
                        result.toString(),
                        style: kBodyTextStyle.copyWith(color: Colors.white),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    color: Color(0xffEA1557),
                    alignment: Alignment.center,
                    child: Text(
                      'RE-CALCULATE',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    height: size.height / 10,
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
