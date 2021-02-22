import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ziplanner/components/day-list.dart';
import 'package:ziplanner/components/todo-text-field.dart';
import 'package:ziplanner/models/todo-data.dart';

class ToDoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TodoData>(
      builder: (BuildContext context, TodoData todoData, Widget child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 8,
              child: ListView(
                children: [
                  DayList('Today', todoData.todayTodos),
                  DayList('Tomorrow', todoData.tommorrowTodos),
                  DayList('In The Future', todoData.futureTodos),
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
                child: TodoTextField(
                  todos: todoData.todayTodos,
                ),
              ),
              //color: activeColor,
            ),
          ],
        );
      },
    );
  }
}
