import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../zip-icons.dart';

//import 'dart:io' show Platform;

class TopBar extends StatelessWidget {
  final String title;
  final String subtitle;
  final TextStyle titleStyle;
  final TextStyle subtitleStyle;
  final String uniqueHeroTag;
  final Widget child;

  TopBar({
    this.title,
    this.subtitle,
    this.titleStyle,
    this.subtitleStyle,
    this.uniqueHeroTag,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 0),
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          // border: Border(
          //   bottom: BorderSide(width: 3, color: Theme.of(context).dividerColor),
          // ),
          backgroundColor: Color(0xFFFFFFFF),
          heroTag: uniqueHeroTag,
          transitionBetweenRoutes: false,
          leading: Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () {
                print('Hambergur menu was tapped');
              },
              child: Icon(
                ZipIcons.hamburger_menu,
                color: Color(0xFF324755),
                size: 20,
              ),
            ),
          ),
          middle: Column(
            children: [
              Text(
                title,
                style: titleStyle,
              ),
              SizedBox(height: 2),
              Text(
                subtitle,
                style: subtitleStyle,
              ),
            ],
          ),
          trailing: Padding(
            padding: const EdgeInsets.all(10),
            child: GestureDetector(
              onTap: () {
                print('Search was tapped');
              },
              child: Icon(
                ZipIcons.search,
                color: Colors.black54,
              ),

              // SvgPicture.asset(
              //   'assets/icons/search.svg',
              //   color: Color(0xFF324755),
              // ),
            ),
          ),
        ),
        child: child,
      ),
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
              
            ),
          ],
        ),
        body: SafeArea(child: child),
      );
    } else {};*/
