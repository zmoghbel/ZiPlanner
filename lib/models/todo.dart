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

  Todo(
      {this.id,
      @required this.name,
      this.time,
      this.isDone = false,
      this.alarmOn = false});

  Todo.fromMap(Map<String, dynamic> map) {
    id = map[colId];
    name = map[colName];
    time = DateTime.tryParse(map[colTodoDateTime]);
    isDone = map[colIsDone];
    alarmOn = map[colAlarmOn];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      colName: name,
      colTodoDateTime: time.toString(),
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

  // Implement toString to make it easier to see information about
  // each Todo when using the print statement.
  @override
  String toString() {
    return 'Todo{id: $id, name: $name, time: $time, isDone: $isDone, alarmOn: $alarmOn}';
  }
}
