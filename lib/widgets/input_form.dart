// ignore_for_file: prefer_const_constructors, duplicate_ignore, unused_local_variable, avoid_print, use_key_in_widget_constructors, deprecated_member_use, unused_import, annotate_overrides, prefer_const_declarations

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import '../providers/healthInfo.dart';
import '../providers/healt.dart';
import '../providers/dateTime.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

class InputForm extends StatefulWidget {
  @override
  State<InputForm> createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {

  void initState() {
    super.initState();
    // readData();
  }
  
  bool isLoading = true;
  //  Variables
  var _healthParams = HealthInfo(
    Age: 0,
    CA: 0,
    Sex: 0,
    Thal: 0,
    chol: 0,
    cp: 0,
    exang: 0,
    fps: 0,
    oldpeak: 0,
    restecg: 0,
    slope: 0,
    trestbps: 0,
  );

  var _dayTime = DayTime(
    Day: "", 
    Month: "", 
    Year: "", 
    Hour: "", 
    Min: ""
  );
  late String title;
  String text = "No Value Entered";

  void _setText() {
    setState(() {
      text = title;
    });
  }

  @override
  Widget build(BuildContext context) {
    // List of items in our dropdown menu
    var items = [
      'Male',
      'Female',
    ];
    String dropdownvalue = items[0];
    return Center(
      child: ListView(children: <Widget>[
        Padding(
          padding: EdgeInsets.all(15.0),
          child: Card(
            elevation:20,
            child: Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.symmetric(vertical:12)),
                Text("Fill the Form to Check your Heart"),
                Padding(padding: EdgeInsets.symmetric(vertical:12)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 1),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    onChanged: (value) => _healthParams = HealthInfo(
                      Age: int.parse(value),
                      CA: _healthParams.CA,
                      Sex: _healthParams.Sex,
                      Thal: _healthParams.Thal,
                      chol: _healthParams.chol,
                      cp: _healthParams.cp,
                      exang: _healthParams.exang,
                      fps: _healthParams.fps,
                      oldpeak: _healthParams.oldpeak,
                      restecg: _healthParams.restecg,
                      slope: _healthParams.slope,
                      trestbps: _healthParams.trestbps,
                    ),
                    style: TextStyle(
                      fontSize: 15.0,
                      height: 0.01,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Your Age',
                      hintText: 'Enter Your Age',
                    ),
                  ),
                ),
                // Row(
                //   children: [
                //     Padding(
                //       padding:
                //           EdgeInsets.symmetric(horizontal: 30.0, vertical: 0),
                //     ),
                //     DropdownButton(
                //         value: dropdownvalue,
                //         icon: const Icon(Icons.keyboard_arrow_down),
                //         items: items.map((String items) {
                //           return DropdownMenuItem(
                //             value: items,
                //             child: Text(items),
                //           );
                //         }).toList(),
                //         onChanged: (String? newValue) {
                //           setState(() {
                //             dropdownvalue = newValue!;
                //           });
                //         }),
                //     Padding(
                //       padding:
                //           EdgeInsets.symmetric(horizontal: 30.0, vertical: 0),
                //     ),
                //     DropdownButton(
                //       value: dropdownvalue,
                //       icon: const Icon(Icons.keyboard_arrow_down),
                //       items: items.map((String items) {
                //         return DropdownMenuItem(
                //           value: items,
                //           child: Text(items),
                //         );
                //       }).toList(),
                //       onChanged: (String? newValue) {
                //         setState(() {
                //           dropdownvalue = newValue!;
                //         });
                //       },
                //     ),
                //   ],
                // ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 1),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      onChanged: (value) => _healthParams = HealthInfo(
                        Age: _healthParams.Age,
                        CA: int.parse(value),
                        Sex: _healthParams.Sex,
                        Thal: _healthParams.Thal,
                        chol: _healthParams.chol,
                        cp: _healthParams.cp,
                        exang: _healthParams.exang,
                        fps: _healthParams.fps,
                        oldpeak: _healthParams.oldpeak,
                        restecg: _healthParams.restecg,
                        slope: _healthParams.slope,
                        trestbps: _healthParams.trestbps,
                      ),
                      style: TextStyle(
                        fontSize: 15.0,
                        height: 0.01,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter CA value',
                        hintText: 'Enter CA value',
                      ),
                    ),
                  ),
                ),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 15, vertical: 1),
                //   child: TextField(
                //     style: TextStyle(
                //       fontSize: 15.0,
                //       height: 0.01,
                //       color: Colors.black,
                //     ),
                //     decoration: InputDecoration(
                //       border: OutlineInputBorder(),
                //       labelText: 'Serun Cholesterol',
                //       hintText: 'Enter Serum Cholesterol',
                //     ),
                //   ),
                // ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 1),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    onChanged: (value) => _healthParams = HealthInfo(
                      Age: _healthParams.Age,
                      CA: _healthParams.CA,
                      Sex: int.parse(value),
                      Thal: _healthParams.Thal,
                      chol: _healthParams.chol,
                      cp: _healthParams.cp,
                      exang: _healthParams.exang,
                      fps: _healthParams.fps,
                      oldpeak: _healthParams.oldpeak,
                      restecg: _healthParams.restecg,
                      slope: _healthParams.slope,
                      trestbps: _healthParams.trestbps,
                    ),
                    style: TextStyle(
                      fontSize: 15.0,
                      height: 0.01,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Sex',
                      hintText: 'Enter Sex 1 for male 0 for female',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 1),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    onChanged: (value) => _healthParams = HealthInfo(
                      Age: _healthParams.Age,
                      CA: _healthParams.CA,
                      Sex: _healthParams.Sex,
                      Thal: int.parse(value),
                      chol: _healthParams.chol,
                      cp: _healthParams.cp,
                      exang: _healthParams.exang,
                      fps: _healthParams.fps,
                      oldpeak: _healthParams.oldpeak,
                      restecg: _healthParams.restecg,
                      slope: _healthParams.slope,
                      trestbps: _healthParams.trestbps,
                    ),
                    style: TextStyle(
                      fontSize: 15.0,
                      height: 0.01,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Thal value',
                      hintText: 'Enter Your Thal',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 1),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    onChanged: (value) => _healthParams = HealthInfo(
                      Age: _healthParams.Age,
                      CA: _healthParams.CA,
                      Sex: _healthParams.Sex,
                      Thal: _healthParams.Thal,
                      chol: int.parse(value),
                      cp: _healthParams.cp,
                      exang: _healthParams.exang,
                      fps: _healthParams.fps,
                      oldpeak: _healthParams.oldpeak,
                      restecg: _healthParams.restecg,
                      slope: _healthParams.slope,
                      trestbps: _healthParams.trestbps,
                    ),
                    style: TextStyle(
                      fontSize: 15.0,
                      height: 0.01,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Chol',
                      hintText: 'Enter Chol Value',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 1),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    onChanged: (value) => _healthParams = HealthInfo(
                      Age: _healthParams.Age,
                      CA: _healthParams.CA,
                      Sex: _healthParams.Sex,
                      Thal: _healthParams.Thal,
                      chol:  _healthParams.chol,
                      cp: int.parse(value) ,
                      exang: _healthParams.exang,
                      fps: _healthParams.fps,
                      oldpeak: _healthParams.oldpeak,
                      restecg: _healthParams.restecg,
                      slope: _healthParams.slope,
                      trestbps: _healthParams.trestbps,
                    ),
                    style: TextStyle(
                      fontSize: 15.0,
                      height: 0.01,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'CP value',
                      hintText: 'Enter Your Chest Pain',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 1),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    onChanged: (value) => _healthParams = HealthInfo(
                      Age: _healthParams.Age,
                      CA: _healthParams.CA,
                      Sex: _healthParams.Sex,
                      Thal: _healthParams.Thal,
                      chol: _healthParams.chol,
                      cp: int.parse(value),
                      exang: _healthParams.exang,
                      fps: _healthParams.fps,
                      oldpeak: _healthParams.oldpeak,
                      restecg: _healthParams.restecg,
                      slope: _healthParams.slope,
                      trestbps: _healthParams.trestbps,
                    ),
                    style: TextStyle(
                      fontSize: 15.0,
                      height: 0.01,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                      hintText: 'Enter Your Name',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 1),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    onChanged: (value) => _healthParams = HealthInfo(
                      Age: _healthParams.Age,
                      CA: _healthParams.CA,
                      Sex: _healthParams.Sex,
                      Thal: _healthParams.Thal,
                      chol: _healthParams.chol,
                      cp: _healthParams.cp,
                      exang: int.parse(value),
                      fps: _healthParams.fps,
                      oldpeak: _healthParams.oldpeak,
                      restecg: _healthParams.restecg,
                      slope: _healthParams.slope,
                      trestbps: _healthParams.trestbps,
                    ),
                    style: TextStyle(
                      fontSize: 15.0,
                      height: 0.01,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Exang',
                      hintText: 'Enter Your Exang Value',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 1),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    onChanged: (value) => _healthParams = HealthInfo(
                      Age: _healthParams.Age,
                      CA: _healthParams.CA,
                      Sex: _healthParams.Sex,
                      Thal: _healthParams.Thal,
                      chol: _healthParams.chol,
                      cp: _healthParams.cp,
                      exang: _healthParams.exang,
                      fps: int.parse(value),
                      oldpeak: _healthParams.oldpeak,
                      restecg: _healthParams.restecg,
                      slope: _healthParams.slope,
                      trestbps: _healthParams.trestbps,
                    ),
                    style: TextStyle(
                      fontSize: 15.0,
                      height: 0.01,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'fps',
                      hintText: 'Enter FPS value',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 1),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    onChanged: (value) => _healthParams = HealthInfo(
                      Age: _healthParams.Age,
                      CA: _healthParams.CA,
                      Sex: _healthParams.Sex,
                      Thal: _healthParams.Thal,
                      chol: _healthParams.chol,
                      cp: _healthParams.cp,
                      exang: _healthParams.exang,
                      fps: _healthParams.fps,
                      oldpeak: int.parse(value),
                      restecg: _healthParams.restecg,
                      slope: _healthParams.slope,
                      trestbps: _healthParams.trestbps,
                    ),
                    style: TextStyle(
                      fontSize: 15.0,
                      height: 0.01,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'oldpeak',
                      hintText: 'Enter Your Old Peak value',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 1),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    onChanged: (value) => _healthParams = HealthInfo(
                      Age: _healthParams.Age,
                      CA: _healthParams.CA,
                      Sex: _healthParams.Sex,
                      Thal: _healthParams.Thal,
                      chol: _healthParams.chol,
                      cp: _healthParams.cp,
                      exang: _healthParams.exang,
                      fps: _healthParams.fps,
                      oldpeak: _healthParams.oldpeak,
                      restecg: int.parse(value),
                      slope: _healthParams.slope,
                      trestbps: _healthParams.trestbps,
                    ),
                    style: TextStyle(
                      fontSize: 15.0,
                      height: 0.01,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Restecg',
                      hintText: 'Enter Restecg Value',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 1),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    onChanged: (value) => _healthParams = HealthInfo(
                      Age: _healthParams.Age,
                      CA: _healthParams.CA,
                      Sex: _healthParams.Sex,
                      Thal: _healthParams.Thal,
                      chol: _healthParams.chol,
                      cp: _healthParams.cp,
                      exang: _healthParams.exang,
                      fps: _healthParams.fps,
                      oldpeak: _healthParams.oldpeak,
                      restecg: _healthParams.restecg,
                      slope: int.parse(value),
                      trestbps: _healthParams.trestbps,
                    ),
                    style: TextStyle(
                      fontSize: 15.0,
                      height: 0.01,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Slope',
                      hintText: 'Enter Your Slope Value',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 1),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    onChanged: (value) => _healthParams = HealthInfo(
                      Age: _healthParams.Age,
                      CA: _healthParams.CA,
                      Sex: _healthParams.Sex,
                      Thal: _healthParams.Thal,
                      chol: _healthParams.chol,
                      cp: _healthParams.cp,
                      exang: _healthParams.exang,
                      fps: _healthParams.fps,
                      oldpeak: _healthParams.oldpeak,
                      restecg: _healthParams.restecg,
                      slope: _healthParams.slope,
                      trestbps: int.parse(value),
                    ),
                    style: TextStyle(
                      fontSize: 15.0,
                      height: 0.01,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'TrestBPS',
                      hintText: 'Enter Your trestbps value',
                    ),
                  ),
                ),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 15, vertical: 1),
                //   child: TextField(
                //     style: TextStyle(
                //       fontSize: 15.0,
                //       height: 0.01,
                //       color: Colors.black,
                //     ),
                //     decoration: InputDecoration(
                //       border: OutlineInputBorder(),
                //       labelText: 'User Name',
                //       hintText: 'Enter Your Name',
                //     ),
                //   ),
                // ),
                RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  child: Text('Predict'),
                  onPressed: () async {
                    final url = Uri.http("192.168.43.250:5000", "/");
                    final getUrl = "127.0.0.1:5000" + "/";
                    // final res = await http.post(
                    //   url,
                    //   body: json.encode({'test': 'test'}),
                    // );
                    final res = await http.get(
                      Uri.parse(getUrl)
                    );
                    // final extractedData = json.decode(res.body) as Map<String, dynamic>;
          
                    print(res.body);
          
                    // if (res.statusCode == 200) {
                    //   // final infoResponse = jsonDecode(res.body) as Map<String, dynamic>;
                    //   // prediction = infoResponse['prediction'];
                    //   // setState(() {
                    //   //   pred = prediction;
                    //   //   risk = risk
                    //   // });
                    // } else {
                    //   // ignore: avoid_print
                    //   print('request failed with status: ${res.statusCode}');
                    // }
          
                    Provider.of<Health>(context, listen: false)
                        .addInfo(_healthParams);
                    _dayTime = DayTime(
                      Day: DateTime.now().day.toString(), 
                      Month: DateTime.now().month.toString(), 
                      Year: DateTime.now().year.toString(), 
                      Hour: DateTime.now().hour.toString(), 
                      Min: DateTime.now().minute.toString()
                    );
          
                    Provider.of<Health>(context, listen:false).addDayTime(_dayTime);
                  },
                )
              ],
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Card(
            elevation: 10,
            child: Column(children: <Widget>[
              Card(
                child: Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: <Widget>[
                    Text(
                      'Result:   ',
                    ),
                    Text('Prediction Result: eg no disease '),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              ),
              Card(
                child: Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: <Widget>[
                    Text(
                      'Risk Level(0-4):      ',
                    ),
                    Text('4'),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        onPrimary: Colors.white,
                        shadowColor: Colors.greenAccent,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        minimumSize: Size(100, 60), //////// HERE
                      ),
                      onPressed: () {},
                      child: Text('Save Results'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      onPrimary: Colors.white,
                      shadowColor: Colors.greenAccent,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      minimumSize: Size(115, 60), //////// HERE
                    ),
                    onPressed: _setText,
                    child: Text('Send Results'),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              ),
              
              Text(text),
            ]),
          ),
        )
        // Container(
        //   // ignore: prefer_const_constructors
        //   // ignore: unnecessary_new
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: <Widget>[
        //       // ignore: duplicate_ignore
        //       CircularPercentIndicator(
        //         radius: 160.0,
        //         lineWidth: 20.0,
        //         percent: 0.10,
        //         // ignore: prefer_const_constructors
        //         center: Text("temp: 40deg"),
        //         progressColor: Colors.blue,
        //       ),
        //       Padding(
        //         padding: EdgeInsets.symmetric(horizontal: 10.0),
        //       ),
        //       Padding(
        //         padding: EdgeInsets.symmetric(horizontal: 10.0),
        //       ),
        //       Padding(
        //         padding: EdgeInsets.symmetric(horizontal: 10.0),
        //       ),
        //       CircularPercentIndicator(
        //         radius: 75.0,
        //         lineWidth: 15.0,
        //         percent: 0.90,
        //         center: Text("90%"),
        //         progressColor: Colors.green,
        //       )
        //     ],
        //   ),
        //),
      ]),
    );
  }
}
