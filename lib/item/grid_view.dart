import 'package:app_q_n_a/styles/init_style.dart';
import 'package:flutter/material.dart';
import 'package:app_q_n_a/item/radio_list_tile.dart';
import 'package:google_fonts/google_fonts.dart';

class FilterList extends StatefulWidget {
  String title;
  int column;
  List<String> list;

  FilterList({
    required this.title,
    required this.column,
    required this.list,
  });

  @override
  State<FilterList> createState() => _FilterListState();
}

class _FilterListState extends State<FilterList> {
  int value = 0;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Container(
        color: ColorApp.whiteF7,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Text(
                widget.title,
                style: StyleApp.textStyle700(fontSize: 18),
              ),
            ),
            GridView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: widget.column, childAspectRatio: 5 / 2),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: RadioTile(
                    title: widget.list[index],
                    index: index,
                    groupValue: value,
                    onChange: (val) {
                      setState(() {
                        value = val;
                      });
                    },
                  ),
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
