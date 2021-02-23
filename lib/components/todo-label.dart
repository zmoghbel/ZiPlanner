import 'package:flutter/material.dart';

import '../zip-icons.dart';

class TodoLabels extends StatelessWidget {
  const TodoLabels({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Card(
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
                'Today 12:30 pm',
                style: TextStyle(color: Color(0xFF6E8CA0)),
              ),
            )),
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
