import 'package:app_q_n_a/Screens/answer_screen.dart';
import 'package:app_q_n_a/Screens/filter.dart';
import 'package:app_q_n_a/Screens/search_screen.dart';
import 'package:app_q_n_a/bloc/bloc/auth/bloc_getquestion.dart';
import 'package:app_q_n_a/bloc/check_log_state.dart';
import 'package:app_q_n_a/bloc/event_bloc.dart';
import 'package:app_q_n_a/bloc/state_bloc.dart';
import 'package:app_q_n_a/config/next_page.dart';
import 'package:app_q_n_a/item/question_list.dart';
import 'package:app_q_n_a/models/model_question.dart';

import 'package:app_q_n_a/styles/init_style.dart';
import 'package:app_q_n_a/widget/items/item_load_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../item/question_tile.dart';
import '../widget/items/item_loadmore.dart';
import 'add_question.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen();

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int page = 1;
  ScrollController controller = ScrollController();
  Future<void> onRefresh() async {
    page = 1;
    context.read<BlocGetQuestion>().add(
          GetData(
              cat_id: keySearchid,
              subject_id: keySearchid1,
              class_id: keySearchid2,
              isUser: false,
            cleanList: true,
            page: page,
          ),
        );
  }

  String? keySearch;
  String? keySearch1;
  String? keySearch2;
  int? countFilter;

  int? keySearchid;
  int? keySearchid1;
  int? keySearchid2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    onRefresh();
    controller.addListener(() {
      if(controller.position.pixels == controller.position.maxScrollExtent){
        page++;
        context.read<BlocGetQuestion>().add(
          GetData(
            cat_id: keySearchid,
            subject_id: keySearchid1,
            class_id: keySearchid2,
            isUser: false,
            loadMore: true,
            page: page,
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
        backgroundColor: ColorApp.whiteF0,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 110,
          backgroundColor: ColorApp.whiteF0,
          elevation: 0,
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(left: 13),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 12,
                ),
                Image.asset(
                  'images/backg2.png',
                  height: 45,
                  fit: BoxFit.fitHeight,
                  alignment: Alignment.centerLeft,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 35,
                  width: 160,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorApp.whiteF7,
                      border: Border.all(color: Colors.black, width: 0.5)),
                  child: FlatButton(
                      height: 35,
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Filter()));
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.menu_open),
                          Text(
                            '  Lọc câu hỏi',
                            style: StyleApp.textStyle700(fontSize: 16),
                          )
                        ],
                      )),
                ),
              ],
            ),
          ),
          centerTitle: false,
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)),
                padding: const EdgeInsets.all(5),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchScreen()));
              },
              child: const Icon(
                Icons.search,
                color: ColorApp.black,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: onRefresh,
          child: BlocBuilder<BlocGetQuestion, StateBloc>(
            builder: (_, StateBloc state) {
              // final keySearch =  state is LoadSuccess
              //      ? state.keySearch
              //      : null;
              if (state is LoadSuccess) {
                keySearch = state.keySearch;
                keySearch1 = state.keySearch1;
                keySearch2 = state.keySearch2;
              }
              final list = state is LoadSuccess ? state.data as List<ModelQuestion> : <ModelQuestion>[];
              final length = state is LoadSuccess ? state.checkLength : false;
              final hasMore = state is LoadSuccess ? state.hasMore : false;
              return ItemLoadPage(
                state: state,
                success: Column(
                  children: [
                    Row(
                      children: [
                        keySearch != null
                            ? _itemSearch(keySearch)
                            : Container(),
                        keySearch1 != null
                            ? _itemSearch(keySearch1)
                            : Container(),
                        keySearch2 != null
                            ? _itemSearch(keySearch2)
                            : Container(),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child:list.isEmpty
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

                    ),
                  ],
                ),
                onTapErr: onRefresh,
              );
            },
          ),
        ),
      ),
    );
  }

  _itemSearch(key) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
      margin: const EdgeInsets.only(left: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.green.shade100,
        border: Border.all(color: Colors.black, width: 0.5),
      ),
      child: Text(
        key,
        style: StyleApp.textStyle400(),
      ),
    );
  }
}
