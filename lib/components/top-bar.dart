import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
//import 'dart:io' show Platform;

import '../ico_planner_icons.dart';

class TopBar extends StatelessWidget {
  final String text;
  final TextStyle style;
  final String uniqueHeroTag;
  final Widget child;

  TopBar({
    this.text,
    this.style,
    this.uniqueHeroTag,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        // border: Border(
        //   bottom: BorderSide(width: 3, color: Theme.of(context).dividerColor),
        // ),
        backgroundColor: Colors.white,
        heroTag: uniqueHeroTag,
        transitionBetweenRoutes: false,
        leading: Icon(
          Icons.subject,
          color: Color(0xFF324755),
        ),
        middle: Text(
          text,
          style: style,
        ),
        trailing: Icon(
          Icons.search,
          color: Color(0xFF324755),
        ),
      ),
      child: child,
    );
  }
}

/*if (Platform.isAndroid) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: Icon(
            Icons.subject,
            color: Colors.black,
          ),
          title: Container(
            margin: EdgeInsets.fromLTRB(5, 20, 5, 10),
            child: Text(
              text,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 20,
              ),
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(
                Icons.search,
                color: Colors.black54,
              ),
            ),
          ],
        ),
        body: SafeArea(child: child),
      );
    } else {};*/
