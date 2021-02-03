import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ziplanner/components/empty-day-list.dart';
import 'package:ziplanner/components/filled-day-list.dart';
import 'package:ziplanner/models/todo-data.dart';

class ToDoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 8,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Consumer<TodoData>(
              builder: (BuildContext context, TodoData todoData, Widget child) {
                return ListView(
                  children: [
                    todoData.todayTodos.isEmpty
                        ? EmptyDayList('Today')
                        : FilledDayList('Today', todoData.todayTodos),
                    todoData.tommorrowTodos.isEmpty
                        ? EmptyDayList('Tomorrow')
                        : FilledDayList('Tomorrow', todoData.tommorrowTodos),
                    todoData.futureTodos.isEmpty
                        ? EmptyDayList('In The Future')
                        : FilledDayList('In The Future', todoData.futureTodos)
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
