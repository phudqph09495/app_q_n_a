import 'package:app_q_n_a/item/button.dart';
import 'package:app_q_n_a/item/load_image.dart';
import 'package:app_q_n_a/styles/init_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';

Widget QuestionTile({
  required String mon,
  required int deadline,
  required int lop,
  required int money,
  required int createTime,
  required String question,
  String? avatar,
  Function()? ontap,
  bool first = false,
  bool attach = false,
  int? attachCount,
}) {
  return InkWell(
    onTap: ontap,
    child: Card(
      color: ColorApp.whiteF7,
      child: Container(
        decoration: BoxDecoration(
          // color: Colors.grey.withOpacity(0.3),

          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '$mon - Lớp $lop - $moneyđ - ${formatHHMMSS((DateTime.now().millisecondsSinceEpoch / 1000).round() - createTime)}',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: StyleApp.textStyle700(
                          fontSize: 16, color: ColorApp.black),
                    ),
                  ),
                  attach
                      ? Row(
                          children: [
                            const Icon(Icons.attach_file_rounded),
                            Text('$attachCount ')
                          ],
                        )
                      : const SizedBox(),
                  first
                      ? Container(
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10),
                            border:
                                Border.all(color: ColorApp.black, width: 0.5),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 3, vertical: 2),
                          child: const Text(
                            ' Lần đầu hỏi',
                            style: TextStyle(color: ColorApp.black),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
              CountdownTimer(
                endTime: deadline * 1000,
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
                question,
                trimLines: 2,
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
                    child:
                    LoadImage(url:'$avatar',height: 40,width: 40,)
                  ),
                  Button1(
                    height: 30,
                    colorButton: Colors.white,
                    textColor: ColorApp.black,
                    border: Border.all(color: ColorApp.orangeF2, width: 0.5),
                    textButton: 'Trả lời',
                    ontap: ontap,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

String formatHHMMSS(int seconds) {
  if (seconds != null && seconds != 0) {
    int hours = (seconds / 3600).truncate();
    seconds = (seconds % 3600).truncate();
    int minutes = (seconds / 60).truncate();

    String hoursStr = (hours).toString().padLeft(2, '0');
    String minutesStr = (minutes).toString().padLeft(2, '0');

    if (minutes == 0) {
      return "Vài giây trước";
    }
    if (hours == 0) {
      return "$minutesStr phút trước";
    }
    return "$hoursStr giờ $minutesStr phút trước";
  } else {
    return "";
  }
}
