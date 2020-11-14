import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ziplanner/components/top-bar.dart';
import 'package:ziplanner/pages/BlackPage.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TopBar(
      text: 'Calendar',
      uniqueHeroTag: 'calendar',
      child: Container(
        child: Text(
          'Index 1: calendar',
        ),
      ),
    );
  }
}
