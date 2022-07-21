import 'package:app_q_n_a/Screens/answer_screen.dart';
import 'package:app_q_n_a/item/question_tile.dart';
import 'package:flutter/material.dart';

class QuestionList extends StatefulWidget {
List listItem;
QuestionList({required this.listItem});

  @override
  State<QuestionList> createState() => _QuestionListState();
}

class _QuestionListState extends State<QuestionList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      children: List.generate(
          widget.listItem.length,
              (index) => QuestionTile(
              mon: widget.listItem[index].catId,
              deadline: int.parse(widget.listItem[index].deadline),
              lop:int.parse(widget.listItem[index].catId),
              money: 50000,
              createTime: int.parse(widget.listItem[index].createdAt),
              ontap: () {
              },
              question:
              widget.listItem[index].question,
              attach: true,
              attachCount: 1,
              first: true,
              )),
    );
  }
}


