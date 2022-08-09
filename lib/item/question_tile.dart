import 'package:app_q_n_a/config/const.dart';
import 'package:app_q_n_a/config/next_page.dart';
import 'package:app_q_n_a/item/button.dart';
import 'package:app_q_n_a/item/load_image.dart';
import 'package:app_q_n_a/styles/init_style.dart';
import 'package:app_q_n_a/widget/items/dia_log_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';
import 'package:app_q_n_a/Screens/Screens_TaiKhoan/body_product.dart' as Body;
import '../Screens/answer_screen.dart';
import '../models/model_question.dart';

Widget QuestionTile(
  BuildContext context, {
  required ModelQuestion modelQuestion,
}) {
  String createdAt =
      Const.checkTime(Const.convertNumber(modelQuestion.createdAt).round());

  String title = '${modelQuestion.subjectName ?? 'Lĩnh vực khác'}'
      ' - ${(modelQuestion.className)??'Lớp ${(int.parse(modelQuestion.classId??'0')-2)}'}'
      ' - ${Const.convertPrice(modelQuestion.priceGift)} đ'
      '${createdAt == "" ? "" : " - $createdAt"}';

  return InkWell(
    onTap: () {
      PageNavigator.next(
        context: context,
        page: AnswerScreen(
          modelQuestion: modelQuestion,
        ),
      );
    },
    child: Card(
      color: ColorApp.whiteF7,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          // color: Colors.grey.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: StyleApp.textStyle700(
                        fontSize: 16, color: ColorApp.black),
                  ),
                ),
                modelQuestion.countImages != '0'
                    ? Row(
                        children: [
                          const Icon(Icons.attach_file_rounded),
                          Text(modelQuestion.countImages ?? "0")
                        ],
                      )
                    : const SizedBox(),
                (modelQuestion.userCountQuestion == '1')
                    ? Container(
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: ColorApp.black, width: 0.5),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 2),
                        margin: const EdgeInsets.only(left: 5),
                        child: const Text(
                          'Lần đầu hỏi',
                          style: TextStyle(color: ColorApp.whiteF0),
                        ),
                      )
                    : SizedBox()
              ],
            ),
            CountdownTimer(
              endTime:
                  Const.convertNumber(modelQuestion.deadline).round() * 1000,
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
                        style: StyleApp.textStyle500(
                            color: ColorApp.blue6D.withOpacity(0.5))),
                    (time.days != null)
                        ? Text('${time.days} ngày ',
                            style: StyleApp.textStyle500(
                                color: ColorApp.blue6D.withOpacity(0.5)))
                        : Text(''),
                    (time.hours != null)
                        ? Text('${time.hours} giờ ',
                            style: StyleApp.textStyle500(
                                color: ColorApp.blue6D.withOpacity(0.5)))
                        : Text(''),
                    (time.min != null)
                        ? Text('${time.min} phút ',
                            style: StyleApp.textStyle500(
                                color: ColorApp.blue6D.withOpacity(0.5)))
                        : Text(''),
                    (time.sec != null)
                        ? Text('${time.sec} giây',
                            style: StyleApp.textStyle500(
                                color: ColorApp.blue6D.withOpacity(0.5)))
                        : Text(''),
                  ],
                );
              },
            ),
            const SizedBox(
              height: 5,
            ),
            ReadMoreText(
              modelQuestion.question ?? "Đang cập nhật",
              trimLines: 3,
              colorClickableText: ColorApp.orangeF0,
              trimMode: TrimMode.Line,
              style: StyleApp.textStyle500(color: ColorApp.black),
              trimCollapsedText: 'Xem thêm',
              trimExpandedText: 'Thu nhỏ',
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: LoadImage(
                      url: '',
                      height: 40,
                      width: 40,
                    )),
                Button1(
                  height: 30,
                  colorButton: Colors.white,
                  textColor: ColorApp.black,
                  border: Border.all(color: ColorApp.orangeF2, width: 0.5),
                  textButton: 'Trả lời',
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AnswerScreen(
                                  modelQuestion: modelQuestion,
                                )));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
