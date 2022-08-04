import 'dart:io';

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
import 'package:image_picker/image_picker.dart';
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
  Widget image;
  String? countAns;
  List<dynamic>? imageFileList;
  bool save = true;
  QuestionCard(
      {required this.avatar,
      required this.ques,
      required this.user,
      required this.time,
      this.imageques = '',
      required this.image,
      this.imageFileList,
      this.countAns,
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
                const SizedBox(
                  width: 90,
                ),
                Button1(
                  ontap: () {
                    setState(() {
                      widget.save = !widget.save;
                    });
                    Toast.show(
                        widget.save ? "Bỏ lưu thành công" : "Lưu thành công",
                        gravity: Toast.bottom);

                  },
                  colorButton:
                      widget.save ? ColorApp.blue6D : ColorApp.orangeF01,
                  textColor: widget.save ? ColorApp.whiteF0 : Colors.black,
                  textButton: widget.save ? 'Lưu' : 'Bỏ lưu',
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
                        ? Text('${time.days} ngày ',
                            style:
                                StyleApp.textStyle500(color: ColorApp.blue6D))
                        : Text(''),
                    (time.hours != null)
                        ? Text('${time.hours} giờ ',
                            style:
                                StyleApp.textStyle500(color: ColorApp.blue6D))
                        : Text(''),
                    (time.min != null)
                        ? Text('${time.min} phút ',
                            style:
                                StyleApp.textStyle500(color: ColorApp.blue6D))
                        : Text(''),
                    (time.sec != null)
                        ? Text('${time.sec} giây',
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
            widget.imageFileList!.isNotEmpty ? widget.image : SizedBox(),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              child: Text(
                'Có ${widget.countAns} câu trả lời',
                style: StyleApp.textStyle500(color: ColorApp.blue6D),
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// GridView.builder(
// itemCount: widget.imageFileList!.length,
// gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// crossAxisCount: 3),
// shrinkWrap: true,
// itemBuilder: (BuildContext context, int index) {
// return LoadImage(url: "http://hoidap.nanoweb.vn/static${widget.imageFileList?[index]}");
// // return Image.file(
// //   File(widget.imageFileList![index].path),
// // );
// })
