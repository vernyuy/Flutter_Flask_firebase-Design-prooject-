// ignore_for_file: non_constant_identifier_names

import 'package:flutter/foundation.dart';

class HealthHistory with ChangeNotifier {
  late String id;
  late int BMI;
  late int BP;
  late int Prediction;
  late int Risk;
  late int Temp;
  late int Pulse;

  HealthHistory({
    required this.id,
    required this.BMI,
    required this.BP,
    required this.Prediction,
    required this.Risk,
    required this.Temp,
    required this.Pulse
  });

  factory HealthHistory.fromMap(Map<String, dynamic> json) {
    return HealthHistory(id:json['id'], BMI: json['BMI'], BP:json['BP'], Prediction: json['Prediction'], Risk: json['Risk'],Temp: json['Temp'], Pulse: json['Pulse']);
  }
  factory HealthHistory.fromJson(Map<String, dynamic> json) {
    return HealthHistory(id:json['id'], BMI: json['BMI'], BP:json['BP'], Prediction: json['Prediction'], Risk: json['Risk'],Temp: json['Temp'], Pulse: json['Pulse']);
  }
}
