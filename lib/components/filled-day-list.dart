import 'package:flutter/material.dart';
import 'package:ziplanner/components/tasks-list.dart';
import 'package:ziplanner/pages/add-task-page.dart';

import '../styles.dart';
import '../zip-icons.dart';

class FilledDayList extends StatefulWidget {
  FilledDayList(this.title);
  final String title;
  @override
  _FilledDayListState createState() => _FilledDayListState();
}

class _FilledDayListState extends State<FilledDayList> {
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
                onPressed: () => Navigator.pushNamed(context, AddTaskPage.path),
              )
            ],
          ),
        ),
        SizedBox(height: 15),
        TasksList(),
      ]),
    );
  }
}
