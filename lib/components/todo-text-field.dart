import 'package:flutter/material.dart';

class TodoTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ListTile(
        title: TextField(
          decoration: new InputDecoration(
            border: InputBorder.none,
            hintText: "I will",
          ),
        ),
        trailing: Icon(Icons.add),
      ),
    );
  }
}
