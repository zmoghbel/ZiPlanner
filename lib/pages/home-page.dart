import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ziplanner/pages/todo-page.dart';
import 'package:ziplanner/pages/calendar-page.dart';
import 'package:ziplanner/pages/setting-page.dart';
import 'package:ziplanner/zip-icons.dart';
import '../styles.dart';
import '../zip-icons.dart';

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
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0XFFFFFFFF),
        leading: IconButton(
          padding: EdgeInsets.only(left: 15),
          onPressed: () {
            print('Hamburger menue was tapped');
          },
          icon: Icon(
            ZipIcons.hamburger_menu,
            color: Color(0xFF324755),
            size: 22,
          ),
        ),
        title: Column(
          children: [
            Text(
              'ToDo',
              style: kappBarTitleStyle,
            ),
            SizedBox(height: 2),
            Text(
              'Task & Events',
              style: kappBarSubtitleStyle,
            ),
          ],
        ),
        actions: [
          IconButton(
            padding: EdgeInsets.only(right: 15),
            icon: Icon(
              ZipIcons.search,
              color: Color(0xFF324755),
              size: 25,
            ),
            onPressed: () {
              print('search icon was tapped');
            },
          )
        ],
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 20,
        selectedItemColor: Color(0XFFD97D54),
        unselectedItemColor: Color(0xFFCCCCCC),
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

/// Code by Zeinab on 2020/10/25.
/*class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

/// This is the private State class that goes with Home.
class _HomeState extends State<Home> {
  final GlobalKey<NavigatorState> firstTabNavKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> secondTabNavKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> thirdTabNavKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        activeColor: Colors.orange,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              ZipIcons.todo_list,
              //color: Color(0xFFCCCCCC),
            ),
            label: 'ToDo',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              ZipIcons.calendar,
              //color: Color(0xFFCCCCCC),
            ),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              ZipIcons.setting,
            ),

            // SvgPicture.asset(
            //   'assets/icons/settings.svg',
            // ),
            label: 'Setting',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        if (index == 0) {
          return CupertinoTabView(
            navigatorKey: firstTabNavKey,
            builder: (BuildContext context) => ToDoPage(),
          );
        } else if (index == 1) {
          return CupertinoTabView(
            navigatorKey: secondTabNavKey,
            builder: (BuildContext context) => CalendarPage(),
          );
        } else {
          return CupertinoTabView(
            navigatorKey: thirdTabNavKey,
            builder: (BuildContext context) => SettingPage(),
          );
        }
      },
    );
  }
}

*/
