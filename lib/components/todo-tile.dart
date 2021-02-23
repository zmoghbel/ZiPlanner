import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ziplanner/components/todo-label.dart';
import 'package:ziplanner/zip-icons.dart';

class TodoTile extends StatelessWidget {
  final String title;
  final bool isChecked;
  final Function checkIconCallback;
  final Function deleteCallback;
  final Function editCallback;
  final SlidableController slidableController;
  final bool alarmOn;
  final Function toggleAlarmCallback;

  TodoTile(
      {this.title,
      this.isChecked = false,
      this.checkIconCallback,
      this.deleteCallback,
      this.editCallback,
      this.slidableController,
      this.alarmOn,
      this.toggleAlarmCallback});
  @override
  Widget build(BuildContext context) {
    return Slidable(
      controller: slidableController,
      actionPane: SlidableDrawerActionPane(),
      secondaryActions: [
        IconSlideAction(
          icon: ZipIcons.delete,
          color: Color(0xFFFA5959),
          foregroundColor: Colors.white,
          caption: 'Delete',
          onTap: deleteCallback,
        ),
        IconSlideAction(
          icon: ZipIcons.edit,
          color: Color(0xFF29CCB1),
          foregroundColor: Colors.white,
          caption: 'Edit',
          onTap: editCallback,
        ),
        IconSlideAction(
          closeOnTap: false,
          icon: ZipIcons.share,
          color: Color(0xFF6E8CA0),
          foregroundColor: Colors.white,
          caption: 'Share',
          onTap: () {},
        ),
      ],
      //key: Key(title),
      child: ListTile(
        //isThreeLine: true,
        contentPadding: EdgeInsets.all(0),
        minLeadingWidth: 3,
        leading: SizedBox(
          width: 20,
          child: IconButton(
            padding: EdgeInsets.all(0),
            icon: Icon(
              isChecked
                  ? ZipIcons.check_circle_done
                  : ZipIcons.check_circle_empty,
              size: 20,
            ),
            onPressed: checkIconCallback,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            decoration:
                isChecked ? TextDecoration.lineThrough : TextDecoration.none,
            fontSize: 20,
            color: Color(0XFF334856),
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: TodoLabels(),
        trailing: alarmOn == null
            ? SizedBox()
            : AdvancedSwitch(
                activeColor: Color(0XFF334856),
                height: 20,
                width: 45,
                activeChild: Transform.scale(
                  scale: 0.8,
                  child: Icon(ZipIcons.alert),
                ),
                inactiveChild: Transform.scale(
                  scale: 0.8,
                  child: Icon(ZipIcons.alert),
                ),
                value: alarmOn,
                onChanged: toggleAlarmCallback,
              ),
      ),
    );
  }
}
