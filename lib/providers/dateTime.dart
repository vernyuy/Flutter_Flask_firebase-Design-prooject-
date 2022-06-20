// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/foundation.dart';

class DayTime with ChangeNotifier {
  late String Day;
  late String Month;
  late String Year;
  late String Hour;
  late String Min;

  DayTime({
    required this.Day,
    required this.Month,
    required this.Year,
    required this.Hour,
    required this.Min,
  });

  factory DayTime.fromMap(Map<String, dynamic> json) {
    return DayTime(Day:json['Month'], Month: json['Month'], Year: json['Year'], Hour: json['Hour'], Min: json['Min']);
  }
  factory DayTime.fromJson(Map<String, dynamic> json) {
    return DayTime(Day:json['Month'], Month: json['Month'], Year: json['Year'], Hour: json['Hour'], Min: json['Min']);
  }
}
