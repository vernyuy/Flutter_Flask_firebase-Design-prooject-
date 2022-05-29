// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use, unused_local_variable, prefer_const_declarations, non_constant_identifier_names

import 'dart:convert';

import 'package:circularbar/providers/healthInfo.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../providers/history.dart';
import '../providers/pred.dart';
import '../providers/sensorData.dart';

// ignore: use_key_in_widget_constructors
class History extends StatefulWidget {
  // @override
  // void initState(){
  //   super.initState();
  // }
  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    // return Center(child: Text('History page'));

    // final response = await http.get("https://fir-flutter-d60b0.firebaseio.com/userprofile.json?");
    List<HealthHistory> History = [];
    List<SensorData> SensorD =[];
    List<Pred> PredData =[];
    List finalHist = [];

    return Center(
      child: ListView(children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Column(
            children: [
              Container(
                child: Row(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 25.0, horizontal: 10)),
                    Text(
                      'BMI',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 0.0, horizontal: 12)),
                    Text(
                      'Temp',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 0.0, horizontal: 12)),
                    Text(
                      'BP',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 0.0, horizontal: 12)),
                    Text(
                      'Risk',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 0.0, horizontal: 12)),
                    Text(
                      'Predictions',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 0.0, horizontal: 12)),
                    Text(
                      'Risk',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  child: Text('Load History'),
                  onPressed: () async {
                    final urlSensor =
                        "https://heartdoc-ff00b-default-rtdb.firebaseio.com" +
                            "/sensorData.json";
                    final SensorRes =await http.get(
                      Uri.parse(urlSensor),
                    );

                    // print(SensorRes.body);
                    final val = SensorRes.body;
                    final extractedSensor =
                        await json.decode(val) as Map<String, dynamic>;
                    final List<SensorData> loadedInf = [];
                    extractedSensor.forEach((HistoryID, HistoryData) {
                      loadedInf.add(
                        SensorData(
                            id: HistoryID,
                            Temp: HistoryData['temp'],
                            Pulse: HistoryData['pulse']),
                      );
                      // print(extractedHist);
                      History = loadedInf.cast<HealthHistory>();
                      // print('Data in history:');
                      // // fetchedData();
                      // print(History);
                      print(loadedInf);
                    });


                    final urlPred =
                        "https://heartdoc-ff00b-default-rtdb.firebaseio.com" +
                            "/prediction.json";
                    final PredRes =await http.get(
                      Uri.parse(urlPred),
                    );
                    // print(SensorRes.body);
                    final pred = PredRes.body;
                    final extractedPred =
                        await json.decode(pred) as Map<String, dynamic>;
                    final List<Pred> loadedPred = [];
                    extractedPred.forEach((PredHistoryID, PredHistoryData) {
                      loadedPred.add(
                        Pred(
                            id: PredHistoryID,
                            Prediction: PredHistoryData['pred'])
                      );
                      // print(extractedHist);
                      // History = loadedInf;
                      // print('Data in history:');
                      // // fetchedData();
                      // print(History);
                      print(loadedPred);
                    });
                    finalHist.add(extractedPred);
                  })
            ],
          ),

// History as Map<String, dynamic>;
// print{History};
        ),
      ]),
    );
    // ignore: dead_code
  }

  void fetchedData(){
    print(History);
  }
}
