import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ziplanner/components/top-bar.dart';

import '../styles.dart';

class CalendarPage extends StatelessWidget {
  static const String path = '/calendar';

  const CalendarPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TopBar(
      title: 'Calendar',
      titleStyle: kappBarTitleStyle,
      subtitle: '',
      subtitleStyle: kappBarSubtitleStyle,
      uniqueHeroTag: 'calendar',
      child: Container(
        child: Text(
          'Index 1: calendar',
        ),
      ),
    );
  }
}
