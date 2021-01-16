import 'package:flutter/material.dart';
import 'package:ziplanner/components/todo-text-field.dart';
import 'package:ziplanner/styles.dart';

class EmptyDayList extends StatefulWidget {
  EmptyDayList(this.title);
  final String title;
  @override
  _EmptyDayListState createState() => _EmptyDayListState();
}

class _EmptyDayListState extends State<EmptyDayList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(widget.title, style: kDayTitleStyle),
        SizedBox(height: 15),
        TodoTextField(),
      ]),
    );
  }
}
