//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:provider/provider.dart';
// import 'package:ziplanner/models/todo-data.dart';
import 'package:ziplanner/models/todo.dart';
import 'package:ziplanner/models/todo_data.dart';
import 'package:ziplanner/utils/database_helper.dart';
import 'package:ziplanner/zip-icons.dart';
import '../styles.dart';

class TodoTextField extends StatefulWidget {
  @override
  _TodoTextFieldState createState() => _TodoTextFieldState();
}

class _TodoTextFieldState extends State<TodoTextField> {
  TextEditingController _controller = TextEditingController();
  DatabaseHelper _dbHelper;

  @override
  void initState() {
    super.initState();
    setState(() {
      _dbHelper = DatabaseHelper.instance;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool hasText = _controller.text.trim().isNotEmpty;

    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: new BorderRadius.circular(27),
          boxShadow: [
            BoxShadow(
              color: Color(0xFFCCCCCC),
              blurRadius: 3.0,
              spreadRadius: 0.1,
              offset: Offset.fromDirection(90, 4),
            )
          ],
        ),
        child: TextField(
          autofocus: false,
          controller: _controller,
          textInputAction: TextInputAction.done,
          onChanged: (value) {
            setState(() {});
          },
          decoration: InputDecoration(
            fillColor: Color(0xFFFFFFFF),
            filled: true,
            hintText: 'I will...',
            hintStyle: kTodoTextFieldHintStyle,
            suffixIcon: Padding(
              padding: const EdgeInsets.all(1),
              child: IconButton(
                padding: EdgeInsets.all(0),
                icon: Icon(
                  ZipIcons.add_circle,
                  color: hasText ? activeColor : inactiveColor,
                  size: 42,
                ),
                onPressed: () async {
                  if (hasText) {
                    Todo newTodo = Todo(
                      name: _controller.text.trim(),
                      time: DateTime.now(),
                    );
                    Provider.of<TodoData>(context, listen: false)
                        .addTodo(newTodo);
                    await _dbHelper.insertTodo(newTodo);
                    print(newTodo);
                    _controller.clear();
                  }
                },
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(27),
              ),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(28)),
              borderSide: BorderSide(width: 1, color: activeColor),
            ),
          ),
        ),
      ),
    );
  }
}
