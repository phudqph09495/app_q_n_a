import 'package:app_q_n_a/bloc/bloc/thong_ke/bloc_user_qusetion.dart';
import 'package:app_q_n_a/bloc/event_bloc.dart';
import 'package:app_q_n_a/config/path/share_pref_path.dart';
import 'package:app_q_n_a/config/share_pref.dart';
import 'package:app_q_n_a/models/model_question.dart';
import 'package:app_q_n_a/widget/items/item_load_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/state_bloc.dart';
import '../../../../config/path/string_path.dart';
import '../../../../styles/init_style.dart';

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
                success: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Text(
                          length
                              ? StringPath.loadFull
                              : hasMore
                                  ? StringPath.loading
                                  : "",
                          textAlign: TextAlign.center,
                          style: StyleApp.textStyle400(),
                        ),
                      ),
                    ],
                  ),
                ));
          }),
    );
  }
}
