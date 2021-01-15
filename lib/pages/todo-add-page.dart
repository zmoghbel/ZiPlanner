import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ziplanner/components/top-bar.dart';
import 'package:ziplanner/styles.dart';

class ToDoAdd extends StatefulWidget {
  static const String path = '/todo';
  @override
  _ToDoAddState createState() => _ToDoAddState();
}

class _ToDoAddState extends State<ToDoAdd> {
  final myController = TextEditingController();
  bool isSwitched = false;

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TopBar(
      title: 'ToDo',
      titleStyle: kAppBarTitleStyle,
      subtitle: 'Details',
      subtitleStyle: kAppBarSubtitleStyle,
      uniqueHeroTag: 'todoAdd',
      child: Scaffold(
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              padding: EdgeInsets.all(20.0),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  'Title',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5.0),
                TextFormField(
                  controller: myController,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                      hintText: 'Task / Event Title',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 32.0),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 1.0), borderRadius: BorderRadius.circular(5.0))),
                  onChanged: (value) {},
                ),
                SizedBox(height: 10.0),
                Container(
                  height: 300,
                  child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.dateAndTime,
                      onDateTimeChanged: (datetime) {
                        print(datetime.toString());
                      }),
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      child: Text('save', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                      onPressed: () {
                        return showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Text(myController.text),
                            );
                          },
                        );
                      },
                    ),
                    ElevatedButton(
                      //color: Colors.green,
                      child: Text(
                        'cancel',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ]),
            )),
      ),
    );
  }
}
