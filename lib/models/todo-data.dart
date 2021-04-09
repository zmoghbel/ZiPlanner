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

  void onCheckTodo(Todo todo) {
    todo.toggleDone();
    updateTodo(todo);
  }

  void switchAlarm(Todo todo) {
    todo.toggleAlarm();
    updateTodo(todo);
  }

  int get todoCount {
    return todoList.length;
  }

  void updateTodo(Todo todo) async {
    todoList[todoList.indexWhere((element) => element.id == todo.id)] = todo;
    notifyListeners();
    await db.updateTodo(todo);
  }

  void deleteTodo(Todo todo) {
    todoList.remove(todo);
    notifyListeners();
    db.deleteTodo(todo.id);
  }
}
