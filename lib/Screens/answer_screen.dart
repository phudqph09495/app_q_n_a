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
  int money = 50;
  int lop = 12;
  String mon = 'Toán';

  List<String> report = [
    'Spam',
    'Trả lời sai',
    'Quấy rồi',
    'Bắt nạt',
    'Bắt nạt1',
    'Bắt nạt2',
    'Bắt nạt3',
    'Bắt nạt4',
    'Bắt nạt5',
    'Bắt nạt6',
    'Bắt nạt7',
    'Bắt nạt8',

  ];

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Button1(
            colorButton: ColorApp.orangeF2,
            textColor: ColorApp.whiteF0,
            radius: 30,
            fontSize: 18,
            style: false,
            border: Border.all(color: ColorApp.orangeF2),
            textButton: 'Viết câu trả lời',
            ontap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Add_Answer_Screen()));
            }),
      ),
      backgroundColor: ColorApp.whiteF7,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorApp.whiteF0,
        title: Text(
          'Môn $mon- Lớp $lop- $money đ',
          style: StyleApp.textStyle700(fontSize: 18,),
        ),
        leading: IconButton(
          onPressed: () {
            AnswerCard.height = 40;
            AnswerCard.maxline = 1;
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
                  question: 'Đếm số đỉnh, số cạnh của khối bát diện đều.',
                  hasImage: true,
                  image: 'https://img.loigiaihay.com/picture/2021/1116/1.png'),
              const SizedBox(
                height: 10,
              ),


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
                          user: 'Nguyen van nam',
                          time: '12:00 14/06/2022',
                          hasImage: false,
                          image:
                              'https://tinypng.com/images/social/website.jpg',
                          question: 'Khối bát diện đều có 6 đỉnh, 12 cạnh',
                          type: false,
                          report: () {
                            showPlatformDialog(
                              context: context,
                              builder: (context) => BasicDialogAlert(
                                title: Text("Báo cáo câu trả lời"),
                                content: Container(
                                  height: 250,
                                  width: 200,
                                  child: SingleChildScrollView(

                                    child: FilterList(
                                      color: Colors.white,
                                      title: '',
                                      column: 1,
                                      list: report,
                                      space: 5.5,
                                    ),
                                  ),
                                ),
                                actions: <Widget>[
                                  BasicDialogAction(
                                    title: Text(
                                      "Report",
                                      style: StyleApp.textStyle500(
                                          color: Colors.red),
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
                height: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}
