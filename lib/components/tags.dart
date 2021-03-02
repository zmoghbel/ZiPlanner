import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ziplanner/zip-icons.dart';

enum tag { none, important, personal, work }

final List<TagData> tagDatas = [
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

class Tags extends StatefulWidget {
  @override
  _TagsState createState() => _TagsState();
}

class _TagsState extends State<Tags> {
  tag selectedTag;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: tagDatas
            .map((tagData) => TagWidget(
                  icon: tagData.icon,
                  text: tagData.text,
                  color: tagData.color,
                ))
            .toList(),
        /*[
          Expanded(
            child: OvalButton(
                icon: ZipIcons.important,
                color: selectedTag == tag.important
                    ? Color(0xFFFA5959)
                    : Color(0xFFF7B6B6),
                elevation: selectedTag == tag.important ? 5 : null,
                onPressed: () {
                  setState(() {
                    selectedTag =
                        selectedTag == tag.important ? null : tag.important;
                  });
                }),
          ),
          SizedBox(width: 10),
          Expanded(
            child: TextButton.icon(
              icon: Icon(ZipIcons.personal),
              label: Text('Personal'),
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: selectedTag == tag.personal
                    ? Color(0xFFF29CCB1)
                    : Color(0xFFA4E5DA),
                elevation: selectedTag == tag.personal ? 5 : null,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25))),
              ),
              onPressed: () {
                setState(() {
                  selectedTag =
                      selectedTag == tag.personal ? null : tag.personal;
                });
              },
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: TextButton.icon(
              icon: Icon(ZipIcons.work),
              label: Text(' Work'),
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: selectedTag == tag.work
                    ? Color(0xFF2987CC)
                    : Color(0xFFB3D7FF),
                elevation: selectedTag == tag.work ? 5 : null,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25))),
              ),
              onPressed: () {
                setState(() {
                  selectedTag = selectedTag == tag.work ? null : tag.work;
                });
              },
            ),
          ),
        ],*/
      ),
    );
  }
}

class TagData {
  const TagData({
    @required this.icon,
    @required this.text,
    @required this.color,
  });
  //final tag selectedTag;

  final IconData icon;
  final String text;
  final Color color;
}

class TagWidget extends StatefulWidget {
  final IconData icon;
  final String text;
  final Color color;

  bool selected;

  TagWidget({
    this.icon,
    this.text,
    this.color,
    this.selected = false,
  });

  @override
  _TagWidgetState createState() => _TagWidgetState();
}

class _TagWidgetState extends State<TagWidget> {
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: Icon(widget.icon),
      label: Text(widget.text),
      style: TextButton.styleFrom(
        primary: Colors.white,
        backgroundColor:
            widget.selected ? widget.color : widget.color.withOpacity(0.5),
        elevation: widget.selected ? 5 : 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25))),
      ),
      onPressed: () {
        setState(() {
          widget.selected = !widget.selected;
        });
      },
    );
  }
}
