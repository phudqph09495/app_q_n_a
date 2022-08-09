import 'dart:async';
import 'dart:io';

import 'package:app_q_n_a/bloc/bloc/auth/bloc_add_answer.dart';
import 'package:app_q_n_a/bloc/bloc/auth/bloc_get_answer.dart';
import 'package:app_q_n_a/bloc/check_log_state.dart';
import 'package:app_q_n_a/bloc/event_bloc.dart';
import 'package:app_q_n_a/bloc/state_bloc.dart';
import 'package:app_q_n_a/config/const.dart';
import 'package:app_q_n_a/item/input_text.dart';
import 'package:app_q_n_a/item/load_image.dart';
import 'package:app_q_n_a/models/model_answer.dart';
import 'package:app_q_n_a/styles/init_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readmore/readmore.dart';
import 'package:toast/toast.dart';

import 'Screens_TaiKhoan/body_product.dart' as Body;

class CommentScreen extends StatefulWidget {
  int answerind;
  int quesID;
  int parent_id;
  List<Items> item;
  CommentScreen(
      {required this.quesID,
      required this.parent_id,
      required this.item,
      required this.answerind});
  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  TextEditingController reply = TextEditingController();

  int userid = Body.id;

  BlocGetAnswer blocGetAnswer = BlocGetAnswer();
  BlocAddAnswer blocAddAnswer = BlocAddAnswer();
  Future<void> onRefresh() async {
    blocGetAnswer.add(getAns(question_id: widget.quesID));
  }

  ModelAnswer list = ModelAnswer();

  AddComment() async {
    blocAddAnswer.add(addAnsForm(
        user_id: userid,
        question_id: widget.quesID,
        answer: reply.text,
        parent_id: int.parse(list.answer?[widget.answerind].id ?? '0')));
  }

  @override
  void initState() {
    // TODO: implement initState
    onRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: Scaffold(
        bottomSheet: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: BlocListener(
            bloc: blocAddAnswer,
            listener: (_, StateBloc state) {
              CheckLogState.check(context, state: state, isShowMsg: false,
                  success: () {
                onRefresh();
                reply.clear();
              });
            },
            child: InputText(
              iconPress: AddComment,
              width: double.infinity,
              inputType: TextInputType.multiline,
              maxline: null,
              controller: reply,
              hint: 'Nhập bình luận....',
              iconS: true,
              suffixIcon: Icon(
                Icons.send,
              ),
            ),
          ),
        ),
        backgroundColor: ColorApp.whiteF7,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: ColorApp.whiteF0,
          title: Text(
            'Bình luận',
            style: StyleApp.textStyle700(
              fontSize: 18,
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
              color: ColorApp.black,
            ),
          ),
        ),
        body: BlocBuilder(
          bloc: blocGetAnswer,
          builder: (_, state) {
            if (state is LoadSuccess) {
              list = state.data as ModelAnswer;
              print(list.answer?[widget.answerind].items?.length);
              return SingleChildScrollView(
                reverse: true,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount:
                          list.answer?[widget.answerind].items?.length ?? 0,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  //Mở trang cá nhân
                                },
                                child: Text(
                                  list.answer?[widget.answerind].items?[index]
                                          .username ??
                                      'hello',
                                  style: StyleApp.textStyle600(fontSize: 14),
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(Const.checkTime(Const.convertNumber(
                                                list
                                                        .answer?[
                                                            widget.answerind]
                                                        .items?[index]
                                                        .createdAt ??
                                                    00)
                                            .round()) ??
                                        'hi'),
                                    Text(
                                      list.answer?[widget.answerind]
                                              .items?[index].answer ??
                                          'hi',
                                      style: StyleApp.textStyle600(),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
