import 'package:flutter/material.dart';
import 'package:ziplanner/styles.dart';

class Utils {
  static void showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text),
      backgroundColor: activeColor,
    ));
  }
}
