import 'package:flutter/material.dart';
import 'package:ziplanner/components/task-tile.dart';
import 'package:ziplanner/models/task-data.dart';

class TasksList extends StatelessWidget {
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
              final task = TaskData().tasks[index];
              return TaskTile(
                title: task.name,
                isChecked: task.isDone,
                checkIconCallback: () {
                  TaskData().updateTask(task);
                },
              );
            },
            itemCount: TaskData().taskCount,
            shrinkWrap: true,
          ),
        ],
      ),
    );
  }
}
