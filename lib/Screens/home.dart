import 'package:app_q_n_a/Screens/answer_screen.dart';
import 'package:app_q_n_a/Screens/filter.dart';
import 'package:app_q_n_a/Screens/search_screen.dart';
import 'package:app_q_n_a/bloc/bloc/auth/bloc_getquestion.dart';
import 'package:app_q_n_a/bloc/check_log_state.dart';
import 'package:app_q_n_a/bloc/event_bloc.dart';
import 'package:app_q_n_a/bloc/state_bloc.dart';
import 'package:app_q_n_a/item/question_list.dart';
import 'package:app_q_n_a/models/model_question.dart';

import 'package:app_q_n_a/styles/init_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../item/question_tile.dart';
import 'add_question.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen();
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> onRefresh() async {
    context.read<BlocGetQuestion>().add(GetData());
  }

  String? keySearch;
  String? keySearch1;
  String? keySearch2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    onRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: ColorApp.orangeF2,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddQuestion()));
          },
          label: Text(
            'Đặt câu hỏi',
            style: StyleApp.textStyle900(fontSize: 16, color: Colors.white),
          ),
          icon: const Icon(
            Icons.add,
            color: Colors.white,
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
            builder: (_, state) {
              // final keySearch =  state is LoadSuccess
              //      ? state.keySearch
              //      : null;
              if (state is LoadSuccess) {
                keySearch = state.keySearch;
                keySearch1 = state.keySearch1;
                keySearch2 = state.keySearch2;
              }
              return Column(
                children: [
                  Row(
                    children: [
                      keySearch != null
                          ? Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Filter()));
                                },
                                child: Container(
                                    height: 15,
                                    child: Center(
                                      child: Text('${keySearch}'),
                                    ),
                                    width: 75,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(1),
                                        color: ColorApp.whiteF7,
                                        border: Border.all(
                                            color: Colors.black, width: 0.5))),
                              ),
                            )
                          : Container(),
                      keySearch1 != null
                          ? Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Filter()));
                                },
                                child: Container(
                                    height: 15,
                                    child: Center(
                                      child: Text('${keySearch1}'),
                                    ),
                                    width: 75,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(1),
                                        color: ColorApp.whiteF7,
                                        border: Border.all(
                                            color: Colors.black, width: 0.5))),
                              ),
                            )
                          : Container(),
                      keySearch2 != null
                          ? Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Filter()));
                                },
                                child: Container(
                                    height: 15,
                                    child: Center(
                                      child: Text('${keySearch2}'),
                                    ),
                                    width: 75,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(1),
                                        color: ColorApp.whiteF7,
                                        border: Border.all(
                                            color: Colors.black, width: 0.5))),
                              ),
                            )
                          : Container(),
                    ],
                  )
                  // keySearch != null ? Padding(
                  //   padding: const EdgeInsets.all(10),
                  //   child: Text("Lọc câu hỏi: $keySearch", style: StyleApp.textStyle700(fontSize: 16,color: Colors.green),),
                  // ) : const SizedBox(),
                  ,
                  Expanded(
                    child: QuestionList(
                      listItem: state is LoadSuccess
                          ? state.data as List<ModelQuestion>
                          : [],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
