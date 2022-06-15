import 'package:flutter/material.dart';
import '../../../screens_y/product/widget/sk_title.dart';

Widget skListQuestion({required Function onTap}) {
  return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) {
        return SkquestionTile(
            skTextTren: 'BÀI DỰ THI ĐẠI SỨ VĂN HÓA ĐỌC NĂM 2022',
            thoiGian: '14 ngày trước',
            SkTextDuoi:
                'Đua top ngay để nhận các phần quàn hấp dẫn từ hoidap247.com nhé',
            Avatar:
                'https://i.picsum.photos/id/9/250/250.jpg?hmac=tqDH5wEWHDN76mBIWEPzg1in6egMl49qZeguSaH9_VI');
      });
}
