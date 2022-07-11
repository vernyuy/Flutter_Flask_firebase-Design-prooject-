// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use, unused_local_variable, prefer_const_declarations, non_constant_identifier_names, unused_import, annotate_overrides, prefer_adjacent_string_concatenation, unnecessary_null_comparison, use_rethrow_when_possible, sized_box_for_whitespace

import 'dart:convert';
import 'dart:ffi';

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
  void initState() {
    super.initState();
    readData();
  }

  bool isLoading = true;

  List<String> predHistList = [];
  List<double> tempHistList = [];
  List<double> pulseHistList = [];
  List<String> dayHistList = [];
  List<String> monthHistList = [];
  List<String> yearHistList = [];
  List<String> hourHistList = [];
  List<String> minHistList = [];

  Future<void> readData() async {
    // Please replace the Database URL
    // which we will get in “Add Realtime Database”
    // step with DatabaseURL

    var url = "https://heartpredictor-6ecf8-default-rtdb.firebaseio.com" +
        "/prediction.json";
    var urlSensor = "https://heartpredictor-6ecf8-default-rtdb.firebaseio.com" +
        "/sensorData.json";
    var urlDateTime =
        "https://heartpredictor-6ecf8-default-rtdb.firebaseio.com" + "/dayTime.json";
//
    // Do not remove “data.json”,keep it as it is
    try {
      final response = await http.get(Uri.parse(url));
      final sensorRes = await http.get(Uri.parse(urlSensor)); //Sensor
      final dateTimeRes = await http.get(Uri.parse(urlDateTime));
      final extractedSensorData =
          json.decode(sensorRes.body) as Map<String, dynamic>; // Sensor Temp
      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      final extractedDateTime = json.decode(dateTimeRes.body)
          as Map<String, dynamic>; // Date Time Data

      // Prediction /////////////////////
      if (extractedData == null) {
        return;
      }
      extractedData.forEach((blogId, blogData) {
        predHistList.add(blogData["pred"].toString());
      });
      print(predHistList.length);
      ////////////////////////////////
      ///
      ///
      ///
      // Sensor /////////////////////
      //   Tempp
      if (extractedSensorData == null) {
        return;
      }
      extractedSensorData.forEach((blogId, blogData) {
        tempHistList.add(blogData["temp"]);
      });
      ///////////////////////////////
      ///
      ///
      /// Pulse ///
      ///

      if (extractedSensorData == null) {
        return;
      }
      extractedSensorData.forEach((blogId, blogData) {
        pulseHistList.add(blogData["pulse"]);
      });

      ////////////////////
      ///
      ///     Working with Date And Time
      ///
      ////////////////////////////////////
      ////////    Day    ////////
      if (extractedDateTime == null) {
        return;
      }
      extractedDateTime.forEach((blogId, blogData) {
        dayHistList.add(blogData["Day"]);
      });
      // ////////    Month    /////
      if (extractedDateTime == null) {
        return;
      }
      extractedDateTime.forEach((blogId, blogData) {
        monthHistList.add(blogData["Month"]);
      });

      // ////////    Year    ///////
      if (extractedDateTime == null) {
        return;
      }
      extractedDateTime.forEach((blogId, blogData) {
        yearHistList.add(blogData["Year"]);
      });

      // ////////    Hour      //////
      if (extractedDateTime == null) {
        return;
      }
      extractedDateTime.forEach((blogId, blogData) {
        hourHistList.add(blogData["Hour"]);
      });

      // //////////       Minute   //////

      if (extractedDateTime == null) {
        return;
      }
      extractedDateTime.forEach((blogId, blogData) {
        minHistList.add(blogData["Min"]);
      });

      setState(() {
        isLoading = false;
      });
    } catch (error) {
      throw error;
    }

    // try{
    // final sensorRes = await http.get(Uri.parse(urlSensor)); //Sensor
    // final extractedSensorData = json.decode(sensorRes.body) as Map<String, dynamic>; // Sensor
    // if (extractedSensorData == null) {
    //     return;
    //   }
    //   extractedSensorData.forEach((blogId, blogData) {
    //     tempHistList.add(blogData["pred"]);
    //   });
    //   setState(() {
    //     isLoading = false;
    //   });
    // } catch (error) {
    //   throw error;
    // }
    // }
  }

  //
  @override
  Widget build(BuildContext context) {
    // return Center(child: Text('History page'));

    // final response = await http.get("https://fir-flutter-d60b0.firebaseio.com/userprofile.json?");
    // List<HealthHistory> History = [];
    // List<SensorData> SensorD =[];
    // List<Pred> PredData =[];
    // List finalHist = [];

    return isLoading
        ? Center(child: CircularProgressIndicator())
        : predHistList.length != dayHistList.length ||
                tempHistList.length != dayHistList.length ||
                tempHistList.length != predHistList.length
            ? Center(
                child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: 1,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          height: 300,
                          child: ListView(
                            children: [
                              Card(
                                elevation: 40,
                                child: Center(
                                    child: Text(
                                  "Past Results",
                                  style: TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Center(
                                    child: Text(
                                  'Day ' +
                                      dayHistList[index] +
                                      '/' +
                                      monthHistList[index] +
                                      '/' +
                                      yearHistList[index] +
                                      ' Predictions',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                )),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 40.0, vertical: 2),
                                child: Card(
                                  elevation: 15,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal:30.0),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20.0, vertical: 10),
                                          child: Row(
                                            children: [
                                              Text(
                                                'Prediction:  ',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18.0),
                                              ),
                                              Text(
                                                predHistList[index],
                                                style: TextStyle(
                                                    color: Colors.green,
                                                    fontSize: 20.0,
                                                    fontWeight: FontWeight.w800,),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20.0, vertical: 10),
                                          child: Row(
                                            children: [
                                              Text(
                                                'Temperature: ',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18.0),
                                              ),
                                              // tempHistList.map((data)=>{});
                                              // tempHistList as Map<Double, dynamic>;
                                              Text(
                                                tempHistList[index].toString(),
                                                style: TextStyle(
                                                    color: Colors.green,
                                                    fontSize: 20.0,
                                                    fontWeight: FontWeight.w800,),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20.0, vertical: 10),
                                          child: Row(
                                            children: [
                                              Text(
                                                'Time: ',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18.0),
                                              ),
                                              Text(
                                                hourHistList[index] +
                                                    ':' +
                                                    minHistList[index],
                                                style: TextStyle(
                                                    color: Colors.green,
                                                    fontSize: 20.0,
                                                    fontWeight: FontWeight.w800,),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20.0, vertical: 10),
                                          child: Row(
                                            children: [
                                              Text(
                                                'Pulse: ',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                              Text(
                                                pulseHistList[index].toString(),
                                                style: TextStyle(
                                                    color: Colors.green,
                                                    fontSize: 20.0,
                                                    fontWeight: FontWeight.w800,),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ));
                    }))
            : Center(
                child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: predHistList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          height: 200,
                          child: ListView(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Center(
                                    child: Text(
                                  'Day ' +
                                      dayHistList[index] +
                                      '/' +
                                      monthHistList[index] +
                                      '/' +
                                      yearHistList[index] +
                                      ' Predictions',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                )),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0, vertical: 2),
                                child: Card(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0, vertical: 10),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Prediction:  ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18.0),
                                            ),
                                            Text(
                                              predHistList[index],
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 14.0),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0, vertical: 10),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Temperature: ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18.0),
                                            ),
                                            // tempHistList.map((data)=>{});
                                            // tempHistList as Map<Double, dynamic>;
                                            Text(
                                              tempHistList[index].toString(),
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 18.0),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0, vertical: 10),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Time: ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18.0),
                                            ),
                                            Text(
                                              hourHistList[index] +
                                                  ':' +
                                                  minHistList[index],
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 18.0),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0, vertical: 10),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Pulse: ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            ),
                                            Text(
                                              pulseHistList[index].toString(),
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 18),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ));
                    })
//
                );
  }
}
