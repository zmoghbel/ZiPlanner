import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ziplanner/components/bottom-buttons.dart';
import 'package:ziplanner/components/ziplanner-appbar.dart';

import '../styles.dart';

class AddTaskPage extends StatefulWidget {
  static const String path = '/addTask';
  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final myController = TextEditingController();
  bool isSwitched = false;

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ZiplannerAppBar(
        title: 'ToDo',
        subtitle: 'Details',
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
              flex: 9,
              child: Container(
                color: backgroundColor,
                child: Text('Details'),
              )),
          Expanded(
            flex: 1,
            child: SafeArea(
              child: BottomButtons(
                cancelOnPressed: () {
                  print('cancel was tapped');
                },
                saveOnPressed: () {
                  print('save was tapped');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/*TopBar(
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
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                            borderSide:
                                BorderSide(color: Colors.grey, width: 32.0),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1.0),
                              borderRadius: BorderRadius.circular(5.0))),
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
                          child: Text('save',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
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
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ]),
            )),
      ),
    ); */
