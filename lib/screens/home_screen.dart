// ignore_for_file: prefer_const_constructors, duplicate_ignore, non_constant_identifier_names

import 'dart:core';

import 'package:flutter/material.dart';
// import 'package:percent_indicator/percent_indicator.dart';
// ignore: unused_import
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../widgets/input_form.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List Info = [];
  Future<List> firbaseFecth() async {
    const url =
        "https://health-monitoring-system-b5586-default-rtdb.firebaseio.com/info.json";
    // ignore: unused_local_variable
    final response = await http.get(Uri.parse(url));
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    final List loadedInfo = [];
    extractedData.forEach((key, value) {
      loadedInfo.add(value);
    });
    // ignore: avoid_print
    debugPrint('debug: $loadedInfo');
    Info = loadedInfo;
    return (Info);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        // ignore: unnecessary_this
        title: Text("Heart Doctor ${this.firbaseFecth()}"),
      ),
      body: InputForm(),
    );
  }
}
