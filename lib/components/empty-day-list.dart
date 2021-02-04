import 'package:flutter/material.dart';
import 'package:ziplanner/components/todo-text-field.dart';
import 'package:ziplanner/styles.dart';

class EmptyDayList extends StatelessWidget {
  EmptyDayList(this.title);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0, left: 20, right: 20, bottom: 10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title, style: kTitleStyle),
        SizedBox(height: 15),
        TodoTextField(),
      ]),
    );
  }
}
