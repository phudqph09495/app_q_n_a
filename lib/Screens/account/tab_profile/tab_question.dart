import 'package:flutter/material.dart';

import '../../../item/question_tile.dart';
import '../../answer_screen.dart';

class Tabquestion extends StatelessWidget {
  const Tabquestion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 22),
      children: List.generate(
        7,
        (index) => QuestionTile(
          mon: 'Toán',
          deadline: 'Còn 3h',
          lop: 12,
          money: 50,
          ontap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AnswerScreen()));
          },
          time: '1h trước',
          question: 'Đếm số đỉnh, số cạnh của khối bát diện đều.',
          attach: true,
          attachCount: 1,
          first: true,
          avatar: "images/default.png",
        ),
      ),
    );
  }
}
