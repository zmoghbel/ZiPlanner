import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ziplanner/components/empty-day-list.dart';
import 'package:ziplanner/components/filled-day-list.dart';

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
                EmptyDayList('Today'),
                EmptyDayList('Tomorrow'),
                FilledDayList('In The Future'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
