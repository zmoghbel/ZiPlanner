import 'package:flutter/material.dart';
import 'package:ziplanner/components/todo-tile.dart';
import 'package:ziplanner/models/todo-data.dart';
import 'package:ziplanner/models/todo.dart';

class TodosList extends StatelessWidget {
  final List<Todo> todos;
  TodosList(this.todos);

  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisSize: MainAxisSize.min,
      children: todos.map<Widget>(
        (todo) {
          return TodoTile(
            title: todo.name,
            isChecked: todo.isDone,
            checkIconCallback: () {
              TodoData().updateTodo(todo);
            },
          );
        },
      ).toList(),

      // [
      //   ListView.builder(
      //     physics: NeverScrollableScrollPhysics(),
      //     itemBuilder: (BuildContext context, index) {
      //       final task = todos[index];
      //       return
      //     },
      //     itemCount: todos.length,
      //     shrinkWrap: true,
      //   ),
      // ],
    );
  }
}
