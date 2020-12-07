import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ziplanner/pages/home-page.dart';
import 'package:ziplanner/pages/todo-add-page.dart';

void main() {
  runApp(
    new CupertinoApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        ToDoAdd.path: (context) => ToDoAdd(),
      },
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
    ),
  );
}
