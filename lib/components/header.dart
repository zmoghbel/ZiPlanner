import 'package:flutter/material.dart';

import '../styles.dart';

class Header extends StatelessWidget {
  final IconData icon;
  final title;

  Header(this.icon, this.title);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
          color: activeColor,
        ),
        SizedBox(width: 10),
        Text(title, style: kTitleStyle),
      ],
    );
  }
}
