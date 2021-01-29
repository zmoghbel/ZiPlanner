import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ziplanner/components/ziplanner-appbar.dart';
import 'package:ziplanner/pages/calendar-page.dart';
import 'package:ziplanner/pages/setting-page.dart';
import 'package:ziplanner/pages/todo-page.dart';
import 'package:ziplanner/zip-icons.dart';

import '../styles.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> tabs = [
    ToDoPage(),
    CalendarPage(),
    SettingPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: ZiplannerAppBar(
        title: 'ToDo',
        subtitle: 'Tasks & Events',
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 20,
        selectedItemColor: Color(0XFFD97D54),
        unselectedItemColor: Color(0xFF324755),
        currentIndex: _currentIndex,
        iconSize: 35,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              ZipIcons.todo_list,
            ),
            label: 'To do list',
          ),
          BottomNavigationBarItem(
            icon: Icon(ZipIcons.calendar),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(ZipIcons.setting),
            label: 'Settings',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
