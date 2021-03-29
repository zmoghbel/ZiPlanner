import 'package:flutter/material.dart';

class Todo {
  static const todoTabel = 'todos';
  static const colId = 'id';
  static const colName = 'name';
  static const colTodoDateTime = 'todo_date_time';
  static const colIsDone = 'is_done';
  static const colAlarmOn = 'alarm_on';

  int id;
  String name;
  DateTime time;
  bool isDone = false;
  bool alarmOn = false;

  Todo(
      {this.id,
      @required this.name,
      this.time,
      this.isDone = false,
      this.alarmOn = false});

  //Named Constructor
  Todo.fromMap(Map<String, dynamic> map) {
    id = map[colId];
    name = map[colName];
    time = DateTime.tryParse(map[colTodoDateTime]);
    isDone = (map[colIsDone] == 1) ? true : false;
    alarmOn = (map[colAlarmOn] == 1) ? true : false;
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      colName: name,
      colTodoDateTime: time.toString(),
      colIsDone: isDone ? 1 : 0,
      colAlarmOn: alarmOn ? 1 : 0,
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

  // Implement toString to make it easier to see information about
  // each Todo when using the print statement.
  @override
  String toString() {
    return 'Todo{id: $id, name: $name, time: $time, isDone: $isDone, alarmOn: $alarmOn}';
  }
}
