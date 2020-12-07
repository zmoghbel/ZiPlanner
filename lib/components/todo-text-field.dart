//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:ziplanner/pages/todo-add-page.dart';
//import 'package:ziplanner/zip-icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ziplanner/pages/todo-add-page.dart';

import '../styles.dart';

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
    return Card(
      elevation: 5,
      //shadowColor: Color(0xFF00000029),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: ListTile(
        title: TextField(
          controller: _controller,
          decoration: new InputDecoration(
            fillColor: Color(0xFFFFFFFF),
            border: InputBorder.none,
            hintText: "I will ...",
            hintStyle: kTodoTextFieldHintStyle,
          ),
        ),
        trailing: Builder(
          builder: (context) => IconButton(
            icon: SvgPicture.asset(
              "assets/icons/add-detail.svg",
              color: inactiveColor,
            ),
            onPressed: () {
              Navigator.pushNamed(context, ToDoAdd.path);
            },
          ),
        ),
      ),
    );
  }
}

/* GestureDetector(
          onDoubleTap: () {
            print('onDoubleTap was tapped');
          },
          onTap: () {
            print('onTap was tapped');
            Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => ToDoAdd(),
                ));
          },
          child: // Icon(
          //   ZipIcons.add_circle,
          //   color: inactiveColor,
          //   size: 40,
          // ),*/
