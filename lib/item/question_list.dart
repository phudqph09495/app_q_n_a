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
              mon: widget.listItem[index].subjectName??'Lĩnh vực khác'.toString(),
              deadline: (widget.listItem[index].deadline != null)
                  ? int.parse(widget.listItem[index].deadline)*1000
                  : 0,
              lop: widget.listItem[index].className,
              money:double.parse(widget.listItem[index].priceGift) ,
              createTime: int.parse(widget.listItem[index].createdAt),
              ontap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            AnswerScreen(
                              qid:widget.listItem[index].id,
                          mon: widget.listItem[index].subjectName??'Lĩnh vực khác'.toString(),
                              lop: widget.listItem[index].className,
                              money:double.parse(widget.listItem[index].priceGift) ,
                              deadline: (widget.listItem[index].deadline !=
                                      null)
                                  ? int.parse(widget.listItem[index].deadline)*1000
                                  : 0,
                              question: widget.listItem[index].description,
                              username: widget.listItem[index].username,
                              createAt:
                                  int.parse(widget.listItem[index].createdAt),
                          uqid: int.parse(widget.listItem[index].userId)
                              ,
                            )

                    ));
              },
              question: widget.listItem[index].question,

              attachCount:widget.listItem[index].countImages ,
              first: true,
              avatar: '')),
    );
  }
}
