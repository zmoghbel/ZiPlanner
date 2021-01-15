import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ziplanner/components/todo-text-field.dart';
import 'package:ziplanner/components/todo-tile.dart';
import 'package:ziplanner/pages/todo-add-page.dart';
import 'package:ziplanner/styles.dart';

import '../zip-icons.dart';

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
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FilledTodoList('Today'),
                EmptyTodoList('Tomorrow'),
                EmptyTodoList('In The Future'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class EmptyTodoList extends StatefulWidget {
  EmptyTodoList(this.title);
  final String title;
  @override
  _EmptyTodoListState createState() => _EmptyTodoListState();
}

class _EmptyTodoListState extends State<EmptyTodoList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(widget.title, style: kDayTitleStyle),
        SizedBox(height: 15),
        TodoTextField(),
      ]),
    );
  }
}

class FilledTodoList extends StatefulWidget {
  FilledTodoList(this.title);
  final String title;
  @override
  _FilledTodoListState createState() => _FilledTodoListState();
}

class _FilledTodoListState extends State<FilledTodoList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: EdgeInsets.only(right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.title, style: kDayTitleStyle),
              IconButton(
                padding: EdgeInsets.all(0),
                icon: Icon(
                  ZipIcons.add,
                  color: activeColor,
                  size: 50,
                ),
                onPressed: () => Navigator.pushNamed(context, ToDoAdd.path),
              )
            ],
          ),
        ),
        SizedBox(height: 15),
        TodoTile('Go to gym'),
      ]),
    );
  }
}

//Using topBar when having CuppertinoApp instead od MaterialApp:
/*return TopBar(
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
    );*/

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
