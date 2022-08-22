import 'dart:io';

import 'package:app_q_n_a/Screens/Screens_TaiKhoan/question2_saved.dart';
import 'package:app_q_n_a/Screens/Screens_TaiKhoan/question_saved.dart';
import 'package:app_q_n_a/Screens/comment.dart';
import 'package:app_q_n_a/bloc/bloc/question/bloc_save_question.dart';
import 'package:app_q_n_a/bloc/check_log_state.dart';
import 'package:app_q_n_a/bloc/event_bloc.dart';
import 'package:app_q_n_a/bloc/state_bloc.dart';
import 'package:app_q_n_a/config/next_page.dart';
import 'package:app_q_n_a/item/button.dart';
import 'package:app_q_n_a/item/gridView/grid_view_custom.dart';
import 'package:app_q_n_a/item/input_text.dart';
import 'package:app_q_n_a/item/item_answer/build_image_ans.dart';
import 'package:app_q_n_a/item/item_user.dart';
import 'package:app_q_n_a/item/load_image.dart';
import 'package:app_q_n_a/models/model_question.dart';
import 'package:app_q_n_a/styles/colors.dart';
import 'package:app_q_n_a/styles/styles.dart';
import 'package:app_q_n_a/widget/items/item_count_down.dart';
import 'package:app_q_n_a/widget/items/show_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:readmore/readmore.dart';
import 'package:toast/toast.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:app_q_n_a/Screens/answer_screen.dart' as AnswerScreen;

import '../../config/const.dart';
import '../../models/model_answer.dart';

class QuestionCard extends StatefulWidget {
  ModelAnswer modelAnswer;
  ModelQuestion modelQuestion;
  bool isSave;

  QuestionCard({
    this.isSave = false,
    required this.modelAnswer,
    required this.modelQuestion,
  });

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  List<String> listImages = [];
  BlocSaveQuestion blocSaveQuestion = BlocSaveQuestion();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.modelAnswer.images!.isNotEmpty) {
      for (var image in widget.modelAnswer.images!) {
        listImages.add("${Const.image_host}${image.path}${image.name}");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BlocListener(
            bloc: blocSaveQuestion,
            listener: (_,StateBloc state){
              CheckLogState.check(context, state: state,
              msg: "Lưu câu hỏi thành công"
              );
            },
            child: ItemUser(username: widget.modelQuestion.username ?? "",
            image: widget.modelQuestion.avatarPath.toString() +
                widget.modelQuestion.avatarName.toString(),
              time: widget.modelQuestion.createdAt ?? "",
              onTap: (){
                blocSaveQuestion.add(GetData(
                  id: widget.modelQuestion.id
                ));
              },
              isSHowSave: true,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ItemCountDown(
              time: Const.convertNumber(widget.modelQuestion.deadline).round() *
                  1000),
          const SizedBox(
            height: 10,
          ),
          Text(widget.modelQuestion.question ?? "", style: StyleApp.textStyle500(),),
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
                color: ColorApp.whiteF0,
                borderRadius: BorderRadius.circular(5)),
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ReadMoreText(
                  widget.modelQuestion.description ?? "",
                  trimLines: 3,
                  colorClickableText: ColorApp.orangeF01,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Xem thêm',
                  trimExpandedText: 'Ẩn bớt',
                  style: StyleApp.textStyle500(fontSize: 16),
                ),
                listImages.isNotEmpty
                    ? BuildImageAns(listImages: listImages)
                    : const SizedBox(),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          )

        ],
      ),
    );
  }

}
