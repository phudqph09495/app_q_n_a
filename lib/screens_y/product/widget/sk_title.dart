import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:app_q_n_a/styles/init_style.dart';

Widget SkquestionTile({
  required String skTextTren,
  required String thoiGian,
  required String SkTextDuoi,
  required String Avatar,
  Function()? ontap,
}) {
  return Card(
    child: InkWell(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: NetworkImage(Avatar),
              height: 80,
              width: 80,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    skTextTren,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: StyleApp.textStyle700(
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            Text(
              thoiGian,
              overflow: TextOverflow.ellipsis,
              style: StyleApp.textStyle700(
                fontSize: 14,
              ),
            ),
            Text(
              SkTextDuoi,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              style: StyleApp.textStyle700(
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
