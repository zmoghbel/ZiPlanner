import 'package:flutter/material.dart';
import 'package:ziplanner/components/todos-list.dart';
import 'package:ziplanner/models/todo.dart';
import '../styles.dart';

class DayList extends StatefulWidget {
  final String dayTitle;
  final List<Todo> todos;

  DayList(this.dayTitle, this.todos);

  @override
  _DayListState createState() => _DayListState();
}

class _DayListState extends State<DayList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 50.0, left: 20, right: 20, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.dayTitle, style: kTitleStyle),
          SizedBox(height: 15),
          TodosList(widget.todos),
        ],
      ),
    );
  }
}
