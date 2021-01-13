//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ziplanner/pages/todo-add-page.dart';

import '../styles.dart';
import '../zip-icons.dart';

class TodoTextField extends StatefulWidget {
  @override
  _TodoTextFieldState createState() => _TodoTextFieldState();
}

class _TodoTextFieldState extends State<TodoTextField> {
  final Color inactiveColor = Color(0xFFCCCCCC);

  final Color activeColor = Color(0xFFD97D54);

  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius: new BorderRadius.circular(27),
        boxShadow: [
          BoxShadow(
              color: Color(0xFFCCCCCC),
              blurRadius: 3.0,
              spreadRadius: 0.2,
              offset: Offset.fromDirection(90, 5))
        ],
      ),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          fillColor: Color(0xFFFFFFFF),
          filled: true,
          hintText: 'I will...',
          hintStyle: kTodoTextFieldHintStyle,
          suffixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            child: IconButton(
              padding: EdgeInsets.all(0),
              icon: Icon(
                ZipIcons.add_circle,
                color: inactiveColor,
                size: 49,
              ),
              onPressed: () {
                Navigator.pushNamed(context, ToDoAdd.path);
              },
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(27),
            ),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
