import 'package:app_q_n_a/Screens/Screens_TaiKhoan/Question_saved/QuestionTitle.dart';
import 'package:flutter/material.dart';
Widget QuestionListSaved({required Function() ontap}) {
  return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) {
        return QuestionTitleSaved(
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
