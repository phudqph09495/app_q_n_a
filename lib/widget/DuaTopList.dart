import 'package:app_q_n_a/widget/DuaTopTitle.dart';
import 'package:flutter/material.dart';
import 'sk_title.dart';

Widget DuaTopList({required Function() ontap}) {
  return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) {
        return DuaTopTitle(
            ontap: ontap,
            skTextTren: 'Ủa em ? Kết quả đua top tháng 5/2022 nè!',
            thoiGian: '8 ngày trước',
            SkTextDuoi:
                'Ủa j zợ? Nhanh tay vào xem tên mình có trong danh sách nhận quà tháng 5 không nhé!',
            Avatar:
                'https://i.pinimg.com/236x/63/eb/99/63eb997f009a82e5e3d3ca00e10002ba.jpg');
      });
}
