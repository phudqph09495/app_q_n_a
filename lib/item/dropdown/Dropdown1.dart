import 'package:flutter/material.dart';

import '../../styles/init_style.dart';

class DropDown2 extends StatefulWidget {
  List listItem;
  String hint;
  dynamic value;
  bool filled;
  ValueChanged onChanged;
  double radius;
  Color? colorBorder;
  Function(String)? validator;
  DropDown2(
      {required this.listItem,
      required this.hint,
      this.value,
      required this.onChanged,
      this.filled = true,
      this.radius = 10,
      this.colorBorder,
      this.validator});

  @override
  _DropDown2State createState() => _DropDown2State();
}

class _DropDown2State extends State<DropDown2> {
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      alignedDropdown: true,
      child: DropdownButtonFormField(
        validator: (val) {
          if (widget.validator != null) {
            return widget.validator!(val.toString());
          }
          return null;
        },
        menuMaxHeight: 300,
        value: widget.value,
        onChanged: (val) {
          return widget.onChanged(val);
        },
        isExpanded: true,
        style: StyleApp.textStyle400(),
        hint: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.hint,
            style: StyleApp.textStyle400(color: ColorApp.blue3D),
          ),
        ),
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius),
              borderSide:
                  BorderSide(color: Colors.black.withOpacity(0.2), width: 0.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius),
              borderSide: BorderSide(color: ColorApp.orangeF2, width: 0.5),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius),
              borderSide: const BorderSide(color: Colors.red, width: 0.5),
              // borderSide:
              // const BorderSide(color: ColorApp.black, width: 1),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius),
              borderSide: BorderSide(color: Colors.red, width: 0.5),
              // borderSide:
              // const BorderSide(color: ColorApp.black, width: 1),
            ),
            contentPadding: EdgeInsets.only(left: 15, right: 10)),
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
      ),
    );
  }
}
