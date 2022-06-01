// ignore_for_file: non_constant_identifier_names

import 'package:flutter/foundation.dart';

class Pred with ChangeNotifier {
  late String id;
  late String Prediction;

  Pred({
    required this.Prediction, id,
  });

  factory Pred.fromMap(Map<String, dynamic> json) {
    return Pred(id:json['id'], Prediction: json['Prediction']);
  }
  factory Pred.fromJson(Map<String, dynamic> json) {
    return Pred(id:json['id'],  Prediction: json['Prediction']);
  }
}
