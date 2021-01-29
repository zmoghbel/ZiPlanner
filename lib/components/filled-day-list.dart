import 'package:flutter/material.dart';
import 'package:ziplanner/components/todos-list.dart';
import 'package:ziplanner/pages/details-page.dart';
import 'package:ziplanner/zip-icons.dart';

import '../styles.dart';

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
              Text(widget.title, style: kTitleStyle),
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
        ),
        SizedBox(height: 15),
        TodosList(),
      ]),
    );
  }
}
