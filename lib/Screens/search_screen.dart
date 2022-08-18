import 'dart:async';
import 'dart:io';

import 'package:app_q_n_a/Screens/add_question.dart';
import 'package:app_q_n_a/Screens/answer_screen.dart';
import 'package:app_q_n_a/bloc/bloc/auth/bloc_getquestion.dart';
import 'package:app_q_n_a/bloc/check_log_state.dart';
import 'package:app_q_n_a/bloc/event_bloc.dart';
import 'package:app_q_n_a/bloc/state_bloc.dart';
import 'package:app_q_n_a/item/input_text.dart';
import 'package:app_q_n_a/item/question_tile.dart';
import 'package:app_q_n_a/models/model_question.dart';
import 'package:app_q_n_a/styles/init_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../config/next_page.dart';
import '../styles/colors.dart';
import '../widget/items/dia_log_item.dart';
import '../widget/items/item_load_page.dart';
import '../widget/items/item_loadmore.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController search = TextEditingController();
  BlocGetQuestion blocGetQuestion = BlocGetQuestion();
  ScrollController controller = ScrollController();
  int page = 1;
  Future<void> onRefresh() async {
    page = 1;
    blocGetQuestion.add(
      GetData(
        cleanList: true,
        isUser: false,
        page: page,
        keyword: search.text
      ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    onRefresh();
    controller.addListener(() {
      if(controller.position.pixels == controller.position.maxScrollExtent){
        page++;
        blocGetQuestion.add(
          GetData(
            loadMore: true,
              isUser: false,
              page: page,
              keyword: search.text
          ),
        );
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.whiteF7,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorApp.whiteF0,
        title: Text(
          'Tìm kiếm câu hỏi',
          style: StyleApp.textStyle700(fontSize: 18),
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
      body: Column(
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: InputText(
                onSubmit: (val) {
                  onRefresh();
                },
                textColor: Colors.black,
                maxline: 1,
                action: TextInputAction.search,
                suffixIcon: const Icon(
                  Icons.close,
                  color: ColorApp.black,
                ),
                hint: 'Tìm nội dung câu hỏi bạn quan tâm',
                controller: search,
                iconPress: () {
                  search.clear();
                  onRefresh();
                },
                colorBorder: Colors.black,
                colorhint: ColorApp.black.withOpacity(0.3),
                iconS: true,
            ),
          ),
          Expanded(
            child: BlocBuilder(
              bloc: blocGetQuestion,
              builder: (_,StateBloc state) {
                final list  = state is LoadSuccess ? state.data as List<ModelQuestion> : <ModelQuestion>[];
                final length = state is LoadSuccess ? state.checkLength : false;
                final hasMore = state is LoadSuccess ? state.hasMore : false;
                return ItemLoadPage(
                  state: state,
                  success: list.isEmpty
                      ? ItemListEmpty()
                      :  SingleChildScrollView(
                    controller: controller,
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
                  ),
                  onTapErr: onRefresh
                );
              },

            ),
          ),
        ],
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          PageNavigator.next(context: context, page: AddQuestion());
        },
        style: ElevatedButton.styleFrom(
          primary: ColorApp.orangeF0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Đặt câu hỏi',
              style: StyleApp.textStyle700(color: Colors.white),
            ), // <-- Text
            const SizedBox(
              width: 5,
            ),
            const Icon(
              // <-- Icon
              Icons.add,
              size: 24.0,
            ),
          ],
        ),
      ),
    );
  }
}
