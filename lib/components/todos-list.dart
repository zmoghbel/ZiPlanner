import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:ziplanner/components/todo-tile.dart';
import 'package:ziplanner/components/zip-snack-bar.dart';
import 'package:ziplanner/models/todo.dart';
import 'package:ziplanner/models/todo-data.dart';
import 'package:ziplanner/pages/details-page.dart';
import 'package:ziplanner/utils/database_helper.dart';

class TodosList extends StatefulWidget {
  final DateTime date;

  TodosList(this.date);

  @override
  _TodosListState createState() => _TodosListState();
}

class _TodosListState extends State<TodosList> {
  DatabaseHelper _dbHelper;
  List<Todo> todoData = [];
  @override
  void initState() {
    super.initState();
    setState(() {
      _dbHelper = DatabaseHelper.instance;
    });
    refreshTodoList();
  }

  refreshTodoList() async {
    List<Todo> todoList = await _dbHelper.fetchTodos();
    setState(() {
      todoData = todoList;
      print(todoData);
    });
  }

  @override
  Widget build(BuildContext context) {
    final SlidableController slidableController = SlidableController();
    return Consumer<TodoData>(
      builder: (BuildContext context, TodoData todoData, Widget child) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: todoData.todoList
              .where((todo) => this.widget.date != null
                  ? todo.time?.day == this.widget.date.day
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
                  todoData.deleteTodo(todo);
                  ZipSnackBar.showSnackBar(
                      context, '"${todo.name}" was deleted');
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
