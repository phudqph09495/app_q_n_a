import 'dart:io';

import 'package:app_q_n_a/Screens/Screens_TaiKhoan/Question_saved/List_save.dart';
import 'package:app_q_n_a/bloc/bloc/question/bloc_list_question-save.dart';
import 'package:app_q_n_a/styles/colors.dart';
import 'package:app_q_n_a/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/bloc/auth/bloc_getquestion.dart';
import '../../bloc/event_bloc.dart';
import '../../bloc/state_bloc.dart';
import '../../item/question_list.dart';
import '../../item/question_tile.dart';
import '../../models/model_question.dart';
import '../../widget/items/item_load_page.dart';
import '../../widget/items/item_loadmore.dart';
import '../answer_screen.dart';

class QuestionSavedSS extends StatefulWidget {
  @override
  State<QuestionSavedSS> createState() => _QuestionSavedSSState();
}

class _QuestionSavedSSState extends State<QuestionSavedSS> {
  BlocListQuestionSave bloc = BlocListQuestionSave();
  ScrollController _controller = ScrollController();
  int page = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    onRefresh();
    loadmore();
  }

  Future<void> onRefresh() async {
    page = 1;
    bloc.add(LoadMoreEvent(
      page: page,
      limit: 20,
      cleanList: true,
    ));
  }

  loadmore() async {
    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        page++;
        bloc.add(LoadMoreEvent(
          page: page,
          loadMore: true,
          limit: 20,
        ));
      }
    });
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
      body: RefreshIndicator(
        onRefresh: onRefresh,
        child: BlocBuilder(
            bloc: bloc,
            builder: (_, StateBloc state) {
              final list = state is LoadSuccess
                  ? state.data as List<ModelQuestion>
                  : <ModelQuestion>[];
              final length = state is LoadSuccess ? state.checkLength : false;
              final hasMore = state is LoadSuccess ? state.hasMore : false;
              return ItemLoadPage(
                  state: state,
                  onTapErr: () {
                    onRefresh();
                  },
                  success: list.isEmpty
                      ? ItemListEmpty()
                      : SingleChildScrollView(
                    controller: _controller,
                    padding:const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: List.generate(
                              list.length,
                                  (index) => QuestionTile(context,
                                  modelQuestion: list[index])),
                        ),
                        ItemLoadMore(
                          hasMore: hasMore,
                          length: length,
                        ),
                      ],
                    ),
                  ));
            }),
      ),
    );
  }
}
