import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './healthInfo.dart';

class Health with ChangeNotifier {
  void addInfo(HealthInfo healthInfo) {
    print('hello Legend');
    final url = "https://heartdoc-ff00b-default-rtdb.firebaseio.com" +
        "/info.json";
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
}
