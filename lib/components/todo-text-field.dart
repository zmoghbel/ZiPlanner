import 'package:flutter/material.dart';

import '../styles.dart';

class TodoTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      //shadowColor: Color(0xFF00000029),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: ListTile(
        title: TextField(
          decoration: new InputDecoration(
            fillColor: Color(0xFFFFFFFF),
            border: InputBorder.none,
            hintText: "I will ...",
            hintStyle: kTodoTextFieldHintStyle,
          ),
        ),
        trailing: Icon(
          Icons.add_circle,
          color: Color(0xFFCCCCCC),
          size: 40,
        ),
      ),
    );
  }
}
