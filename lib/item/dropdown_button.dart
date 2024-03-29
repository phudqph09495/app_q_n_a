import 'package:app_q_n_a/styles/init_style.dart';
import 'package:app_q_n_a/styles/styles.dart';
import 'package:flutter/material.dart';

class Dropdown1 extends StatefulWidget {
  String val;
  List<String> monList;
  ValueChanged? onchange;
  double pad;
  double? height;
  Dropdown1(
      {required this.val,
      required this.monList,
      this.height,
      this.pad = 15,
      this.onchange});
  @override
  State<Dropdown1> createState() => _Dropdown1State();
}

class _Dropdown1State extends State<Dropdown1> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      reverse: true,
      child: ButtonTheme(
        alignedDropdown: true,
        child: DropdownButtonFormField<String>(
          menuMaxHeight: 300,
          hint: Align(
            alignment: Alignment.centerLeft,
            child: Text('Chọn môn học'),
          ),
          value: widget.val,
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: ColorApp.orangeF2, width: 0.5),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.red, width: 0.5),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                    color: Colors.black.withOpacity(0.2), width: 0.5),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.red, width: 0.5),
              ),
              contentPadding: EdgeInsets.only(left: widget.pad, right: 10)),
          onChanged: widget.onchange,
          items: widget.monList.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: StyleApp.textStyle400(),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
