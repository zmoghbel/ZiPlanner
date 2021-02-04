import 'package:flutter/foundation.dart';
import 'package:ziplanner/models/todo.dart';
//import 'dart:collection';

final now = DateTime.now();

class TodoData extends ChangeNotifier {
  static final TodoData _todoData = TodoData._internal();

  factory TodoData() {
    return _todoData;
  }

  TodoData._internal();

  List<Todo> todayTodos = [
    // Todo(
    //   name: 'Go shopping',
    //   isDone: true,
    //   time: DateTime(now.year, now.month, now.day),
    // ),
    // Todo(
    //   name: 'Buy a house',
    //   isDone: false,
    //   time: DateTime(now.year, now.month, now.day),
    // ),
  ];

  // UnmodifiableListView<Todo> get todayTodos {
  //   notifyListeners();
  //   return UnmodifiableListView(_todayTodos);
  // }

  List<Todo> tommorrowTodos = [
    // Todo(
    //   name: 'Call Mom',
    //   time: DateTime(now.year, now.month, now.day + 1),
    // ),
  ];

  List<Todo> futureTodos = [
    // Todo(
    //   name: 'Ikea shopping',
    // ),
    // Todo(
    //   name: 'Reading a book',
    //   isDone: true,
    // ),
    // Todo(name: 'programming', isDone: false),
  ];

  // int get todayCount {
  //   return _todayTodos.length;
  // }

  void updateTodo(Todo todo) {
    todo.toggleDone();
    notifyListeners();
  }

  void addTodo(String newTodoTitle, List<Todo> todoList) {
    todoList.add(Todo(name: newTodoTitle));
    notifyListeners();
  }

  void removeTodo(Todo todo, List<Todo> todoList) {
    todoList.remove(todo);
    notifyListeners();
  }
}
