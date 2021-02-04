import 'package:flutter/material.dart';
import 'package:ziplanner/components/todos-list.dart';
import 'package:ziplanner/models/todo.dart';
import 'package:ziplanner/pages/details-page.dart';
import 'package:ziplanner/zip-icons.dart';

import '../styles.dart';

class FilledDayList extends StatelessWidget {
  FilledDayList(this.title, this.todos);
  final String title;
  final List<Todo> todos;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0, left: 20, right: 20, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: kTitleStyle),
              IconButton(
                padding: EdgeInsets.all(0),
                icon: Icon(
                  ZipIcons.add,
                  color: activeColor,
                  size: 50,
                ),
                onPressed: () => Navigator.pushNamed(context, DetailsPage.path),
              )
            ],
          ),
          SizedBox(height: 15),
          TodosList(todos),
        ],
      ),
    );
  }
}
