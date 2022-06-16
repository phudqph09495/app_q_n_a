import 'package:app_q_n_a/widget/ThongBaoTitle.dart';
import 'package:flutter/material.dart';

Widget ThongBaoList({required Function() ontap}) {
  return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) {
        return ThongBaoTitle(
          ontap: ontap,
            skTextTren: 'Đua top nhận quà tháng 6/2022',
            thoiGian: '15 ngày trước',
            SkTextDuoi:
                'Đua top ngay để nhận các phần quàn hấp dẫn từ hoidap247.com nhé',
            Avatar:
                'https://i.pinimg.com/564x/e5/d9/75/e5d97543e756dbaa15f4919c155c655c.jpg');
      });
}
