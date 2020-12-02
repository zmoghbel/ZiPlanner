import 'package:flutter/material.dart';
import 'package:ziplanner/components/top-bar.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TopBar(
      title: 'Setting',
      uniqueHeroTag: 'setting',
      child: Container(
        child: Text(
          'Index 2: Setting',
        ),
      ),
    );
  }
}
