import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ziplanner/zip-icons.dart';

//enum tag { none, important, personal, work }

class TagData {
  final IconData icon;
  final String text;
  final Color color;

  const TagData({@required this.icon, @required this.text, @required this.color});
}

class TagButton extends StatefulWidget {
  final IconData icon;
  final String text;
  final Color color;

  TagButton({this.icon, this.text, this.color});

  @override
  _TagButtonState createState() => _TagButtonState();
}

class _TagButtonState extends State<TagButton> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2),
      child: TextButton.icon(
        icon: Icon(widget.icon),
        label: Text(widget.text),
        style: TextButton.styleFrom(
          primary: Colors.white,
          backgroundColor: selected ? widget.color : widget.color.withOpacity(0.5),
          elevation: selected ? 5 : 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25))),
        ),
        onPressed: () {
          setState(() {
            selected = !selected;
          });
        },
      ),
    );
  }
}

final List<TagData> tags = [
  TagData(
    icon: ZipIcons.important,
    text: 'Important',
    color: Color(0xFFFA5959),
  ),
  TagData(
    icon: ZipIcons.personal,
    text: 'Personal',
    color: Color(0xFFF29CCB1),
  ),
  TagData(
    icon: ZipIcons.work,
    text: 'Work',
    color: Color(0xFF2987CC),
  ),
];

class Tags extends StatelessWidget {
  //tag selectedTag;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: tags
            .map((tagData) => Expanded(
                  child: TagButton(
                    icon: tagData.icon,
                    text: tagData.text,
                    color: tagData.color,
                  ),
                ))
            .toList(),
      ),
    );
  }
}
