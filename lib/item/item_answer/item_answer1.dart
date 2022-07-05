import 'package:app_q_n_a/Screens/Screens_TaiKhoan/question2_saved.dart';
import 'package:app_q_n_a/Screens/Screens_TaiKhoan/question_saved.dart';
import 'package:app_q_n_a/Screens/comment.dart';
import 'package:app_q_n_a/config/next_page.dart';
import 'package:app_q_n_a/item/button.dart';
import 'package:app_q_n_a/item/input_text.dart';
import 'package:app_q_n_a/item/load_image.dart';
import 'package:app_q_n_a/styles/colors.dart';
import 'package:app_q_n_a/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:readmore/readmore.dart';
import 'package:toast/toast.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:app_q_n_a/Screens/answer_screen.dart' as AnswerScreen;

class QuestionCard extends StatefulWidget {
  String avatar;
  String user;
  String time;
  String ques;
  int endTime;
  String imageques;
  QuestionCard(
      {required this.avatar,
      required this.ques,
      required this.user,
      required this.time,
      this.imageques = '',
      required this.endTime});

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorApp.whiteF7,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: LoadImage(
                      url: widget.avatar,
                      height: 40,
                      width: 40,
                    )),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.user}',
                      style: StyleApp.textStyle500(),
                    ),
                    Text('${widget.time}', style: StyleApp.textStyle500())
                  ],
                ),
                SizedBox(
                  width: 110,
                ),
                Button1(
                  ontap: () {
                    Toast.show("Lưu thành công", gravity: Toast.bottom);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => QuestionSavedSS()));
                  },
                  colorButton: ColorApp.blue6D,
                  textColor: ColorApp.whiteF0,
                  textButton: 'Lưu',
                  height: 35,
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            CountdownTimer(
              endTime: widget.endTime,
              widgetBuilder: (_, CurrentRemainingTime? time) {
                if (time == null) {
                  return Text(
                    'Đã hết giờ',
                    style: StyleApp.textStyle500(color: ColorApp.red),
                  );
                }
                return Row(
                  children: [
                    Text('Còn ',
                        style: StyleApp.textStyle500(color: ColorApp.blue6D)),
                    (time.days != null)
                        ? Text('${time.days} ngày',
                            style:
                                StyleApp.textStyle500(color: ColorApp.blue6D))
                        : Text(''),
                    (time.hours != null)
                        ? Text(' ${time.hours} giờ',
                            style:
                                StyleApp.textStyle500(color: ColorApp.blue6D))
                        : Text(''),
                    (time.min != null)
                        ? Text(' ${time.min} phút',
                            style:
                                StyleApp.textStyle500(color: ColorApp.blue6D))
                        : Text(''),
                    (time.sec != null)
                        ? Text(' ${time.sec} giây',
                            style:
                                StyleApp.textStyle500(color: ColorApp.blue6D))
                        : Text(''),
                  ],
                );
              },
            ),
            ReadMoreText(
              widget.ques,
              trimLines: 2,
              colorClickableText: ColorApp.orangeF01,
              trimMode: TrimMode.Line,
              trimCollapsedText: 'Hiện thêm',
              trimExpandedText: 'Thu gọn',
              style: StyleApp.textStyle500(fontSize: 16, color: ColorApp.black),
            ),
            (widget.imageques != '')
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image(image: NetworkImage(widget.imageques)))
                : Container(),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
