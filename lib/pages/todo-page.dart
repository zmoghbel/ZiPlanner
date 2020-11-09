import 'package:flutter/material.dart';

class ToDoPage extends StatelessWidget {
  const ToDoPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(children: [
        FlatButton.icon(
          onPressed: () {
            Navigator.pushNamed(context, '/todoAdd');
          },
          icon: Icon(Icons.add),
          label: Text('ToDo ADD'),
        ),
      ]),
    ));
  }
}
