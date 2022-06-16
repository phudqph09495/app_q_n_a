import 'package:app_q_n_a/item/top_member_tile.dart';
import 'package:flutter/material.dart';

Widget topMemList({
  required String avt,
  required String name,
  required int score,
  required Function() ontap,
  String? key,
}) {
  return ListView.builder(


      shrinkWrap: true,
      itemCount: 30,
      itemBuilder: (BuildContext context, int index) {
        return TopMemTile(avt: avt, name: name, score: score,ontap: ontap);
      });
}
