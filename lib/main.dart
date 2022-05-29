import 'dart:core';

import 'package:flutter/material.dart';
// import 'package:percent_indicator/percent_indicator.dart';
// ignore: unused_import
import 'package:http/http.dart' as http;
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Heart Doctors',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TabsScreen(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   List Info = []; 
//   Future<List> firbaseFecth() async {
//     const url =
//         "https://health-monitoring-system-b5586-default-rtdb.firebaseio.com/info.json";
//     // ignore: unused_local_variable
//     final response = await http.get(Uri.parse(url));
//     final extractedData = json.decode(response.body) as Map<String, dynamic>;
//     final List loadedInfo = [];
//     extractedData.forEach((key, value) {
//       loadedInfo.add(value);
//     });
//     // ignore: avoid_print
//     debugPrint('debug: $loadedInfo');
//     Info = loadedInfo;
//     return (Info);
//   }

//   // @override
//   // Widget build(BuildContext context) {
//   //   // const url =
//   //   //     "https://health-monitoring-system-b5586-default-rtdb.firebaseio.com/info.json";
//   //   // //ignore: unused_local_variable
//   //   // final response = http.get(Uri.parse(url));
//   //   // print(json.decode(response.toString()));
//   //   // final info = this.firbaseFecth();
//   //   // // text.map(String, dynamic)hj
//   //   // print(Info);
//   //   return Scaffold(
//   //     appBar: AppBar(
//   //       // ignore: unnecessary_this
//   //       title: Text("Heart Doctor ${this.firbaseFecth()}"),
//   //     ),
//   //     body: Center(
//   //       child: ListView(children: <Widget>[
//   //         Row(
//   //           children: [
//   //             RaisedButton(
//   //               textColor: Colors.white,
//   //               color: Colors.blue,
//   //               child: Text('Sign In'),
//   //               onPressed: () {},
//   //             ),
//   //             RaisedButton(
//   //               textColor: Colors.white,
//   //               color: Colors.blue,
//   //               child: Text('Sign In'),
//   //               onPressed: () {},
//   //             )
//   //           ],
//   //         ),
//   //         Padding(
//   //             padding: EdgeInsets.all(60),
//   //             child: Column(
//   //               children: <Widget>[
//   //                 Padding(
//   //                   padding: EdgeInsets.all(15),
//   //                   child: TextField(
//   //                     decoration: InputDecoration(
//   //                       border: OutlineInputBorder(),
//   //                       labelText: 'User Name',
//   //                       hintText: 'Enter Your Name',
//   //                     ),
//   //                   ),
//   //                 ),
//   //                 Padding(
//   //                   padding: EdgeInsets.all(15),
//   //                   child: TextField(
//   //                     obscureText: true,
//   //                     decoration: InputDecoration(
//   //                       border: OutlineInputBorder(),
//   //                       labelText: 'Password',
//   //                       hintText: 'Enter Password',
//   //                     ),
//   //                   ),
//   //                 ),
//   //                 Padding(
//   //                   padding: EdgeInsets.all(15),
//   //                   child: TextField(
//   //                     obscureText: true,
//   //                     decoration: InputDecoration(
//   //                       border: OutlineInputBorder(),
//   //                       labelText: 'Password',
//   //                       hintText: 'Enter Password',
//   //                     ),
//   //                   ),
//   //                 ),
//   //                 Padding(
//   //                   padding: EdgeInsets.all(15),
//   //                   child: TextField(
//   //                     obscureText: true,
//   //                     decoration: InputDecoration(
//   //                       border: OutlineInputBorder(),
//   //                       labelText: 'Password',
//   //                       hintText: 'Enter Password',
//   //                     ),
//   //                   ),
//   //                 ),
//   //                 Padding(
//   //                   padding: EdgeInsets.all(15),
//   //                   child: TextField(
//   //                     obscureText: true,
//   //                     decoration: InputDecoration(
//   //                       border: OutlineInputBorder(),
//   //                       labelText: 'Password',
//   //                       hintText: 'Enter Password',
//   //                     ),
//   //                   ),
//   //                 ),
//   //                 Padding(
//   //                   padding: EdgeInsets.all(15),
//   //                   child: TextField(
//   //                     obscureText: true,
//   //                     decoration: InputDecoration(
//   //                       border: OutlineInputBorder(),
//   //                       labelText: 'Password',
//   //                       hintText: 'Enter Password',
//   //                     ),
//   //                   ),
//   //                 ),
//   //                 Padding(
//   //                   padding: EdgeInsets.all(15),
//   //                   child: TextField(
//   //                     obscureText: true,
//   //                     decoration: InputDecoration(
//   //                       border: OutlineInputBorder(),
//   //                       labelText: 'Password',
//   //                       hintText: 'Enter Password',
//   //                     ),
//   //                   ),
//   //                 ),
//   //                 Padding(
//   //                   padding: EdgeInsets.all(15),
//   //                   child: TextField(
//   //                     obscureText: true,
//   //                     decoration: InputDecoration(
//   //                       border: OutlineInputBorder(),
//   //                       labelText: 'Password',
//   //                       hintText: 'Enter Password',
//   //                     ),
//   //                   ),
//   //                 ),
//   //                 RaisedButton(
//   //                   textColor: Colors.white,
//   //                   color: Colors.blue,
//   //                   child: Text('Sign In'),
//   //                   onPressed: () {},
//   //                 )
//   //               ],
//   //             )),

//   //         // Container(
//   //         //   // ignore: prefer_const_constructors
//   //         //   // ignore: unnecessary_new
//   //         //   child: Row(
//   //         //     mainAxisAlignment: MainAxisAlignment.center,
//   //         //     children: <Widget>[
//   //         //       // ignore: duplicate_ignore
//   //         //       CircularPercentIndicator(
//   //         //         radius: 160.0,
//   //         //         lineWidth: 20.0,
//   //         //         percent: 0.10,
//   //         //         // ignore: prefer_const_constructors
//   //         //         center: Text("temp: 40deg"),
//   //         //         progressColor: Colors.blue,
//   //         //       ),
//   //         //       Padding(
//   //         //         padding: EdgeInsets.symmetric(horizontal: 10.0),
//   //         //       ),
//   //         //       Padding(
//   //         //         padding: EdgeInsets.symmetric(horizontal: 10.0),
//   //         //       ),
//   //         //       Padding(
//   //         //         padding: EdgeInsets.symmetric(horizontal: 10.0),
//   //         //       ),
//   //         //       CircularPercentIndicator(
//   //         //         radius: 75.0,
//   //         //         lineWidth: 15.0,
//   //         //         percent: 0.90,
//   //         //         center: Text("90%"),
//   //         //         progressColor: Colors.green,
//   //         //       )
//   //         //     ],
//   //         //   ),
//   //         //),
//   //       ]),
//   //     ),
//   //   );
//   // }

//   int _selectedIndex = 0;
//   static const TextStyle optionStyle =
//       TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
//   static const List<Widget> _widgetOptions = <Widget>[
//     Text(
//       'Profile Screen',
//       style: optionStyle,
//     ),
//     Padding(
//       padding: EdgeInsets.all(15),
//       child: TextField(
//         decoration: InputDecoration(
//           border: OutlineInputBorder(),
//           labelText: 'User Name',
//           hintText: 'Enter Your Name',
//         ),
//       ),
//     ),
//     Text(
//       'History Screen',
//       style: optionStyle,
//     )
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Heart Doctor'),
//       ),
//       body: Center(
//         child: _widgetOptions.elementAt(_selectedIndex),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.batch_prediction),
//               label: 'Prediction',
//               backgroundColor: Colors.red),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.history_edu),
//             label: 'History',
//           )
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Color.fromARGB(255, 0, 255, 21),
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }
