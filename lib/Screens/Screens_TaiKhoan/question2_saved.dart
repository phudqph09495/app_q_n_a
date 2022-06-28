import 'dart:io';

import 'package:app_q_n_a/Screens/Screens_TaiKhoan/Question_saved/List_save.dart';
import 'package:app_q_n_a/styles/colors.dart';
import 'package:app_q_n_a/styles/styles.dart';
import 'package:flutter/material.dart';

import '../answer_screen.dart';

class QuestionSavedSS extends StatelessWidget {
  const QuestionSavedSS({Key? key}) : super(key: key);

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 8,
              ),
              QuestionListSaved(
                ontap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AnswerScreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
