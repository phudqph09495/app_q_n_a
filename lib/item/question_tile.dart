import 'package:app_q_n_a/Screens/Screens_TaiKhoan/ThongKe/tab/answer_screen_tab.dart';
import 'package:app_q_n_a/config/const.dart';
import 'package:app_q_n_a/config/next_page.dart';
import 'package:app_q_n_a/item/button.dart';
import 'package:app_q_n_a/item/item_user.dart';
import 'package:app_q_n_a/item/load_image.dart';
import 'package:app_q_n_a/styles/init_style.dart';
import 'package:app_q_n_a/widget/items/dia_log_item.dart';
import 'package:app_q_n_a/widget/items/item_count_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';

import '../models/model_question.dart';
import 'package:app_q_n_a/Screens/home.dart' as home;

Widget QuestionTile(
  BuildContext context, {
  required ModelQuestion modelQuestion,
}) {
  String createdAt =
      Const.checkTime(Const.convertNumber(modelQuestion.createdAt).round());
  String title =
      '#${modelQuestion.id}. ${modelQuestion.subjectName ?? 'Lĩnh vực khác'}'
      '${modelQuestion.className == null ? "" : " - ${modelQuestion.className}"}'
      '${createdAt == "" ? "" : " - $createdAt"}';

  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>AnswerScreenTab(quesID: int.parse(modelQuestion.id??'0'))
          //     AnswerScreen(
          //   modelQuestion: modelQuestion,
          // ),
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
              children: [
                Expanded(
                  child: ItemUser(
                    username: modelQuestion.username ?? "",
                    time: modelQuestion.createdAt ?? "0",
                    image:
                        "${modelQuestion.avatarPath}${modelQuestion.avatarName}",
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
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
                    : const SizedBox()
              ],
            ),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: RichText(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: title,
                          style: StyleApp.textStyle700(
                              fontSize: 16, color: ColorApp.black),
                        ),
                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.attach_file_rounded,
                                size: 17,
                              ),
                              Text(
                                (modelQuestion.countImages ?? '0'),
                                style: StyleApp.textStyle700(
                                    fontSize: 16, color: ColorApp.black),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                     Container(
                        margin: const EdgeInsets.only(left: 10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 2),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border:
                                Border.all(color: Colors.green, width: 0.5)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Const.convertPrice(modelQuestion.priceGift),
                              style: StyleApp.textStyle500(color: Colors.green),
                            ),

                            ShaderMask(
                              blendMode: BlendMode.srcIn,
                              shaderCallback: (Rect bounds) => RadialGradient(
                                center: Alignment.topCenter,

                                stops: [0.7,1 ],
                                colors: [
                                  ColorApp.whiteF0,
                                  Colors.yellow,
                                ],
                              ).createShader(bounds),
                              child: Icon(
                                Icons.star,
                                size: 17,
                              ),
                            ),
                          ],
                        ),
                      ),
              ],
            ),
            ItemCountDown(
                time:
                    Const.convertNumber(modelQuestion.deadline).round() * 1000),
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
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${modelQuestion.username}: ',
                          style: StyleApp.textStyle700(color: ColorApp.black),
                        ),
                        Expanded(
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.start,
                            spacing: 5,
                            children: [
                              Text("${Const.convertNumber(modelQuestion.userCountQuestion).round()} (câu hỏi)."),
                              Text("${Const.convertNumber(modelQuestion.count_gift_to_user).round()} (trả thưởng)."),
                              Text("${Const.convertNumber(modelQuestion.userCountAnswer).round()} (trả lời)."),
                              Text("${Const.convertNumber(modelQuestion.userCountMyGift).round()} (nhận thưởng)."),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
                const SizedBox(width: 10),
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
                        builder: (context) =>AnswerScreenTab(quesID: int.parse(modelQuestion.id??'0'))
                        //     AnswerScreen(
                        //   modelQuestion: modelQuestion,
                        // ),
                      ),
                    );
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
