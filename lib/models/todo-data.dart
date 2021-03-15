import 'package:flutter/foundation.dart';
import 'package:ziplanner/models/todo.dart';
//import 'dart:collection';

final now = DateTime.now();

class TodoData extends ChangeNotifier {
  static final TodoData _todoData = TodoData._internal();

  factory TodoData() {
    return _todoData;
  }
//Making TodoData singleton:
  TodoData._internal();

  List<Todo> todos = [
    Todo(
      name: 'Go shopping',
      isDone: true,
      time: DateTime(now.year, now.month, now.day),
    ),
    Todo(
      name: 'Buy a house',
      isDone: false,
      time: DateTime(now.year, now.month, now.day),
    ),
    Todo(
      name: 'Visit the dentist',
      isDone: false,
      time: DateTime(now.year, now.month, now.day),
      alarmOn: true,
    ),
    Todo(
      name: 'Return the sweater to the store',
      isDone: false,
      //time: DateTime(now.year, now.month, now.day),
      alarmOn: true,
    ),
    Todo(
      name: 'Call Mom',
      time: DateTime(now.year, now.month, now.day + 1),
    ),
    Todo(
      name: 'Cal Dad',
      isDone: false,
      time: DateTime(now.year, now.month, now.day + 5),
      alarmOn: false,
    ),
    Todo(
      name: 'Ikea shopping',
    ),
    Todo(
      name: 'Reading a book',
      isDone: true,
    ),
    Todo(name: 'programming', isDone: false),
  ];

  // UnmodifiableListView<Todo> get todayTodos {
  //   notifyListeners();
  //   return UnmodifiableListView(_todayTodos);
  // }

  void onCheckTodo(Todo todo) {
    todo.toggleDone();
    notifyListeners();
  }

  void addTodo(String newTodoTitle, DateTime time) {
    todos.insert(0, Todo(name: newTodoTitle, time: time));
    notifyListeners();
  }

  void removeTodo(Todo todo) {
    todos.remove(todo);
    notifyListeners();
  }

  void updateTodo(Todo todo, String newName, DateTime todoDate) {
    todo.name = newName;
    todo.time = todoDate;
    print(
        '${todo.name} in ${todo.time} is done ${todo.isDone} has ${todo.alarmOn} alarm and has this id: ${todo.id}');
    notifyListeners();
  }

  void switchAlarm(Todo todo) {
    todo.toggleAlarm();
    notifyListeners();
  }
}
