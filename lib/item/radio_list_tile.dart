import 'package:app_q_n_a/styles/init_style.dart';
import 'package:flutter/material.dart';

class RadioTile extends StatefulWidget {
  var index;
  var groupValue;
  String title;
  ValueChanged onChange;
  RadioTile({this.index, this.groupValue, required this.title, required this.onChange});
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
      title: Container(child: Text(widget.title,style: StyleApp.textStyle500(fontSize: 12),)),
      groupValue: widget.groupValue,
      onChanged: widget.onChange
      ,);
  }
}
