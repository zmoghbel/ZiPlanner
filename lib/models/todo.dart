import 'package:flutter/material.dart';

class Todo {
  String name;
  DateTime time;
  bool isDone;
  String id;
  bool alarmOn;

  Todo({
    @required this.name,
    this.time,
    this.isDone = false,
    this.id,
    this.alarmOn,
  });

  void toggleDone() {
    isDone = !isDone;
  }

  void toggleAlarm() {
    alarmOn = !alarmOn;
  }
}
