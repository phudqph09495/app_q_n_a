import 'package:app_q_n_a/widget/inFo_title.dart';
import 'package:flutter/material.dart';

Widget inFoList({required Function() ontap}) {
  return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) {
        return InfoTitle(
            ontap: ontap,
            NguoiDung: "Người dùng số 1",
            Id: "1234567",
            Diem: "9.5",
            Avatar:
                'https://i.pinimg.com/736x/ba/ac/08/baac086a36c9854754d555abce63f618.jpg');
      });
}
