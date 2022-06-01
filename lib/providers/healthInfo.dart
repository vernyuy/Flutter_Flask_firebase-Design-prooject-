// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/foundation.dart';

class HealthInfo with ChangeNotifier {
  late int Age;
  late int CA;
  late int Sex;
  late int Thal;
  late int chol;
  late int cp;
  late int exang;
  late int fps;
  late int oldpeak;
  late int restecg;
  late int slope;
  late int trestbps;

  HealthInfo({
    required this.Age,
    required this.CA,
    required this.Sex,
    required this.Thal,
    required this.chol,
    required this.cp,
    required this.exang,
    required this.fps,
    required this.oldpeak,
    required this.restecg,
    required this.slope,
    required this.trestbps,
  });
}
