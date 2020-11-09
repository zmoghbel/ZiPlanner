import 'package:flutter/material.dart';
import 'package:ziplanner/pages/todo-page.dart';
import 'package:ziplanner/pages/calendar-page.dart';
import 'package:ziplanner/pages/setting-page.dart';

/// Code by Zeinab on 2020/10/25.
class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

/// This is the private State class that goes with Home.
class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    ToDoPage(),
    CalendarPage(),
    SettingPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(
            Icons.subject,
            color: Colors.black,
          ),
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('To Do',
                  style: TextStyle(color: Colors.black, fontSize: 25)),
              SizedBox(
                width: 140,
              ),
              Icon(
                Icons.search,
                color: Colors.black,
              ),
            ],
          ),
          centerTitle: true,
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment_turned_in),
<<<<<<< HEAD:lib/pages/home-page.dart
              label: 'ToDo',
=======
              label: 'To do',
>>>>>>> 6ef6d91afbfa27136a4577b2923725c8735064e5:lib/pages/home.dart
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_sharp),
              label: 'Calendar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Setting',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
