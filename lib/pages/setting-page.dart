import 'package:flutter/material.dart';
import 'package:ziplanner/components/top-bar.dart';
import 'package:ziplanner/styles.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TopBar(
      title: 'Setting',
      titleStyle: kappBarTitleStyle,
      subtitle: '',
      subtitleStyle: kappBarSubtitleStyle,
      uniqueHeroTag: 'setting',
      child: Container(
        child: Text(
          'Index 2: Setting',
        ),
      ),
    );
  }
}
