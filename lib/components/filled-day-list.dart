import 'package:flutter/material.dart';
import 'package:ziplanner/components/todo-text-field.dart';
import 'package:ziplanner/components/todos-list.dart';
import 'package:ziplanner/models/todo.dart';
import 'package:ziplanner/zip-icons.dart';

import '../styles.dart';

class FilledDayList extends StatefulWidget {
  final String dayTitle;
  final List<Todo> todos;

  FilledDayList(this.dayTitle, this.todos);

  @override
  _FilledDayListState createState() => _FilledDayListState();
}

class _FilledDayListState extends State<FilledDayList> {
  bool showTextField = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 50.0, left: 20, right: 20, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.dayTitle, style: kTitleStyle),
              showTextField
                  ? SizedBox()
                  : IconButton(
                      padding: EdgeInsets.all(0),
                      icon: Icon(
                        ZipIcons.add,
                        color: activeColor,
                        size: 50,
                      ),
                      onPressed: () {
                        setState(() {
                          showTextField = true;
                        });
                      },
                    )
            ],
          ),
          SizedBox(height: 15),
          showTextField
              ? TodoTextField(
                  todos: widget.todos,
                  addCallback: () {
                    setState(() {
                      showTextField = false;
                    });
                  },
                )
              : SizedBox(height: 0),
          TodosList(widget.todos),
        ],
      ),
    );
  }
}
