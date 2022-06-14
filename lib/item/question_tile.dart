import 'package:flutter/material.dart';
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
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  '$mon - lớp $lop - $moneyđ - $time trước',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                attach
                    ? Row(
                        children: [
                          Icon(Icons.attach_file_rounded),
                          Text('$attachCount ')
                        ],
                      )
                    : Text(''),
                first
                    ? Container(
                        child: Text(
                          ' Lần đầu hỏi',
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.green,
                      )
                    : Text('')
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
              trimLines: 1,
              colorClickableText: Colors.pink,
              trimMode: TrimMode.Line,
              trimCollapsedText: 'Show more',
              trimExpandedText: 'Show less',
            ),
            SizedBox(
              height: 10,
            ),
            Image(
              image: NetworkImage(avatar),
              height: 40,
              width: 40,
            ),
          ],
        ),
      ),
    ),
  );
}
