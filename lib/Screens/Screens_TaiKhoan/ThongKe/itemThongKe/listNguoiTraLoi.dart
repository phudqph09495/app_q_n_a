import 'package:app_q_n_a/Screens/Screens_TaiKhoan/ThongKe/itemThongKe/NguoiTraLoi.dart';
import 'package:flutter/material.dart';

class NguoiTraLoiList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      children: List.generate(
        5,
        (index) => NguoiTraLoi(
            avatar: '',
            title: '20.000đ',
            titleMoney: 'Nguyen Van Nam',
            onTap: () {},
            name: "Bạn"),
      ),
    );
  }
}
