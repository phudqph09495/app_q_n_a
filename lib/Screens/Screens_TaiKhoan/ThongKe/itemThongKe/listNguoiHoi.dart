import 'package:app_q_n_a/Screens/Screens_TaiKhoan/ThongKe/itemThongKe/NguoiHoi.dart';
import 'package:flutter/material.dart';

class NguoiHoiList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      children: List.generate(
        5,
        (index) => NguoiHoi(
            avatar: '',
            title: '1000',
            titleMoney: '500',
            onTap: () {},
            name: "Trần thanh"),
      ),
    );
  }
}
