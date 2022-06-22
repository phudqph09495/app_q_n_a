import 'dart:io';

import 'package:app_q_n_a/item/grid_view.dart';
import 'package:app_q_n_a/item/input_text.dart';
import 'package:app_q_n_a/item/radio_list_tile.dart';
import 'package:app_q_n_a/styles/colors.dart';
import 'package:app_q_n_a/styles/init_style.dart';
import 'package:flutter/material.dart';
import 'package:app_q_n_a/item/question_tile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app_q_n_a/item/button.dart';
import 'package:readmore/readmore.dart';
import 'package:app_q_n_a/item/answer_card.dart' as AnswerCard;
import 'package:app_q_n_a/Screens/add_answer.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:toast/toast.dart';

class AnswerScreen extends StatefulWidget {
  @override
  State<AnswerScreen> createState() => _AnswerScreenState();
}

class _AnswerScreenState extends State<AnswerScreen> {
  var groupValue = 0;


  List<String> report = ['Spam', 'Trả lời sai', 'Abc','XYZ','QWE','POI'];

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      bottomSheet: Button1(
          colorButton: ColorApp.orangeF0,
          textColor: ColorApp.orangeF01,
          radius: 30,
          border: Border.all(color: ColorApp.orangeF01),
          textButton: 'Viết câu trả lời',
          ontap: () {

            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Add_Answer_Screen()));
          }),
      backgroundColor: ColorApp.whiteF7,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorApp.whiteF0,
        title: Text(
          'Trả lời',
          style: StyleApp.textStyle700(fontSize: 18, color: ColorApp.black),
        ),
        leading: IconButton(
          onPressed: () {
            AnswerCard.height=40;
            AnswerCard.maxline=1;
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
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 5,
              ),
              AnswerCard.AnswerWidget(
                  type: true,
                  avatar:
                      'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
                  user: 'tran thanh',
                  time: '11:07 7/6/2022',
                  deadline: 'Còn 3h',
                  question: 'Đây là câu hỏi',
                  hasImage: true,
                  image:
                      'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg'),
              const SizedBox(
                height: 10,
              ),
              // Button1(
              //     ontap: () {
              //       Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //               builder: (context) => Add_Answer_Screen()));
              //     },
              //     colorButton: ColorApp.orangeF0,
              //     border: Border.all(color: ColorApp.orangeF01),
              //     textColor: ColorApp.orangeF01,
              //     width: 200,
              //     height: 40,
              //     textButton: 'Viết bình luận'),

              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        AnswerCard.AnswerWidget(
                          imageReply:
                              'https://tinypng.com/images/social/website.jpg',
                          avatar:
                              'https://tinypng.com/images/social/website.jpg',
                          user: 'người trả lời',
                          time: '12:00 14/06/2022',
                          hasImage: true,
                          image:
                              'https://tinypng.com/images/social/website.jpg',
                          question: 'đây là câu trả lời',
                          type: false,
                          report: () {
                            showPlatformDialog(
                              context: context,
                              builder: (context) => BasicDialogAlert(
                                title: Text("Báo cáo câu trả lời"),
                                content: Container(
                                  height: 400,
                                  width: 400,
                                  child: FilterList(
                                    color: ColorApp.whiteF7,
                                    title: '',
                                    column: 1,
                                    list: report,
                                    space: 5,
                                  ),
                                ),
                                actions: <Widget>[
                                  BasicDialogAction(
                                    title: Text(
                                      "Report",
                                      style: StyleApp.textStyle500(),
                                    ),
                                    onPressed: () {
                                      Toast.show(
                                          "Ý kiến của bạn đã được ghi nhận",
                                          duration: 3,
                                          gravity: Toast.bottom);

                                      Future.delayed(
                                          Duration(milliseconds: 2000), () {
                                        Navigator.pop(context);
                                      });
                                    },
                                  ),
                                  BasicDialogAction(
                                    title: Text(
                                      "Trở lại",
                                      style: StyleApp.textStyle400(),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        )
                      ],
                    );
                  }),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
