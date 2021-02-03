import 'package:flutter/material.dart';

class Todo {
  String name;
  DateTime time;
  bool isDone;
  String id;

  Todo({@required this.name, this.time, this.isDone = false, this.id});

  void toggleDone() {
    isDone = !isDone;
  }
}
