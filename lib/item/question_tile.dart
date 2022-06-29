import 'package:app_q_n_a/item/button.dart';
import 'package:app_q_n_a/item/load_image.dart';
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
                    '$mon - lớp $lop - $moneyđ - $time trước',
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
                          border: Border.all(color: ColorApp.black,width: 0.5),
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
            Text(
              deadline,
              style:const TextStyle(color: ColorApp.grey82),
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
                  border: Border.all(color: ColorApp.orangeF2,width: 0.5),
                  textButton: 'Trả lời',
                  ontap: ontap,
                ),
              ],
            ),

          ],
        ),
      ),
    ),
  );
}
