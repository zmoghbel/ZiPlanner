import 'package:flutter/material.dart';
import 'package:ziplanner/components/todos-list.dart';
import 'package:ziplanner/models/todo.dart';

import 'empty-day-list.dart';

class FilledDayListWithTF extends StatelessWidget {
  FilledDayListWithTF(this.title, this.todos);
  final String title;
  final List<Todo> todos;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        EmptyDayList(
          title,
          todos,
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 0, bottom: 10, right: 20, left: 20),
          child: TodosList(todos),
        ),
      ],
    );
  }
}
