import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ziplanner/pages/home-page.dart';
import 'package:ziplanner/pages/todo-add-page.dart';

void main() {
  runApp(new CupertinoApp(
    initialRoute: '/home',
    routes: {
      '/': (context) => Home(),
      '/home': (context) => Home(),
      '/todoAdd': (context) => ToDoAdd(),
    },
    localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
      DefaultMaterialLocalizations.delegate,
      DefaultWidgetsLocalizations.delegate,
    ],
  ));
}
