import 'package:app_q_n_a/styles/init_style.dart';
import 'package:flutter/material.dart';
import 'package:app_q_n_a/item/radio_list_tile.dart';
import 'package:google_fonts/google_fonts.dart';

class FilterList2 extends StatefulWidget {
  String title;
  Color? color;
  int column;
  List list;
  double? space;
  double? height;
  int? value;
  ValueChanged onChanged;
  String? lop;
  String? mon;
  FilterList2({
    required this.onChanged,
    this.height,
    this.color = ColorApp.whiteF7,
    required this.title,
    required this.column,
    required this.list,
    this.space = 3,
    this.value,
  });

  @override
  State<FilterList2> createState() => _FilterList2State();
}

class _FilterList2State extends State<FilterList2> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
        height: widget.height,
        decoration: BoxDecoration(
          color: widget.color,
          // border: Border.all(color: ColorApp.orangeF01),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            (widget.title != '')
                ? const SizedBox(
                    height: 15,
                  )
                : const SizedBox(),
            (widget.title != '')
                ? Text(
                    widget.title,
                    style: StyleApp.textStyle700(
                        fontSize: 18, color: ColorApp.black),
                  )
                :const  SizedBox(),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: widget.column,
                  childAspectRatio: widget.space!),
              itemBuilder: (BuildContext context, int index) {
                return RadioTile(
                  title: widget.list[index].name.toString(),
                  index: int.parse(widget.list[index].id.toString()),
                  groupValue: widget.value,
                  onChange: (val) {
                    widget.value = val;
                    setState(() {});
                    return widget.onChanged(val);
                  },
                );
              },
              itemCount: widget.list.length,
            ),
          ],
        ),
      ),
    );
  }
}
