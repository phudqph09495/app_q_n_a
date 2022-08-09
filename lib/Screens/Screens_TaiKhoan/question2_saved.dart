import 'dart:io';

import 'package:app_q_n_a/Screens/Screens_TaiKhoan/Question_saved/List_save.dart';
import 'package:app_q_n_a/bloc/bloc/question/bloc_list_save.dart';
import 'package:app_q_n_a/styles/colors.dart';
import 'package:app_q_n_a/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/bloc/auth/bloc_getquestion.dart';
import '../../bloc/event_bloc.dart';
import '../../bloc/state_bloc.dart';
import '../../item/question_list.dart';
import '../../models/model_question.dart';
import '../answer_screen.dart';
import '../../../../item/question_tile.dart';

class QuestionSavedSS extends StatefulWidget {
  @override
  State<QuestionSavedSS> createState() => _QuestionSavedSSState();
}

class _QuestionSavedSSState extends State<QuestionSavedSS> {
  BlocListSave blocListSave = BlocListSave();

  Future<void> onRefresh() async {
    blocListSave.add(GetData());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    onRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.whiteF0,
      appBar: AppBar(
        backgroundColor: ColorApp.whiteF0,
        centerTitle: true,
        title: Text(
          'Câu hỏi đã lưu',
          style: StyleApp.textStyle700(color: ColorApp.black, fontSize: 18),
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
      // body: SingleChildScrollView(
      //   child: Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         const SizedBox(
      //           height: 8,
      //         ),
      //         Expanded(
      //           child: BlocBuilder<BlocGetQuestion, StateBloc>(
      //             bloc: blocGetQuestion,
      //             builder: (_, state) => QuestionList(
      //               listItem: state is LoadSuccess
      //                   ? state.data as List<ModelQuestion>
      //                   : [],
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      body: RefreshIndicator(
        onRefresh: onRefresh,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: BlocBuilder<BlocListSave, StateBloc>(
                  bloc: blocListSave,
                  builder: (_, state) {
                    if (state is LoadSuccess) {
                      List<ModelQuestion> list = state.data;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: List.generate(
                            list.length,
                            (index) => QuestionTile(context,
                                modelQuestion: list[index],
                            )),
                      );
                    }
                    return Container();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
