import 'package:flutter/material.dart';
import 'package:ziplanner/components/todo-tile.dart';
import 'package:ziplanner/models/todo-data.dart';

class TodosList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, index) {
              final task = TodoData().tasks[index];
              return TodoTile(
                title: task.name,
                isChecked: task.isDone,
                checkIconCallback: () {
                  TodoData().updateTodo(task);
                },
              );
            },
            itemCount: TodoData().todoCount,
            shrinkWrap: true,
          ),
        ],
      ),
    );
  }
}
