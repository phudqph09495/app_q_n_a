import 'package:flutter/material.dart';
import 'package:app_q_n_a/item/radio_list_tile.dart';
import 'package:google_fonts/google_fonts.dart';

Widget Filter_List({
  required String title,
  required int column,
  required List<String> list,
  required groupValue,
}) {
  return ClipRRect(borderRadius: BorderRadius.circular(10.0),
    child: Container(
color: Colors.white,

        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ' $title',

            style: GoogleFonts.nunito(
                textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          ),
          GridView.builder(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: column,
              childAspectRatio: 5/2

            ),
            itemBuilder: (BuildContext context, int index) {
              return Container(

                child: RadioTile(
                  title: list[index],
                  index: index,
                  groupValue: groupValue,
                ),
              );
            },
            itemCount: list.length,
          ),
        ],
      ),
    ),
  );
}
