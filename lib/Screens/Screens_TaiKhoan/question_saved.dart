import 'package:app_q_n_a/Screens/Screens_Notification/Screens_tabBarView/tab_account.dart';
import 'package:app_q_n_a/styles/init_style.dart';
import 'package:flutter/material.dart';

import '../../item/question_list.dart';

class Question_saved extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.whiteF0,
      appBar: AppBar(
        backgroundColor: ColorApp.whiteF0,
        centerTitle: false,
        title: Text(
          "Câu hỏi đã lưu",
          style: StyleApp.textStyle700(fontSize: 18, color: ColorApp.black),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: ColorApp.orangeF01,
          ),
        ),
      ),
      body: TabAccount(),
    );
  }
}
