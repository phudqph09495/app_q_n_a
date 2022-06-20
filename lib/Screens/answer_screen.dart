import 'dart:io';

import 'package:app_q_n_a/styles/colors.dart';
import 'package:app_q_n_a/styles/init_style.dart';
import 'package:flutter/material.dart';
import 'package:app_q_n_a/item/question_tile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app_q_n_a/item/button.dart';
import 'package:readmore/readmore.dart';
import 'package:app_q_n_a/item/answer_card.dart';
import 'package:app_q_n_a/Screens/add_answer.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class AnswerScreen extends StatefulWidget {
  @override
  State<AnswerScreen> createState() => _AnswerScreenState();
}

class _AnswerScreenState extends State<AnswerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Button1(
          colorButton: ColorApp.orangeF2,
          textColor: Colors.black,
          textButton: 'Viết câu trả lời',
          ontap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Add_Answer_Screen()));
          }),
      backgroundColor: ColorApp.orangeF8,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorApp.orangeF2,
        title: Text(
          'Trả lời',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnswerWidget(
                  type: true,
                  avatar:
                      'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
                  user: 'tran thanh',
                  time: '11:07 7/6/2022',
                  deadline: 'Đây là deadline',
                  question: 'Đây là câu hỏi',
                  hasImage: true,
                  image:
                      'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg'),
              SizedBox(
                height: 10,
              ),
              Button1(
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Add_Answer_Screen()));
                  },
                  colorButton: ColorApp.whiteF7,
                  width: 200,
                  height: 40,
                  textColor: Colors.blue,
                  textButton: 'Viết bình luận'),
              SizedBox(
                height: 10,
              ),
              ListView.builder(

                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        AnswerWidget(
                          imageReply: 'https://tinypng.com/images/social/website.jpg',
                            avatar:
                                'https://tinypng.com/images/social/website.jpg',
                            user: 'người trả lời',
                            time: '12:00 14/06/2022',
                            hasImage: true,
                            image:
                                'https://tinypng.com/images/social/website.jpg',
                            question: 'đây là câu trả lời',
                            type: false),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}


