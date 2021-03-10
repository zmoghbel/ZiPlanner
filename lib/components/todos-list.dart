import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:ziplanner/components/todo-tile.dart';
import 'package:ziplanner/models/todo-data.dart';
import 'package:ziplanner/pages/details-page.dart';
import 'package:ziplanner/utils.dart';

class TodosList extends StatelessWidget {
  final DateTime date;

  TodosList(this.date);

  @override
  Widget build(BuildContext context) {
    final SlidableController slidableController = SlidableController();
    return Consumer<TodoData>(
      builder: (BuildContext context, TodoData todoData, Widget child) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: todoData.todos
              .where((todo) => this.date != null
                  ? todo.time?.day == this.date.day
                  : todo.time == null ||
                      todo.time
                          .isAfter(DateTime.now().add(const Duration(days: 2))))
              .map<Widget>(
            (todo) {
              return TodoTile(
                title: todo.name,
                todoDateTime: todo.time,
                isChecked: todo.isDone,
                slidableController: slidableController,
                checkIconCallback: () {
                  todoData.onCheckTodo(todo);
                },
                deleteCallback: () {
                  todoData.removeTodo(todo);
                  Utils.showSnackBar(context, '"${todo.name}" was deleted');
                },
                editCallback: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailsPage(todo)),
                  );
                },
                alarmOn: todo.alarmOn,
                toggleAlarmCallback: (bool _) {
                  todoData.switchAlarm(todo);
                },
              );
            },
          ).toList(),
        );
      },
    );
  }
}
