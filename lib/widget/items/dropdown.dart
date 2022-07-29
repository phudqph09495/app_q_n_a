import 'package:flutter/material.dart';

import '../../styles/init_style.dart';

class DropDown1 extends StatefulWidget {
  List listItem;
  String hint;
  dynamic value;
  bool filled;
  ValueChanged onChanged;
  double radius;
  Color? colorBorder;

  DropDown1({
    required this.listItem,
    required this.hint,
    this.value,
    required this.onChanged,
    this.filled = true,
    this.radius = 5,
    this.colorBorder,
  });

  @override
  _DropDown1State createState() => _DropDown1State();
}

class _DropDown1State extends State<DropDown1> {

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: widget.value,
      onChanged: (val) {
        return widget.onChanged(val);
      },
      isExpanded: true,
      style: StyleApp.textStyle400(),
      hint: Align(
        alignment: Alignment.centerLeft,
        child: Text(widget.hint, style: StyleApp.textStyle400(color: ColorApp.blue3D),),
      ),
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius),
            borderSide:  BorderSide(color: widget.colorBorder ?? ColorApp.orangeF01.withOpacity(0.5), width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius:  BorderRadius.circular(widget.radius),
            borderSide: BorderSide(color: widget.colorBorder ?? ColorApp.orangeF01.withOpacity(0.5), width: 1),
          ),
          fillColor: widget.filled ? ColorApp.orangeF01.withOpacity(0.1) : Colors.white,
          filled: widget.filled,
          contentPadding: const EdgeInsets.symmetric(horizontal: 15)),
      items: List.generate(
        widget.listItem.length,
            (index) => DropdownMenuItem(
          child: Text(
            widget.listItem[index].name.toString(),
            style: StyleApp.textStyle400(),
          ),
          value: widget.listItem[index],
        ),
      ),
    );
  }
}
