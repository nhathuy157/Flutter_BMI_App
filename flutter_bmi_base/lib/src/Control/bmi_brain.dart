import 'dart:math';

class BmiCalc {
  BmiCalc({required this.height, required this.weight});
  final int height;
  final int weight;

  late double bmi;
  //late

  //final

  //tính BMI
  // return double
  double bmiCalc() {
    bmi = weight / pow(height / 100, 2);
    return bmi;
  }

  //get status
  //string
  String getStatus() {
    if (bmi >= 25) {
      return 'Overweight';
    } else if (bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  //get suggest
  //string
  String getResutl() {
    if (bmi >= 25) {
      return 'Do more exercise to burn your fat.';
    } else if (bmi > 18.5) {
      return 'Good job, keep going !';
    } else {
      return 'You need to eat more';
    }
  }
}
