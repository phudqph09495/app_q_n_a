import 'package:app_q_n_a/Screens/Screens_Pays/ScreensViPays.dart';
import 'package:app_q_n_a/Screens/Screens_TaiKhoan/ThongKe/itemThongKe/NguoiHoi.dart';
import 'package:flutter/material.dart';

class NguoiHoiList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      children: List.generate(
        10,
        (index) => NguoiHoi(
          avatar: '',
          title: '10.000đ',
          onTap: () {
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => ViTien()));
          },
          name: "Trần thanh",
          titleMoney: 'Bạn là người trả lời chính xác nhất', time: ' 7h30p  28/06/2022',
        ),
      ),
    );
  }
}
