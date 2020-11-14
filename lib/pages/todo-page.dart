import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ziplanner/components/todo-text-field.dart';
import 'package:ziplanner/components/todo-tile.dart';
import 'package:ziplanner/components/top-bar.dart';
import 'package:ziplanner/pages/todo-add-page.dart';

class ToDoPage extends StatefulWidget {
  //const ToDoPage({Key key,}) : super(key: key);

  @override
  _ToDoPageState createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  @override
  Widget build(BuildContext context) {
    return TopBar(
      text: 'ToDo',
      uniqueHeroTag: 'todo',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 8,
            child: Container(
              padding: EdgeInsets.all(10),
              child: ListView(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Text(
                        'Today',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.blue[900],
                        ),
                      ),
                      new Spacer(),
                      RawMaterialButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              Platform.isIOS
                                  ? CupertinoPageRoute(
                                      builder: (context) => ToDoAdd(),
                                    )
                                  : MaterialPageRoute(
                                      builder: (context) => ToDoAdd(),
                                    ));
                        },
                        fillColor: Colors.white,
                        child: Icon(
                          Icons.add,
                          size: 20.0,
                          color: Colors.orange,
                        ),
                        padding: EdgeInsets.all(5.0),
                        shape: CircleBorder(),
                      ),
                    ],
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
      ),
    );
  }
}
