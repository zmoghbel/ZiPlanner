import 'package:flutter/material.dart';

class Todo {
  String name;
  DateTime createdTime;
  bool isDone;
  String id;

  Todo({@required this.name, this.createdTime, this.isDone = false, this.id});

  void toggleDone() {
    isDone = !isDone;
  }
}
