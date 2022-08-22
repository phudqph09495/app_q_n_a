import 'dart:io';

import 'package:app_q_n_a/Screens/Screens_TaiKhoan/ThongKe/tab/tab_question.dart';
import 'package:flutter/material.dart';

import '../../../bloc/bloc/auth/bloc_getquestion.dart';
import '../../../bloc/event_bloc.dart';
import '../../../styles/colors.dart';
import '../../../styles/styles.dart';
import 'tab/tab_3.dart';
import 'tab/tab_4.dart';
import 'tab/tab_answer.dart';

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
    return DefaultTabController(
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
              unselectedLabelStyle:
              StyleApp.textStyle500(color: ColorApp.grey82, fontSize: 16),
              labelStyle: StyleApp.textStyle700(fontSize: 16),
              unselectedLabelColor: ColorApp.grey82,
              labelColor: Colors.black,
              indicatorColor: ColorApp.orangeF01,
              isScrollable: true,
              tabs: const [
                Tab(text: "Câu hỏi"),
                Tab(text: "Câu trả lời"),
                Tab(text: "Nhận thưởng"),
                Tab(text: "Trả thưởng"),
              ],
            ),
            preferredSize: Size.fromHeight(50),
          ),
        ),
        body: TabBarView(
          children: [
            TabQuestion(),
            TabAnswer(),
            Tab3(),
            Tab4(),
          ],
        ),
      ),
    );
  }
}
