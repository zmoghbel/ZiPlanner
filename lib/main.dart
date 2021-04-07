import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:ziplanner/models/todo_data.dart';
import 'package:ziplanner/pages/details-page.dart';
import 'package:ziplanner/pages/home-page.dart';

void main() {
  runApp(
    /// Providers are above MyApp in our case [ZiplannerApp] instead of inside it, so that
    /// tests can use [ZiplannerApp] while mocking the providers
    ChangeNotifierProvider<TodoData>(
      create: (_) => TodoData(),
      child: ZiplannerApp(),
    ),
  );
}

class ZiplannerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.white,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarColor: Color(0XFFD97D54),
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        DetailsPage.path: (context) => DetailsPage(),
      },
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
    );
  }
}
