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

  Future<void> readData() async {
    // Please replace the Database URL
    // which we will get in “Add Realtime Database”
    // step with DatabaseURL

    var url = "https://heartdoc-ff00b-default-rtdb.firebaseio.com" +
        "/prediction.json";
    var urlSensor = "https://heartdoc-ff00b-default-rtdb.firebaseio.com" +
        "/sensorData.json";
//
    // Do not remove “data.json”,keep it as it is
    try {
      final response = await http.get(Uri.parse(url));
      final sensorRes = await http.get(Uri.parse(urlSensor)); //Sensor
      final extractedSensorData = json.decode(sensorRes.body) as Map<String, dynamic>; // Sensor Temp
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      
      // Prediction /////////////////////
      if (extractedData == null) {
        return;
      }
      extractedData.forEach((blogId, blogData) {
        predHistList.add(blogData["pred"]);
      });
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
        : Center(
            child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: predHistList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      height: 50,
                      child: ListView(
                        children: [
                          Center(child: Text('Day '+index.toString()+' Predictions')),
                          Column(
                          children: [
                            // Center(
                            //   child: Text(
                            //     predHistList[index],
                            //     style: TextStyle(color: Colors.green),
                            //   ),
                            // ),
                            Row(
                              children: [
                                Text(
                                  'Prediction:  ',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                predHistList[index],
                                style: TextStyle(color: Colors.green),
                              ),
                              ],
                            ),
                      
                            Row(
                              children: [
                                Text(
                                  'Temperature: ',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                // tempHistList.map((data)=>{});
                                // tempHistList as Map<Double, dynamic>;
                                Text(
                                tempHistList[index].toString(),
                                style: TextStyle(color: Colors.green),
                              ),
                              ],
                            ),
                      
                            Row(
                              children: [
                                Text(
                                  'Pulse: ',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                pulseHistList[index].toString(),
                                style: TextStyle(color: Colors.green),
                              ),
                              ],
                            )
                          ],
                        )],
                      ));
                })
//       child: ListView(children: <Widget>[
//         Padding(
//           padding: const EdgeInsets.all(2.0),
//           child: Column(
//             children: [
//               Container(
//                 child: Row(
//                   children: <Widget>[
//                     Padding(
//                         padding: EdgeInsets.symmetric(
//                             vertical: 25.0, horizontal: 10)),
//                     Text(
//                       'BMI',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     Padding(
//                         padding: EdgeInsets.symmetric(
//                             vertical: 0.0, horizontal: 12)),
//                     Text(
//                       'Temp',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     Padding(
//                         padding: EdgeInsets.symmetric(
//                             vertical: 0.0, horizontal: 12)),
//                     Text(
//                       'BP',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     Padding(
//                         padding: EdgeInsets.symmetric(
//                             vertical: 0.0, horizontal: 12)),
//                     Text(
//                       'Risk',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     Padding(
//                         padding: EdgeInsets.symmetric(
//                             vertical: 0.0, horizontal: 12)),
//                     Text(
//                       'Predictions',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     Padding(
//                         padding: EdgeInsets.symmetric(
//                             vertical: 0.0, horizontal: 12)),
//                     Text(
//                       'Risk',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//               ),
//               RaisedButton(
//                   textColor: Colors.white,
//                   color: Colors.blue,
//                   child: Text('Load History'),
//                   onPressed: () async {
//                     final urlSensor =
//                         "https://heartdoc-ff00b-default-rtdb.firebaseio.com" +
//                             "/sensorData.json";
//                     final SensorRes =await http.get(
//                       Uri.parse(urlSensor),
//                     );

//                     // print(SensorRes.body);
//                     final val = SensorRes.body;
//                     final extractedSensor =
//                         await json.decode(val) as Map<String, dynamic>;
//                     final List<SensorData> loadedInf = [];
//                     extractedSensor.forEach((HistoryID, HistoryData) {
//                       loadedInf.add(
//                         SensorData(
//                             id: HistoryID,
//                             Temp: HistoryData['temp'],
//                             Pulse: HistoryData['pulse']),
//                       );
//                       // print(extractedHist);
//                       History = loadedInf.cast<HealthHistory>();
//                       // print('Data in history:');
//                       // // fetchedData();
//                       // print(History);
//                       print(loadedInf);
//                     });

//                     final urlPred =
//                         "https://heartdoc-ff00b-default-rtdb.firebaseio.com" +
//                             "/prediction.json";
//                     final PredRes =await http.get(
//                       Uri.parse(urlPred),
//                     );
//                     // print(SensorRes.body);
//                     final pred = PredRes.body;
//                     final extractedPred =
//                         await json.decode(pred) as Map<String, dynamic>;
//                     final List<Pred> loadedPred = [];
//                     extractedPred.forEach((PredHistoryID, PredHistoryData) {
//                       loadedPred.add(
//                         Pred(
//                             id: PredHistoryID,
//                             Prediction: PredHistoryData['pred'])
//                       );
//                       // print(extractedHist);
//                       // History = loadedInf;
//                       // print('Data in history:');
//                       // // fetchedData();
//                       // print(History);
//                       print(loadedPred[0]);
//                     });

//                     loadedPred.map((data) => print(data));
//                     finalHist.add(extractedPred);
//                     // Pred(Prediction: extractedPred['pred'], id: extractedPred);
//                     print(extractedPred);
//                   })
//             ],
//           ),

// // History as Map<String, dynamic>;
// // print{History};
//         ),
//       ]),
//     );
//     // ignore: dead_code
//   }

//   void fetchedData(){
//     print(History);
//   }
            );
  }
}
