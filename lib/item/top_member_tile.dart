import 'package:app_q_n_a/styles/init_style.dart';
import 'package:flutter/material.dart';

Widget TopMemTile({
  required String avt,
  required String name,
  required int score,
  required Function() ontap,
}) {
  return Card(
    child: InkWell(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image(
              image: NetworkImage(avt),
              height: 50,
              width: 50,
            ),SizedBox(width: 20,),
            Column(
              children: [
                Text(
                  name,
                  style: StyleApp.textStyle700(fontSize: 16),
                ),
                Text('Điểm: $score',style: StyleApp.textStyle400(color: Colors.red),)
              ],
            )
          ],
        ),
      ),
    ),
  );
}
