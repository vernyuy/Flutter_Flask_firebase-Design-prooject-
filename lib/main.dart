
import 'package:circularbar/providers/healt.dart';
import 'package:flutter/material.dart';
// import 'package:percent_indicator/percent_indicator.dart';
// ignore: unused_import
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
// import 'dart:convert';

// import 'screens/home_screen.dart';
import 'widgets/bottom_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Health(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Heart Doctors',
        theme: ThemeData(primarySwatch: Colors.red),
        home: TabsScreen(),
      ),
    );
  }
}

