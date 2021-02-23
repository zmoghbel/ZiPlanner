import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ziplanner/components/todo-tile.dart';
import 'package:ziplanner/models/todo-data.dart';
import 'package:ziplanner/models/todo.dart';
import 'package:ziplanner/pages/details-page.dart';

class TodosList extends StatelessWidget {
  final List<Todo> todos;

  TodosList(this.todos);

  @override
  Widget build(BuildContext context) {
    final SlidableController slidableController = SlidableController();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: todos.map<Widget>(
        (todo) {
          return TodoTile(
            title: todo.name,
            isChecked: todo.isDone,
            slidableController: slidableController,
            checkIconCallback: () {
              TodoData().updateTodo(todo);
            },
            deleteCallback: () {
              TodoData().removeTodo(todo, todos);
            },
            editCallback: () => Navigator.pushNamed(context, DetailsPage.path),
            alarmOn: todo.alarmOn,
            toggleAlarmCallback: (bool _) {
              TodoData().switchAlarm(todo);
            },
          );
        },
      ).toList(),
    );
  }
}
