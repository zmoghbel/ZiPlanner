import 'package:flutter/foundation.dart';
import 'package:ziplanner/models/todo.dart';
//import 'dart:collection';

final now = DateTime.now();

class TodoData extends ChangeNotifier {
  List<Todo> todayTodos = [
    Todo(
      name: 'Buy milk',
      time: DateTime(now.year, now.month, now.day),
    ),
    Todo(
      name: 'Go shopping',
      isDone: true,
      time: DateTime(now.year, now.month, now.day),
    ),
  ];

  // UnmodifiableListView<Todo> get todayTodos {
  //   return UnmodifiableListView(_todayTodos);
  // }

  List<Todo> tommorrowTodos = [
    Todo(
      name: 'Call Mom',
      time: DateTime(now.year, now.month, now.day + 1),
    ),
    Todo(
      name: 'Go shopping',
      isDone: true,
      time: DateTime(now.year, now.month, now.day + 1),
    ),
  ];

  List<Todo> futureTodos = [
    Todo(
      name: 'Ikea shopping',
    ),
    Todo(
      name: 'Reading a book',
      isDone: true,
    ),
    Todo(name: 'programming', isDone: false),
  ];

  // int get todayCount {
  //   return _todayTodos.length;
  // }

  void updateTodo(Todo todo) {
    todo.toggleDone();
    notifyListeners();
  }

  void addTodo(String newTodoTitle, List<Todo> todoList) {
    todayTodos.add(Todo(name: newTodoTitle));
    notifyListeners();
  }

  void removeTodo(Todo todo, List<Todo> todoList) {
    todoList.remove(todo);
    notifyListeners();
  }
}
