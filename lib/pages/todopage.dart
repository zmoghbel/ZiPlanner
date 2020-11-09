import 'package:flutter/material.dart';
import 'package:ziplanner/components/todo-text-field.dart';
import 'package:ziplanner/components/todo-tile.dart';

class ToDoPage extends StatefulWidget {
  //const ToDoPage({Key key,}) : super(key: key);

  @override
  _ToDoPageState createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 8,
          child: Container(
            padding: EdgeInsets.all(10),
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Today',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.blue[900],
                  ),
                ),
                TodoTile('go to the gym', 'today', clock: '09:30'),
                TodoTile('Buy a new jacket', 'Tomorrow'),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: TodoTextField(),
        ),
      ],
    );
  }
}
