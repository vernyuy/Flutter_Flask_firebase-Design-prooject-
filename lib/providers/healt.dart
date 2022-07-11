// ignore_for_file: prefer_adjacent_string_concatenation

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './healthInfo.dart';
import './dateTime.dart';

class Health with ChangeNotifier {
  void addInfo(HealthInfo healthInfo) {
    // print('hello Legend');
    const url = "https://heartpredictor-6ecf8-default-rtdb.firebaseio.com" + "/info.json";
    http.post(
      Uri.parse(url),
      body: json.encode({
        'Age': healthInfo.Age,
        'CA': healthInfo.CA,
        'Sex': healthInfo.Sex,
        'Thal': healthInfo.Thal,
        'chol': healthInfo.chol,
        'cp': healthInfo.cp,
        'exang': healthInfo.exang,
        'fps': healthInfo.fps,
        'oldpeak': healthInfo.oldpeak,
        'restecg': healthInfo.restecg,
        'slope': healthInfo.slope,
        'trestbps': healthInfo.trestbps
      }),
    );
    // http
    //     .post(
    //   url,
    // )
    //     .then((response) {
    //   // final newHealthInfo = HealthInfo(
    //   //     Age: healthInfo.Age,
    //   //     CA: healthInfo.CA,
    //   //     Sex: healthInfo.Sex,
    //   //     Thal: healthInfo.Thal,
    //   //     chol: healthInfo.chol,
    //   //     cp: healthInfo.cp,
    //   //     exang: healthInfo.exang,
    //   //     fps: healthInfo.fps,
    //   //     oldpeak: healthInfo.oldpeak,
    //   //     restecg: healthInfo.restecg,
    //   //     slope: healthInfo.slope,
    //   //     trestbps: healthInfo.trestbps);
    //   // _items.add(newProduct);
    //   // _items.insert(0, newProduct); // at the start of the list
    //   // notifyListeners();
    // });
  }


  void addDayTime(DayTime dayTime) {
    // print('hello Legend');
    const url = "https://heartpredictor-6ecf8-default-rtdb.firebaseio.com" + "/dayTime.json";
    http.post(
      Uri.parse(url),
      body: json.encode({
        'Day': dayTime.Day,
        'Month': dayTime.Month,
        'Year': dayTime.Year,
        'Hour': dayTime.Hour,
        'Min': dayTime.Min
      }),
    );
    }
}
