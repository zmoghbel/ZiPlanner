import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({
    Key key,
    @required this.optionStyle,
  }) : super(key: key);

  final TextStyle optionStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Index 2: Setting',
      style: optionStyle,
    );
  }
}
