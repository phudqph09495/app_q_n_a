import 'package:app_q_n_a/Screens/Screens_TaiKhoan/ThongKe/itemThongKe/NguoiTraLoi.dart';
import 'package:flutter/material.dart';

import '../../../Screens_Pays/ScreensViPays.dart';

class NguoiTraLoiList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      children: List.generate(
        5,
        (index) => NguoiTraLoi(
          avatar: '',
          title: '20.000đ',
          titleMoney: 'Nguyen Van Nam',
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ViTien()));
          },
          name: "Bạn",
          content: 'Câu trả lời của bạn rất chính xác!',
          time: '7h30p  28/06/2022',
        ),
      ),
    );
  }
}
