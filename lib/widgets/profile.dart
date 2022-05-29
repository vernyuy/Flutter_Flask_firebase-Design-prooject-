// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Container(
                height: 240,
                width: 400,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 10,
                  ),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.blue,
                        backgroundImage: AssetImage('assets/images.png'),
                        radius: 100,
                        // child: Icon(
                        //   Icons.person_outlined,
                        //   size: 120,
                        // ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 160,
                width: 400,
                child: Card(
                    child: Column(
                  children: [
                    Center(child: Text('My Info')),
                    Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 0.0),
                        ),
                    Row(
                      children: [
                        Text(
                          'Name: ',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 20.0),
                        ),
                        Text(
                          'N. Pelagie',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic
                          ),
                        ),
                      ],
                    ),
                    Row(children: [
                      Text(
                        'Age: ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 20.0),
                      ),
                      Text(
                        '40years',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic
                        ),
                      )
                    ]),
                    Row(children: [
                      Text(
                        'Sex: ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 20.0),
                      ),
                      Text(
                        'Female',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic
                        ),
                      )
                    ])
                  ],
                )),
              ),

              Container(
                height: 150,
                width: 400,
                child: Card(
                    child: Column(
                  children: [
                    Center(child: Text('My Docs Info')),
                    Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 0.0),
                        ),
                    Row(
                      children: [
                        Text(
                          'Name: ',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 20.0),
                        ),
                        Text(
                          'Dr. F Fonchu',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic
                          ),
                        ),
                      ],
                    ),
                    Row(children: [
                      Text(
                        'Contact: ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 20.0),
                      ),
                      Text(
                        '650863381',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic
                        ),
                      )
                    ]),
                    Row(children: [
                      Text(
                        'Mail: ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 20.0),
                      ),
                      Text(
                        'fonchu@fonchu.cm',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic
                        ),
                      )
                    ])
                  ],
                )),
              )
            ],
          ),
        ),
      ],
    );
  }
}
