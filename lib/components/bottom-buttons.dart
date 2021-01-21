import 'package:flutter/material.dart';

class BottomButtons extends StatelessWidget {
  final Function cancelOnPressed;
  final Function saveOnPressed;
  BottomButtons({this.cancelOnPressed, this.saveOnPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        //borderRadius: new BorderRadius.circular(27),
        boxShadow: [
          BoxShadow(
            color: Color(0xFFCCCCCC),
            blurRadius: 10,
            spreadRadius: 5,
            offset: Offset.fromDirection(270, 7),
          ),
        ],
      ),
      child: ButtonBar(
        buttonPadding: EdgeInsets.all(0),
        alignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            onPressed: cancelOnPressed,
            child: Text(
              'Cancel',
              style: TextStyle(
                color: Color(0xFFFA5959),
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
                fontSize: 22,
              ),
            ),
          ),
          VerticalDivider(
            indent: 5,
            endIndent: 5,
            color: Colors.black,
          ),
          TextButton(
            onPressed: saveOnPressed,
            child: Text(
              'Save',
              style: TextStyle(
                color: Color(0xFF29CCB1),
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
                fontSize: 22,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
