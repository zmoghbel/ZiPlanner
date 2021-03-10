import 'package:flutter/material.dart';
import 'package:ziplanner/components/todos-list.dart';

import '../styles.dart';

class DayList extends StatelessWidget {
  final String dayTitle;
  final DateTime date;

  DayList(this.dayTitle, this.date);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 50.0, left: 20, right: 20, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(dayTitle, style: kTitleStyle),
          SizedBox(height: 15),
          TodosList(date),
        ],
      ),
    );
  }
}
