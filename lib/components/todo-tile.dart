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
      leading: Icon(
        Icons.circle,
      ),
      title: Text(
        widget.title,
        style: TextStyle(
          fontSize: 18,
          color: Colors.black,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w700,
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
