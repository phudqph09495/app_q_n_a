

import 'package:flutter/material.dart';
import 'package:app_q_n_a/item/question_tile.dart';

Widget ListQuestion({required Function() ontap}) {
  return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 30,
      itemBuilder: (context, index) {
        return QuestionTile(
            mon: 'Toán',
            deadline: 'Còn 3h',
            lop: 12,
            money: 50,
            time: '1h trước',
            ontap:ontap ,
            question: 'Đếm số đỉnh, số cạnh của khối bát diện đều.',
            attach: true,
            attachCount: 1,
            first: true,
            avatar:
                '');
      });
}
