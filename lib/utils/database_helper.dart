import 'dart:async';
import 'dart:io';

//import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:ziplanner/models/todo.dart';

class DatabaseHelper {
  static const _databaseName = 'TodoData.db';
  static const _databaseVersion = 1;

  DatabaseHelper._();
  static final DatabaseHelper instance = DatabaseHelper._();

  Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory dataDirectory = await getApplicationDocumentsDirectory();
    String dbPath = join(dataDirectory.path, _databaseName);
    return await openDatabase(dbPath,
        version: _databaseVersion, onCreate: _onCreateDB);
  }

  _onCreateDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE ${Todo.tblTodo}(
      ${Todo.colId} INTEGER PRIMARY KEY AUTOINCREMENT,
      ${Todo.colName} TEXT NOT NULL,
      ${Todo.colTodoDateTime} TEXT,
      ${Todo.colIsDone} BOOLEAN,
      ${Todo.colAlarmOn} BOOLEAN
    )
    ''');
  }

  Future<int> insertTodo(Todo todo) async {
    Database db = await database;
    return await db.insert(
      Todo.tblTodo,
      todo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Todo>> fetchTodos() async {
    Database db = await database;
    List<Map> todos = await db.query(Todo.tblTodo);
    return todos.length == 0 ? [] : todos.map((e) => Todo.fromMap(e)).toList();
  }
}
