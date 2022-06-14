import 'package:flutter/material.dart';

class RadioTile extends StatefulWidget {
  var index;
  var groupValue;
  String title;
  RadioTile({this.index, this.groupValue, required this.title});
  @override
  State<RadioTile> createState() => _RadioTileState();
}

class _RadioTileState extends State<RadioTile> {
  @override
  Widget build(BuildContext context) {
    return RadioListTile<int>(
      dense: true,
      toggleable: true,
        value: widget.index,
        title: Container(child: Text(widget.title)),
        groupValue: widget.groupValue,
        onChanged: (ind) {
          setState((){
            widget.groupValue=ind;
          });
        });
  }
}
