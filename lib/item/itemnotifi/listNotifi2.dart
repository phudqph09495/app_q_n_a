import 'package:app_q_n_a/Screens/Screens_Notification/screens_news.dart';
import 'package:app_q_n_a/bloc/bloc/notification/bloc_news.dart';
import 'package:app_q_n_a/bloc/bloc/notification/bloc_notifi.dart';
import 'package:app_q_n_a/bloc/event_bloc.dart';
import 'package:app_q_n_a/item/itemnotifi/itemNotifi1.dart';
import 'package:app_q_n_a/item/itemnotifi/itemNotifi2.dart';
import 'package:app_q_n_a/models/model_news.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../item/question_tile.dart';
import '../../bloc/state_bloc.dart';
import '../../models/model_notifi.dart';
import '../../widget/items/item_load_page.dart';
import '../../widget/items/item_loadmore.dart';

class ThongBao extends StatefulWidget {
  @override
  State<ThongBao> createState() => _ThongBaoState();
}

class _ThongBaoState extends State<ThongBao> {

  BlocNotifi bloc = BlocNotifi();

  final ScrollController _controller = ScrollController();
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
                ? state.data as List<ModelNotifi>
                : <ModelNotifi>[];
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: List.generate(
                            list.length,
                                (index) => Notification2(modelNotifi: list[index],)),
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
