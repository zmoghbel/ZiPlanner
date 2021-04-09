import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:ziplanner/models/todo.dart';

class DatabaseHelper {
  static const _databaseName = 'TodoData.db';
  static const _databaseVersion = 1;

  DatabaseHelper() {
    _initDatabase();
  }

  //Singleton class
  DatabaseHelper._();
  static final DatabaseHelper instance = DatabaseHelper._();

  Database _database;
  Future<Database> get database async {
    return _database ?? await _initDatabase();
  }

  _initDatabase() async {
    Directory dataDirectory = await getApplicationDocumentsDirectory();
    String dbPath = join(dataDirectory.path, _databaseName);
    return await openDatabase(
      dbPath,
      version: _databaseVersion,
      onCreate: _onCreateDB,
    );
  }

  _onCreateDB(Database db, int version) async {
    //create tables with named columns as bellow:
    await db.execute('''
    CREATE TABLE ${Todo.todoTabel}(
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
      Todo.todoTabel,
      todo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Todo>> fetchTodos() async {
    Database db = await database;
    List<Map<String, Object>> todos = await db.query(Todo.todoTabel);
    return todos.length == 0 ? [] : todos.map((e) => Todo.fromMap(e)).toList();
  }

  Future<int> updateTodo(Todo todo) async {
    Database db = await database;
    return await db.update(Todo.todoTabel, todo.toMap(),
        where: '${Todo.colId}=?', whereArgs: [todo.id]);
  }

  Future<int> deleteTodo(int id) async {
    Database db = await database;
    return await db
        .delete(Todo.todoTabel, where: '${Todo.colId}=?', whereArgs: [id]);
  }
}
