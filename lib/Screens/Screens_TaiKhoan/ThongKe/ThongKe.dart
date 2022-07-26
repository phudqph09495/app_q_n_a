import 'dart:io';

import 'package:app_q_n_a/Screens/Screens_TaiKhoan/ThongKe/itemThongKe/listNguoiTraLoi.dart';
import 'package:app_q_n_a/Screens/answer_screen.dart';
import 'package:app_q_n_a/item/question_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/bloc/auth/bloc_getquestion.dart';
import '../../../bloc/event_bloc.dart';
import '../../../bloc/state_bloc.dart';
import '../../../models/model_question.dart';
import '../../../styles/colors.dart';
import '../../../styles/styles.dart';
import '../../account/tab_profile/tab_answer.dart';
import '../../account/tab_profile/tab_question.dart';
import 'itemThongKe/listNguoiHoi.dart';

class ThongKe extends StatefulWidget {
  const ThongKe({Key? key}) : super(key: key);

  @override
  State<ThongKe> createState() => _ThongKeState();
}

class _ThongKeState extends State<ThongKe> {
  BlocGetQuestion blocGetQuestion = BlocGetQuestion();
  Future<void> onRefresh() async {
    blocGetQuestion.add(GetData());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    onRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: ColorApp.whiteF0,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: ColorApp.whiteF0,
            title: Text(
              'Thống kê',
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
            bottom: PreferredSize(
              child: TabBar(
                labelColor: ColorApp.black,
                unselectedLabelStyle:
                    StyleApp.textStyle500(color: ColorApp.grey82, fontSize: 16),
                labelStyle: StyleApp.textStyle700(fontSize: 16),
                indicatorColor: ColorApp.orangeF01,
                unselectedLabelColor: ColorApp.grey82,
                isScrollable: true,
                tabs: [
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Câu hỏi',
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                        Text(
                          '(5)',
                          style: TextStyle(
                              fontSize: 15, color: ColorApp.orangeF01),
                        ),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Câu trả lời',
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                        Text(
                          '(5)',
                          style: TextStyle(
                              fontSize: 15, color: ColorApp.orangeF01),
                        ),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Nhận thưởng',
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                        Text(
                          '(10)',
                          style: TextStyle(
                              fontSize: 15, color: ColorApp.orangeF01),
                        ),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Trả thưởng',
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                        Text(
                          '(5)',
                          style: TextStyle(
                              fontSize: 15, color: ColorApp.orangeF01),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              preferredSize: Size.fromHeight(50),
            ),
          ),
          body: TabBarView(
            children: [
              Expanded(
                child: BlocBuilder<BlocGetQuestion, StateBloc>(
                  bloc: blocGetQuestion,
                  builder: (_, state) => QuestionList(
                    listItem: state is LoadSuccess
                        ? state.data as List<ModelQuestion>
                        : [],
                  ),
                ),
              ),
              Expanded(
                child: BlocBuilder<BlocGetQuestion, StateBloc>(
                  bloc: blocGetQuestion,
                  builder: (_, state) => QuestionList(
                    listItem: state is LoadSuccess
                        ? state.data as List<ModelQuestion>
                        : [],
                  ),
                ),
              ),
              NguoiHoiList(),
              NguoiTraLoiList(),
            ],
          ),
        ),
      ),
    );
  }
}
