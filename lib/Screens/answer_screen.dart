import 'dart:io';

import 'package:app_q_n_a/item/grid_view.dart';
import 'package:app_q_n_a/item/input_text.dart';
import 'package:app_q_n_a/item/item_answer/item_answer1.dart';
import 'package:app_q_n_a/item/item_answer/item_answer2.dart';
import 'package:app_q_n_a/item/radio_list_tile.dart';
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
import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:toast/toast.dart';
import 'package:time_elapsed/time_elapsed.dart';



class AnswerScreen extends StatefulWidget {
  @override
  State<AnswerScreen> createState() => _AnswerScreenState();
}

class _AnswerScreenState extends State<AnswerScreen> {
  var groupValue = 0;
  int money = 50;
  bool timing = true;
  DateTime deadline = DateTime.parse("2022-07-05 12:00:00.0000");
  int lop = 12;
  String mon = 'Toán';
  int value = 0;


  late int value2;

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
            border: Border.all(color: ColorApp.orangeF2, width: 0.5),
            textButton: 'Viết câu trả lời',
            ontap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Add_Answer_Screen()));
            }),
      ),
      backgroundColor: ColorApp.whiteF0,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorApp.whiteF0,
        title: Text(
          'Môn $mon- Lớp $lop- $money đ',
          style: StyleApp.textStyle700(
            fontSize: 18,
          ),
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
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 5,
              ),
              QuestionCard(
                endTime: deadline.millisecondsSinceEpoch,
                avatar: '',
                ques: 'Đếm số đỉnh, số cạnh của khối bát diện đều.',
                user: 'tran thanh',
                time: '11:07 7/6/2022',
                imageques: 'https://img.loigiaihay.com/picture/2021/1116/1.png',
              ),
              const SizedBox(
                height: 10,
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  value2 = index;
                  return Column(
                    children: [
                      AnswerCard(
                        status: timing ? index : 3,
                        value: value2,
                        groupValue: value,
                        title:
                             Text(
                                'Trả tiền',
                                style: StyleApp.textStyle500(fontSize: 14),
                              ),
                        onchanged: (val) {
                          showPlatformDialog(
                            context: context,
                            builder: (context) => BasicDialogAlert(
                              title: Text("Thanh toán"),
                              content:
                                  Text("Xác nhận thanh toán cho người trả lời"),
                              actions: <Widget>[
                                BasicDialogAction(
                                  title: Text("Từ chối"),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                BasicDialogAction(
                                  title: Text("Đồng ý"),
                                  onPressed: () {
                                    setState(() {
                                      Toast.show(
                                          "Thanh toán thành công",
                                          duration: 1,
                                          gravity: Toast.bottom);

                                      Future.delayed(Duration(milliseconds: 1500), () {
                                        Navigator.pop(context);
                                      });
                                      value = val;

                                    });
                                  },
                                ),
                              ],
                            ),
                          );

                        },
                        //trạng thái của câu trả lời
                        //0: chưa đăng nhập
                        //1: không phải chủ câu hỏi
                        //2: là chủ câu hỏi

                        time: '12:00 14/06/2022',
                        user: 'Nguyen van nam',
                        avatar: '',
                        answer: 'Khối bát diện đều có 6 đỉnh, 12 cạnh',
                      )
                    ],
                  );
                },
              ),
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
