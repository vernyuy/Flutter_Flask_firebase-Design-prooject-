// import 'package:flutter/material.dart';

// class BottomNavigation extends StatelessWidget {
//   int _selectedIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       items: const <BottomNavigationBarItem>[
//         BottomNavigationBarItem(
//           icon: Icon(Icons.person),
//           label: 'Profile',
//         ),
//         BottomNavigationBarItem(
//             icon: Icon(Icons.batch_prediction),
//             label: 'Prediction',
//             backgroundColor: Colors.red),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.history_edu),
//           label: 'History',
//         )
//       ],
//       currentIndex: _selectedIndex,
//       selectedItemColor: Color.fromARGB(255, 0, 255, 21),
//       // onTap: (){return null;},
//     );
//   }
// }

// // int _index = 0;

// // @override
// // Widget build(BuildContext context) {
// //   Widget child = Container();

// //   switch(_index) {
// //     case 0:
// //       // ignore: prefer_const_constructors
// //       child = InputForm();
// //       break;

// //     case 1:
// //       child = Text('hello');
// //       break;
// //   }

// //   return Scaffold(
// //     appBar: AppBar(),
// //     bottomNavigationBar: _bottomTab(),
// //     body: SizedBox.expand(child: child),
// //   );
// // }

// // Widget _bottomTab() {
// //   return BottomNavigationBar(
// //     currentIndex: _index,
// //     onTap: (int index) => setState(() => _index = index),
// //     backgroundColor: Colors.deepPurple,
// //     items: [
// //       BottomNavigationBarItem(icon: Icon(Icons.looks_one), title: Text("1")),
// //       BottomNavigationBarItem(icon: Icon(Icons.looks_two), title: Text("2")),
// //     ],
// //   );
// // }

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, duplicate_ignore

import 'package:circularbar/widgets/history.dart';
import 'package:flutter/material.dart';

import 'input_form.dart';
import 'profile.dart';

// ignore: use_key_in_widget_constructors
class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Widget>> _pages = [
    {
      'page': Profile(),
      'title': Row(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Image(
            image: AssetImage('assets/images.png'),
            height: 100,
            width: 55,
          ),
          Padding(padding: EdgeInsets.symmetric(horizontal: 20)),
          Text('Heart Doctor')
        ],
      )
    },
    {
      'page': InputForm(),
      'title': Row(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Image(
            image: AssetImage('assets/images.png'),
            height: 100,
            width: 55,
          ),
          Padding(padding: EdgeInsets.symmetric(horizontal: 20)),
          Text('Heart Doctor')
        ],
      )
    },
    {
      'page': History(),
      'title': Row(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Image(
            image: AssetImage('assets/images.png'),
            height: 100,
            width: 55,
          ),
          Padding(padding: EdgeInsets.symmetric(horizontal: 20)),
          Text('Heart Doctor')
        ],
      ),
    },
  ];
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var wid = _pages[_selectedPageIndex]['page'];
    return Scaffold(
      appBar: AppBar(
        // leading: ,
        actions: [
      //     Drawer(
      //   child: Column(
      //     children: <Widget>[
      //       Text("Help"),
      //       Text("How to us this app")
      //     ],
      //   ),
      // ),
        ],
        title: _pages[_selectedPageIndex]['title'],
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.black,
        currentIndex: _selectedPageIndex,
        // type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Colors.purple,
              icon: Icon(Icons.person),
              label: 'Profile'),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.batch_prediction),
            label: 'Prediction',
            // title: _pages[_selectedPageIndex]['title'],
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.history),
            label: 'History',
            // title: _pages[_selectedPageIndex]['title'],
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Text("Help"),
            Text("How to us this app")
          ],
        ),
      ),
    );
  }
}
