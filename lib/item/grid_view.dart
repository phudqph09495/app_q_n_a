import 'package:app_q_n_a/styles/init_style.dart';
import 'package:flutter/material.dart';
import 'package:app_q_n_a/item/radio_list_tile.dart';
import 'package:google_fonts/google_fonts.dart';

class FilterList extends StatefulWidget {
  String title;
  Color? color;
  int column;
  List<String> list;
  double? space;
  double? height;
  FilterList({
    this.height,
    this.color = ColorApp.whiteF7,
    required this.title,
    required this.column,
    required this.list,
    this.space = 3,
  });

  @override
  State<FilterList> createState() => _FilterListState();
}

class _FilterListState extends State<FilterList> {
  int value = -1;
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
                ? SizedBox(
                    height: 15,
                  )
                : SizedBox(),
            (widget.title != '')
                ? Text(
                    widget.title,
                    style: StyleApp.textStyle700(
                        fontSize: 18, color: ColorApp.black),
                  )
                : SizedBox(),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: widget.column,
                  childAspectRatio: widget.space!),
              itemBuilder: (BuildContext context, int index) {
                return RadioTile(
                  title: widget.list[index],
                  index: index,
                  groupValue: value,
                  onChange: (val) {
                    setState(() {
                      value = val;
                    });
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
