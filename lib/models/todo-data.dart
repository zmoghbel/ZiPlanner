import 'package:flutter/foundation.dart';
import 'package:ziplanner/models/todo.dart';
import 'dart:collection';

class TodoData extends ChangeNotifier {
  List<Todo> _todos = [
    Todo(name: 'Buy milk'),
    Todo(name: 'Go shopping', isDone: true),
    Todo(name: 'programming', isDone: true),
  ];

  UnmodifiableListView<Todo> get tasks {
    return UnmodifiableListView(_todos);
  }

  int get todoCount {
    return _todos.length;
  }

  void addNewTodo(newTodoTitle) {
    _todos.add(Todo(name: newTodoTitle));
    notifyListeners();
  }

  void updateTodo(Todo todo) {
    todo.toggleDone();
    notifyListeners();
  }

  void removeTask(Todo todo) {
    _todos.remove(todo);
    notifyListeners();
  }
}
