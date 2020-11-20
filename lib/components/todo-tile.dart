import 'package:flutter/material.dart';

class TodoTile extends StatefulWidget {
  final String title;
  final String date;
  final String clock;
  TodoTile(this.title, this.date, {this.clock});
  @override
  _TodoTileState createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.check_box_outline_blank_rounded),
      title: Text(
        widget.title,
        style: TextStyle(fontSize: 25),
      ),
      subtitle: widget.clock != null ? Text(widget.clock) : Text(''),
      trailing: widget.clock != null
          ? Switch(
              activeThumbImage: AssetImage(
                'lib/assets/alarm.png',
              ),
              activeColor: Colors.orange,
              value: _value,
              onChanged: (newValue) => setState(() => _value = newValue),
            )
          : null,
    );
  }
}
