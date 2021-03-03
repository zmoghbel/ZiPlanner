import 'package:flutter/material.dart';

import '../styles.dart';
import '../zip-icons.dart';
import 'package:intl/intl.dart';

class TodoLabels extends StatelessWidget {
  final DateTime todoTime;
  const TodoLabels({this.todoTime});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        todoTime != null ? TimeCard(date: todoTime) : SizedBox(),
        Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: Icon(
            ZipIcons.attachment,
            size: 12,
            color: Color(0xFF6E8CA0),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: Icon(
            ZipIcons.edit,
            size: 12,
            color: Color(0xFF6E8CA0),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: Icon(
            ZipIcons.location,
            size: 12,
            color: Color(0xFF6E8CA0),
          ),
        ),
      ],
    );
  }
}

class TimeCard extends StatelessWidget {
  const TimeCard({
    @required this.date,
  });
  final DateTime date;
  String showDate(DateTime date) {
    return new DateFormat('MMM-dd kk:mm').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
        side: BorderSide(
          color: Color(0xFF6E8CA0),
          width: 1.0,
        ),
      ),
      elevation: 0,
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Text(
          showDate(date) ?? '',
          style: kTodoTimeStyle,
        ),
      ),
    );
  }
}
