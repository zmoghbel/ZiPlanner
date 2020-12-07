import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
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
            icon: SvgPicture.asset(
              'assets/icons/todo.svg',
              color: Color(0xFFCCCCCC),
            ),

            //Icon(ZipIcons.todo_list),
            label: 'ToDo',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/calendar.svg',
              color: Color(0xFFCCCCCC),
            ),

            //Icon(ZipIcons.calendar),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/settings.svg',
              color: Color(0xFFCCCCCC),
            ),
            //Icon(ZipIcons.setting),
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
