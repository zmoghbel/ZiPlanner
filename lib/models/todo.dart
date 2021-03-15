import 'package:flutter/material.dart';

class Todo {
  static const tblTodo = 'todos';
  static const colId = 'Id';
  static const colName = 'Name';
  static const colTodoDateTime = 'TodoDateTime';
  static const colIsDone = 'IsDone';
  static const colAlarmOn = 'AlarmOn';

  int id;
  String name;
  DateTime time;
  bool isDone = false;
  bool alarmOn = false;

  Todo({
    this.id,
    @required this.name,
    this.time,
    this.isDone,
    this.alarmOn,
  });

  Todo.fromMap(Map<String, dynamic> map) {
    id = map[colId];
    name = map[colName];
    time = map[colTodoDateTime];
    isDone = map[colIsDone];
    alarmOn = map[colAlarmOn];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      colName: name,
      colTodoDateTime: time,
      colIsDone: isDone,
      colAlarmOn: alarmOn
    };
    if (id != null) map[colId] = id;
    return map;
  }

  void toggleDone() {
    isDone = !isDone;
  }

  void toggleAlarm() {
    alarmOn = !alarmOn;
  }
}
