import 'package:app_q_n_a/item/button.dart';
import 'package:app_q_n_a/styles/init_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';

Widget QuestionTile(
    {required String mon,
    String? username,
    required String deadline,
    required int lop,
    required int money,
    required String time,
    required String question,
    required String avatar,
    Function()? ontap,
    bool first = false,
    bool attach = false,
    int? attachCount}) {
  return Card(
    child: InkWell(
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
                    '$mon - lớp $lop - $moneyđ - $time trước',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: StyleApp.textStyle700(fontSize: 16),
                  ),
                ),
                attach
                    ? Row(
                        children: [
                          Icon(Icons.attach_file_rounded),
                          Text('$attachCount ')
                        ],
                      )
                    : const SizedBox(),
                first
                    ? Container(
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(2)),
                        padding:
                            EdgeInsets.symmetric(horizontal: 3, vertical: 2),
                        child: const Text(
                          ' Lần đầu hỏi',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
            Text(
              deadline,
              style: TextStyle(color: Colors.black.withOpacity(0.3)),
            ),
            SizedBox(
              height: 5,
            ),
            ReadMoreText(
              question,
              trimLines: 2,
              colorClickableText: Colors.pink,
              trimMode: TrimMode.Line,
              style: StyleApp.textStyle500(),
              trimCollapsedText: 'Xem thêm',
              trimExpandedText: 'Thu nhỏ',
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image(
                    image: NetworkImage(avatar),
                    height: 40,
                    width: 40,
                  ),
                ),
                Button1(
                  height: 30,
                    width: 70,
                    colorButton: Colors.white,
                    textColor: Colors.blue,
                    textButton: 'Trả lời',
                    ontap: ontap,
                    border: Border.all(color: Colors.blue))
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
