import 'package:flutter/material.dart';
import '../styles.dart';
import '../zip-icons.dart';

class ZiplannerAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double _prefferedHeight = 60.0;
  final String title;
  final String subtitle;

  ZiplannerAppBar({this.title, this.subtitle});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: _prefferedHeight,
      centerTitle: true,
      backgroundColor: Color(0XFFFFFFFF),
      leading: IconButton(
        padding: EdgeInsets.only(left: 15),
        onPressed: () {
          print('Hamburger menue was tapped');
        },
        icon: Icon(
          ZipIcons.hamburger_menu,
          color: Color(0xFF324755),
          size: 22,
        ),
      ),
      title: Column(
        children: [
          Text(
            title,
            style: kAppBarTitleStyle,
          ),
          SizedBox(height: 2),
          Text(
            subtitle,
            style: kAppBarSubtitleStyle,
          ),
        ],
      ),
      actions: [
        IconButton(
          padding: EdgeInsets.only(right: 15),
          icon: Icon(
            ZipIcons.search,
            color: Color(0xFF324755),
            size: 25,
          ),
          onPressed: () {
            print('search icon was tapped');
          },
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(_prefferedHeight);
}
