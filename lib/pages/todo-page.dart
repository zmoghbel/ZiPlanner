import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ziplanner/components/day-list.dart';
import 'package:ziplanner/components/todo-text-field.dart';

class ToDoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 8,
          child: ListView(
            children: [
              DayList('Today'),
              DayList('Tomorrow'),
              DayList('In The Future'),
            ],
          ),
        ),
        Material(
          elevation: 3,
          child: Container(
            color: Color(0xFFF4F4F4),
            padding: EdgeInsets.only(
              left: 20,
              top: 10,
              right: 20,
              bottom: 5,
            ),
            child: TodoTextField(),
          ),
        ),
      ],
    );
  }
}
