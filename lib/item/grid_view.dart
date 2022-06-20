import 'package:app_q_n_a/styles/init_style.dart';
import 'package:flutter/material.dart';
import 'package:app_q_n_a/item/radio_list_tile.dart';
import 'package:google_fonts/google_fonts.dart';

class FilterList extends StatefulWidget {
  String title;
  int column;
  List<String> list;
double? space;
  FilterList({
    required this.title,
    required this.column,
    required this.list,
    this.space=3,
  });

  @override
  State<FilterList> createState() => _FilterListState();
}

class _FilterListState extends State<FilterList> {
  int value = 0;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
        decoration: BoxDecoration(
          color: ColorApp.whiteF0,
          // border: Border.all(color: ColorApp.orangeF01),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                widget.title,
                style: StyleApp.textStyle700(fontSize: 18,color: ColorApp.black),
              ),
            ),
            GridView.builder(
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: widget.column, childAspectRatio: widget.space!),
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
