

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
            deadline: 'đây là deadline',
            lop: 7,
            money: 50,
            time: '1h trước',
            ontap:ontap ,
            question: 'Còn 15 phút',
            attach: true,
            attachCount: 1,
            first: true,
            avatar:
                'https://i.picsum.photos/id/9/250/250.jpg?hmac=tqDH5wEWHDN76mBIWEPzg1in6egMl49qZeguSaH9_VI');
      });
}
