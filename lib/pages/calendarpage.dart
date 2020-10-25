import 'package:flutter/material.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({
    Key key,
    @required this.optionStyle,
  }) : super(key: key);

  final TextStyle optionStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Index 1: Calendar',
      style: optionStyle,
    );
  }
}
