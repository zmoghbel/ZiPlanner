import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:provider/provider.dart';
import 'package:ziplanner/components/bottom-buttons.dart';
import 'package:ziplanner/components/header.dart';
import 'package:ziplanner/components/tags.dart';
import 'package:ziplanner/components/zip-snack-bar.dart';
import 'package:ziplanner/components/ziplanner-appbar.dart';
import 'package:ziplanner/models/todo-data.dart';
import 'package:ziplanner/models/todo.dart';
import 'package:ziplanner/zip-icons.dart';

import '../styles.dart';

class DetailsPage extends StatefulWidget {
  static const String path = '/details';
  final Todo todo;

  DetailsPage([this.todo]);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  //final myController = TextEditingController();
  final _fromKey = GlobalKey<FormState>();
  bool isSwitched = false;
  bool _repeat = false;
  bool _alert = false;

  @override
  void dispose() {
    //myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DateTime selectedTime = widget.todo.time;

    String todoTitle = widget.todo.name;
    return Scaffold(
      appBar: ZiplannerAppBar(
        title: 'ToDo',
        subtitle: 'Details',
      ),
      body: Form(
        key: _fromKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 9,
              child: Container(
                color: backgroundColor,
                child: ListView(
                  padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                  children: [
                    Header(ZipIcons.title, 'Title'),
                    TextFormField(
                      onChanged: (newValue) => todoTitle = newValue,
                      initialValue: todoTitle,
                      validator: (todoTitle) {
                        return todoTitle.trim().isEmpty
                            ? 'The title can not be empty'
                            : null;
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                    Header(ZipIcons.tags, 'Tag'),
                    Tags(),
                    Header(ZipIcons.clock, 'ToDo Time'),
                    Container(
                      height: 150,
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                      child: CupertinoDatePicker(
                        minimumDate: DateTime.now(),
                        onDateTimeChanged: (DateTime dateTime) {
                          selectedTime = dateTime ?? selectedTime;
                        },
                      ),
                    ),
                    Header(
                      ZipIcons.repeat,
                      'Repeat',
                      trailing: AdvancedSwitch(
                        activeColor: activeColor,
                        height: 20,
                        width: 45,
                        activeChild: Transform.scale(
                          scale: 0.8,
                          child: Icon(ZipIcons.repeat),
                        ),
                        value: _repeat,
                        onChanged: (value) {
                          setState(() {
                            _repeat = value;
                          });
                        },
                      ),
                    ),
                    Header(
                      ZipIcons.alert,
                      'Remind me',
                      trailing: AdvancedSwitch(
                        activeColor: activeColor,
                        height: 20,
                        width: 45,
                        activeChild: Transform.scale(
                          scale: 0.8,
                          child: Icon(ZipIcons.alert),
                        ),
                        value: _alert,
                        onChanged: (value) {
                          setState(() {
                            _alert = value;
                          });
                        },
                      ),
                    ),
                    Header(
                      ZipIcons.location,
                      'Location',
                      trailing: IconButton(
                        padding: EdgeInsets.all(0),
                        icon: Icon(
                          ZipIcons.add,
                          size: 40,
                          color: activeColor,
                        ),
                        onPressed: () {
                          print('Location was pressed');
                        },
                      ),
                    ),
                    Header(
                      ZipIcons.edit,
                      'Notes',
                      trailing: IconButton(
                        padding: EdgeInsets.all(0),
                        icon: Icon(
                          ZipIcons.add,
                          size: 40,
                          color: activeColor,
                        ),
                        onPressed: () {
                          print('Notes was pressed');
                        },
                      ),
                    ),
                    Header(
                      ZipIcons.attachment,
                      'Attachments',
                      trailing: IconButton(
                        padding: EdgeInsets.all(0),
                        icon: Icon(
                          ZipIcons.add,
                          size: 40,
                          color: activeColor,
                        ),
                        onPressed: () {
                          print('Location was pressed');
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(100, 10, 100, 10),
                      child: TextButton.icon(
                        icon: Icon(ZipIcons.delete),
                        label: Text(
                          'Delete This Task',
                          style: kTagStyle,
                        ),
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: kRedColor,
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                        ),
                        onPressed: () {
                          TodoData().deleteTodo(widget.todo);
                          Navigator.pop(context);
                          ZipSnackBar.showSnackBar(
                              context, '"${widget.todo.name}" was deleted');
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: BottomButtons(
                cancelOnPressed: () {
                  Navigator.pop(context);
                },
                saveOnPressed: () {
                  //Saving changes after validating that todo title is not empty:
                  final bool hasTitle = _fromKey.currentState.validate();
                  if (!hasTitle) {
                    return;
                  } else {
                    widget.todo.name = todoTitle.trim();
                    widget.todo.time = selectedTime;
                    Provider.of<TodoData>(context, listen: false)
                        .updateTodo(widget.todo);
                    //TodoData().updateTodo(widget.todo);
                    //Navigator.of(context).pop();
                    Navigator.pop(context);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
