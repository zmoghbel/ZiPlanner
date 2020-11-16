import 'package:flutter/material.dart';
import 'package:ziplanner/pages/home-page.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      '/': (context) => Home(),
      '/home': (context) => Home(),
    },
  ));
}
