import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ziplanner/zip-icons.dart';

class TodoTile extends StatelessWidget {
  final String title;
  final bool isChecked;
  final Function checkIconCallback;

  TodoTile({this.title, this.isChecked = false, this.checkIconCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      minLeadingWidth: 5,
      leading: GestureDetector(
        child: Icon(
          isChecked ? ZipIcons.check_circle_done : ZipIcons.check_circle_empty,
          size: 17,
        ),
        onTap: checkIconCallback,
      ),
      title: Text(
        title,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : TextDecoration.none,
          fontSize: 20,
          color: Color(0XFF334856),
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
