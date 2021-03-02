import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ziplanner/components/todo-tile.dart';
import 'package:ziplanner/models/todo-data.dart';
import 'package:ziplanner/models/todo.dart';
import 'package:ziplanner/pages/details-page.dart';
import 'package:ziplanner/utils.dart';

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
              TodoData().onCheckTodo(todo);
            },
            deleteCallback: () {
              TodoData().removeTodo(todo, todos);
              Utils.showSnackBar(context, '"${todo.name}" was deleted');
            },
            editCallback: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailsPage(todo: todo, todoList: todos)),
              );
            },
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
