import 'package:app_q_n_a/bloc/bloc/thong_ke/bloc_user_qusetion.dart';
import 'package:app_q_n_a/bloc/event_bloc.dart';
import 'package:app_q_n_a/models/model_question.dart';
import 'package:app_q_n_a/widget/items/item_load_page.dart';
import 'package:app_q_n_a/widget/items/item_loadmore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/state_bloc.dart';
import '../../../../item/question_tile.dart';

class TabQuestion extends StatefulWidget {
  @override
  State<TabQuestion> createState() => _TabQuestionState();
}

class _TabQuestionState extends State<TabQuestion> {
  BlocUserQuestion bloc = BlocUserQuestion();

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
    return RefreshIndicator(
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
    );
  }
}
