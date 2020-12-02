//import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ziplanner/components/todo-text-field.dart';
//import 'package:ziplanner/components/todo-tile.dart';
import 'package:ziplanner/components/top-bar.dart';
//import 'package:ziplanner/pages/todo-add-page.dart';
import 'package:ziplanner/styles.dart';

class ToDoPage extends StatefulWidget {
  //const ToDoPage({Key key,}) : super(key: key);

  @override
  _ToDoPageState createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  @override
  Widget build(BuildContext context) {
    return TopBar(
      title: 'ToDo',
      titleStyle: kappBarTitleStyle,
      subtitle: 'Task & Events',
      subtitleStyle: kappBarSubtitleStyle,
      uniqueHeroTag: 'todo',
      child: Scaffold(
        backgroundColor: Color(0xFFF5F5F5),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 8,
              child: Container(
                padding: EdgeInsets.all(25),
                child: ListView(
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 10),
                      child: Text(
                        'Today',
                        style: kdayTitleStyle,
                      ),
                    ),
                    TodoTextField(),
                    SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 10),
                      child: Text(
                        'Tomorrow',
                        style: kdayTitleStyle,
                      ),
                    ),
                    TodoTextField(),
                    SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 10),
                      child: Text(
                        'In The Future',
                        style: kdayTitleStyle,
                      ),
                    ),
                    TodoTextField(),
                    SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// TodoTile('Visit my friend', 'today', clock: '09:30'),
// TodoTile('Buy a new jacket', 'Tomorrow'),
/* Row(
                      children: [
                        Text(
                          'Today',
                          style: dayTitleStyle,
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
                    ),*/
