// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          // padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Container(
                child: Container(
                  child: Stack(clipBehavior: Clip.none, children: [
                    Image.asset(
                      'assets/me.jpg',
                      fit: BoxFit.cover,
                      height: 250,
                      width: 500,
                    ),
                    Positioned(
                      left: 110.0,
                      top: 100.0,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        height: 255,
                        width: 195,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.red,
                            border: Border.all()),
                        child: Image.asset(
                          'assets/me2.jpg',
                          height: 230,
                        ),
                      ),

                      // AssetImage('assets/images.png'),
                      // CircleAvatar(

                      //             backgroundColor: Colors.blue,
                      //             backgroundImage: AssetImage('assets/images.png'),
                      //             radius: 90,

                      //           ),
                    ),
                  ]),
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        // color: Color.fromARGB(255, 146, 53, 53),
                        blurRadius: 10.0)
                  ]),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 80),
                height: 160,
                width: 400,
                child: Card(
                  elevation: 50,
                    child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60.0, vertical: 2),
                  child: Column(
                    children: [
                      Center(
                          child: Text(
                        'My Info',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
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
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.normal),
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
                              vertical: 5.0, horizontal: 29.0),
                        ),
                        Text(
                          '40years',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal),
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
                              vertical: 5.0, horizontal: 29.0),
                        ),
                        Text(
                          'Female',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal),
                        )
                      ])
                    ],
                  ),
                )),
              ),
              Container(
                height: 150,
                width: 400,
                transform: Matrix4.translationValues(0.0, -70.0, 0.0),
                child: Card(
                  elevation: 50,
                    child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40.0, vertical: 2),
                  child: Column(
                    children: [
                      Center(
                        child: Row(
                          children: [
                            CircleAvatar(backgroundImage: AssetImage('assets/me.jpg')),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 15)),
                            Center(
                              child: Text(
                                'My Docs Info',
                                style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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
                                fontSize: 20, fontWeight: FontWeight.bold),
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
                              vertical: 5.0, horizontal: 12.0),
                        ),
                        Text(
                          '650863381',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal),
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
                              vertical: 5.0, horizontal: 27.0),
                        ),
                        Text(
                          'fonchu@fonchu.cm',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal),
                        )
                      ])
                    ],
                  ),
                )),
              )
            ],
          ),
        ),
      ],
    );
  }
}
