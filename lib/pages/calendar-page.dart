import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ziplanner/components/top-bar.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TopBar(
      title: 'Calendar',
      uniqueHeroTag: 'calendar',
      child: Container(
        child: Text(
          'Index 1: calendar',
        ),
      ),
    );
  }
}
