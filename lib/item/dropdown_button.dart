import 'package:app_q_n_a/styles/styles.dart';
import 'package:flutter/material.dart';

class Dropdown1 extends StatefulWidget {
  String val;
  List<String> monList;
  double? height;
  Dropdown1({required this.val, required this.monList,this.height});
  @override
  State<Dropdown1> createState() => _Dropdown1State();
}

class _Dropdown1State extends State<Dropdown1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      child: DropdownButtonFormField<String>(

        hint: Align(
          alignment: Alignment.centerLeft,
          child: Text('Chọn môn học'),
        ),
        value: widget.val,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.blue, width: 1),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.red, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
                BorderSide(color: Colors.black.withOpacity(0.2), width: 1),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.red, width: 1),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 15,)
        ),
        onChanged: (state) {},
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
    );
  }
}
