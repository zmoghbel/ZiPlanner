import 'package:flutter/material.dart';

class ToDoPage extends StatelessWidget {
  const ToDoPage({
    Key key,
    @required this.optionStyle,
  }) : super(key: key);

  final TextStyle optionStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Index 0: ToDo list',
      style: optionStyle,
    );
  }
}
