//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ziplanner/models/todo-data.dart';
import 'package:ziplanner/models/todo.dart';
import 'package:ziplanner/zip-icons.dart';

import '../styles.dart';

class TodoTextField extends StatefulWidget {
  final List<Todo> todos;
  TodoTextField({this.todos});

  @override
  _TodoTextFieldState createState() => _TodoTextFieldState();
}

class _TodoTextFieldState extends State<TodoTextField> {
  bool hasText = false;

  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
          onChanged: (value) {
            setState(() {
              hasText = value.isEmpty ? false : true;
            });
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
                onPressed: (_controller.text.isEmpty)
                    ? null
                    : () {
                        TodoData().addTodo(_controller.text, widget.todos);
                        //_controller.clear();
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
