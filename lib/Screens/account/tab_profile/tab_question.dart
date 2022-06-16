import 'package:flutter/material.dart';

import '../../../item/question_tile.dart';
import '../../answer_screen.dart';

class Tabquestion  extends StatelessWidget {
  const Tabquestion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      children: List.generate(7, (index) => QuestionTile(
          mon: 'Toán',
          deadline: 'đây là deadline',
          lop: 7,
          money: 50,
          ontap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AnswerScreen()));
          },
          time: '1h trước',
          question: 'Đây là câu hỏi',
          attach: true,
          attachCount: 1,
          first: true,
          avatar:
          'https://i.picsum.photos/id/9/250/250.jpg?hmac=tqDH5wEWHDN76mBIWEPzg1in6egMl49qZeguSaH9_VI')),
    );
  }
}
