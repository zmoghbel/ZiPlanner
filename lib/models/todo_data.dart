import 'package:flutter/cupertino.dart';
import 'package:ziplanner/models/todo.dart';
import 'package:ziplanner/utils/database_helper.dart';

class TodoData extends ChangeNotifier {
  static DatabaseHelper db = new DatabaseHelper();

  TodoData() {
    getTodos();
  }

  List<Todo> todoList = [];
  void getTodos() async {
    todoList = await db.fetchTodos();
    notifyListeners();
  }

  void addTodo(Todo todo) async {
    todoList.add(todo);
    notifyListeners();
    await db.insertTodo(todo);
  }

  int get todoCount {
    return todoList.length;
  }
}
