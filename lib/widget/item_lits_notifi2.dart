import 'package:app_q_n_a/Screens/add_question.dart';
import 'package:app_q_n_a/widget/item_notifi.dart';
import 'package:app_q_n_a/widget/item_notifi2.dart';
import 'package:flutter/material.dart';

import '../../../item/question_tile.dart';
import '../Screens/Screens_Notification/screens_news.dart';
import '../Screens/answer_screen.dart';
import '../config/next_page.dart';

class ThongBao extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      children: List.generate(
        7,
        (index) => ItemNotifi2(
          avatar: '',
          sub:
              'Đã trả lời câu hỏi : " Đếm số đỉnh,số cạnh của khối bát diện"...... Mà bạn đang theo dõi ',
          onTap: () {
            PageNavigator.next(context: context, page: AnswerScreen());
          },
          title: "Nguyen van nam",
          time: "3 phút trước",
        ),
      ),
    );
  }
}
