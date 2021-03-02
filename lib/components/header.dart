import 'package:flutter/material.dart';

import '../styles.dart';

class Header extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget trailing;

  Header(this.icon, this.title, {this.trailing});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      minLeadingWidth: 7,
      minVerticalPadding: 10,
      leading: Icon(
        icon,
        size: 20,
        color: activeColor,
      ),
      title: Text(
        title,
        style: kTitleStyle,
        textAlign: TextAlign.start,
      ),
      trailing: trailing,
    );
  }
}
