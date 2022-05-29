import 'package:flutter/foundation.dart';

class SensorData with ChangeNotifier {
  late String id;
  late double Temp;
  late double Pulse;

  SensorData({
    required this.id,
    required this.Temp,
    required this.Pulse
  });

  factory SensorData.fromMap(Map<String, dynamic> json) {
    return SensorData(id:json['id'],Temp: json['Temp'], Pulse: json['Pulse']);
  }
  factory SensorData.fromJson(Map<String, dynamic> json) {
    return SensorData(id:json['id'], Temp: json['Temp'], Pulse: json['Pulse']);
  }
}
