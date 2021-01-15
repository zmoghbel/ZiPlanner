import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ziplanner/zip-icons.dart';

class TodoTile extends StatefulWidget {
  final String title;
  final String date;
  final String clock;
  TodoTile(this.title, {this.date, this.clock});
  @override
  _TodoTileState createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {
  bool _value = false;
  IconData checkIcon = ZipIcons.check_circle_empty;
  TextDecoration titleTextDecoration = TextDecoration.none;

  void toggleDone() {
    if (checkIcon == ZipIcons.check_circle_empty) {
      checkIcon = ZipIcons.check_circle_done;
      titleTextDecoration = TextDecoration.lineThrough;
    } else {
      checkIcon = ZipIcons.check_circle_empty;
      titleTextDecoration = TextDecoration.none;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      minLeadingWidth: 5,
      leading: GestureDetector(
        onTap: () {
          setState(() {
            toggleDone();
          });
        },
        child: Icon(
          checkIcon,
          size: 20,
        ),
      ),
      title: Text(
        widget.title,
        style: TextStyle(
          decoration: titleTextDecoration,
          fontSize: 20,
          color: Color(0XFF334856),
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: widget.clock != null ? Text(widget.clock) : Text(''),
      trailing: widget.clock != null
          ? Switch(
              activeThumbImage: AssetImage(
                'assets/alarm.png',
              ),
              activeColor: Colors.orange,
              value: _value,
              onChanged: (newValue) => setState(() => _value = newValue),
            )
          : null,
    );
  }
}
