import 'package:flutter/material.dart';
import 'package:flutter_bmi_base/src/Control/bmi_brain.dart';
import 'package:flutter_bmi_base/src/screen/result_page.dart';
import 'package:flutter_bmi_base/src/values/constants.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.male;

  int height = 175;
  int weight = 65;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kInactiveCardColor,
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
            padding: EdgeInsets.only(top: 24, right: 24, left: 24, bottom: 8),
            child: Row(
              children: [
                Expanded(
                    child: InkWell(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  child: Material(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    color: selectedGender == Gender.male
                        ? colorbtnOff
                        : colorButtonOn,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            Icons.male,
                            size: 90,
                            color: Colors.white,
                          ),
                          Text(
                            'MALE',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )
                        ]),
                  ),
                )),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                    child: InkWell(
                  onTap: (() {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  }),
                  child: Material(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: selectedGender == Gender.female
                        ? colorbtnOff
                        : colorButtonOn,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            Icons.female,
                            size: 90,
                            color: Colors.white,
                          ),
                          Text(
                            'FEMALE',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )
                        ]),
                  ),
                )),
              ],
            ),
          )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(top: 12, left: 24, right: 24),
            child: Material(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: colorButtonOn,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'HEIGHT',
                    style: kBodyTextStyle.copyWith(
                        fontSize: 18,
                        color: colorButtonOff,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        height.toString(),
                        style: kBodyTextStyle.copyWith(
                            fontSize: 48,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 24),
                        child: Text(
                          'cm',
                          style: kBodyTextStyle.copyWith(
                              fontSize: 18,
                              color: colorButtonOff,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      thumbColor: const Color(0xffeb1555),
                      overlayColor: const Color(0x29eb1555),
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      inactiveColor: const Color(0xff8d8e98),
                      min: 120.0,
                      max: 220.0,
                      // onChanged: ,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          )),
          Expanded(
              child: Container(
            padding:
                const EdgeInsets.only(top: 24, right: 24, left: 24, bottom: 8),
            child: Row(
              children: [
                Expanded(
                    child: Material(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'WEIGHT',
                        style: kTitleTextStyle.copyWith(
                            fontSize: 18, color: colorButtonOff),
                      ),
                      Text(
                        weight.toString(),
                        style: kBodyTextStyle.copyWith(
                            fontSize: 48,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          //btn +
                          FloatingActionButton(
                            heroTag: "btnadd1",
                            backgroundColor: colorbtn,
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                            child: Icon(Icons.add),
                          ),
                          //btn -
                          FloatingActionButton(
                            heroTag: "btndec1",
                            backgroundColor: colorbtn,
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                            child: Icon(Icons.remove),
                          ),
                        ],
                      )
                    ],
                  ),
                  color: colorButtonOn,
                )),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                    child: Material(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: colorButtonOn,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'AGE',
                        style: kTitleTextStyle.copyWith(
                            fontSize: 18, color: colorbtn),
                      ),
                      Text(
                        age.toString(),
                        style: kBodyTextStyle.copyWith(
                            fontSize: 48,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          //btn +
                          FloatingActionButton(
                            heroTag: "btnadd2",
                            backgroundColor: colorbtn,
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                            child: Icon(Icons.add),
                          ),
                          //btn -
                          FloatingActionButton(
                            heroTag: "btndec2",
                            backgroundColor: colorbtn,
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            },
                            child: Icon(Icons.remove),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
              ],
            ),
          )),
          Padding(
            padding: const EdgeInsets.only(top: 24),
            child: InkWell(
              onTap: () {
                BmiCalc bmi = BmiCalc(height: height, weight: weight);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage(
                              bmi: bmi.bmiCalc(),
                              result: bmi.getResutl(),
                              status: bmi.getStatus(),
                            )));
              },
              child: Container(
                color: Color(0xffEA1557),
                alignment: Alignment.center,
                child: Text(
                  'CALCULATOR YOUR BMI',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                height: size.height / 10,
              ),
            ),
          )
        ],
      ),
    );
  }
}
