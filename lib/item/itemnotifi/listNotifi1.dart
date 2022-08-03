import 'package:app_q_n_a/Screens/Screens_Notification/screens_news.dart';
import 'package:app_q_n_a/item/itemnotifi/itemNotifi1.dart';
import 'package:flutter/material.dart';

import '../../../item/question_tile.dart';

class SuKienNong extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      children: List.generate(
        7,
        (index) => ItemNotifi1(
            avatar:
                "https://i.pinimg.com/564x/15/17/cf/1517cfa3e1a7d3fb243c85c0eb471791.jpg",
            sub:
                'Click để xem ngay đáp án chính xác nhất cuộc thi Bác Hồ Với Thanh Hóa , Thanh Hóa Làm Theo Lời Bác!',
            time: "8 ngày trước",
            onTap: () {
              Navigator.of(context, rootNavigator: true).push(
                MaterialPageRoute(
                  builder: (_) => ScreensNew(),
                ),
              );
            },
            title: "Đáp án cuộc thi Bác Hồ Với Thanh Hóa Làm Theo Lời Bác!"),
      ),
    );
  }
}
