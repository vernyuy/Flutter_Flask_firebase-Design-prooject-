// ignore_for_file: prefer_const_constructors

import 'package:circularbar/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String Name = '';
  String Password = '';
  String userName = 'Fonchu';
  String userPass = '1234';
  var tcVisibility = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 211, 208, 208),
      body: ListView(children: [
        Container(
          // color: Color.fromARGB(122, 211, 208, 208),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              children: [
                Image.asset(
                  'assets/images.png',
                  height: 350,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Visibility(
                              visible: tcVisibility,
                              child: Text(
                                'Please Check your Name and Password and Try again!',
                                style: TextStyle(color: Colors.red),
                              )),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    inputFormatters: <TextInputFormatter>[],
                    onChanged: (value) => Name = value,
                    style: const TextStyle(
                      fontSize: 15.0,
                      height: 0.01,
                      color: Colors.black,
                    ),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name',
                      hintText: 'Enter Your Name',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20, horizontal: 20.0),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    inputFormatters: <TextInputFormatter>[],
                    onChanged: (value) => Password = value,
                    style: const TextStyle(
                      fontSize: 15.0,
                      height: 0.01,
                      color: Colors.black,
                    ),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter Your Password',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 45.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      onPrimary: Colors.white,
                      shadowColor: Colors.blueAccent,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      minimumSize: Size(500, 40), //////// HERE
                    ),
                    onPressed: () {
                      if (Name == userName && Password == userPass) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => TabsScreen()));
                      } else {
                        setState(() {
                          tcVisibility = true;
                        });
                      }
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
