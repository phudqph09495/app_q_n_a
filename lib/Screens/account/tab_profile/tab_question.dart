import 'package:flutter/material.dart';

import '../../../item/question_tile.dart';
import '../../answer_screen.dart';

class Tabquestion extends StatelessWidget {
  const Tabquestion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      children: List.generate(
        10,
        (index) => QuestionTile(
          mon: 'Toán',
          deadline: 1660496400,
          lop: '12',
          money: 50,
          ontap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AnswerScreen()));
          },
          createTime: 1658288536,
          question: 'Đếm số đỉnh, số cạnh của khối bát diện đều.',
          attach: true,
          attachCount: '0',
          first: true,
          avatar: "images/default.png",
        ),
      ),
    );
  }
}
