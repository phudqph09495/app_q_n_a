import 'package:app_q_n_a/widget/sk_title.dart';
import 'package:flutter/material.dart';

Widget skListQuestion({required Function() ontap}) {
  return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) {
        return SkquestionTile(
          ontap: ontap,
            skTextTren: 'BÀI DỰ THI ĐẠI SỨ VĂN HÓA ĐỌC NĂM 2022',
            thoiGian: '14 ngày trước',
            SkTextDuoi:
                'Đua top ngay để nhận các phần quàn hấp dẫn từ hoidap247.com nhé',
            Avatar:
                'https://i.pinimg.com/564x/95/e2/c8/95e2c862fbdbb550990a52018f711c16.jpg');
      });
}
