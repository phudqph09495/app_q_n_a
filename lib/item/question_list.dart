import 'package:app_q_n_a/Screens/answer_screen.dart';
import 'package:app_q_n_a/item/question_tile.dart';
import 'package:app_q_n_a/styles/init_style.dart';
import 'package:flutter/material.dart';

import '../models/model_question.dart';

class QuestionList extends StatefulWidget {
  List<ModelQuestion> listItem;
  QuestionList({required this.listItem});

  @override
  State<QuestionList> createState() => _QuestionListState();
}

class _QuestionListState extends State<QuestionList> {
  @override
  Widget build(BuildContext context) {
    return  widget.listItem.isEmpty ? Center(child: Text("", style: StyleApp.textStyle400(),),) :ListView(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      children: List.generate(

          widget.listItem.length,
          (index) => QuestionTile(context,modelQuestion: widget.listItem[index])),
    );
  }
}
