import 'package:app_q_n_a/item/load_image.dart';
import 'package:flutter/material.dart';
import 'package:app_q_n_a/styles/init_style.dart';

class QuestionWidget extends StatelessWidget {
  Function()? onTap;
  String title;
  String time;
  String avatar;

  QuestionWidget(
      {this.onTap,
      required this.avatar,
      required this.time,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorApp.whiteF7,
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            const SizedBox(height: 5),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: StyleApp.textStyle700(
                              fontSize: 16, color: ColorApp.black),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          time,
                          overflow: TextOverflow.ellipsis,
                          style: StyleApp.textStyle400(
                              fontSize: 12, color: ColorApp.grey82),
                        ),
                        const SizedBox(height: 5),
                        ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: LoadImage(
                                url: avatar,
                                height: 120,
                                width: 120,
                                fit: BoxFit.cover)),
                      ],
                    ),
                  ),
                )
              ],
            ),
            const Divider(color: ColorApp.black),
          ],
        ),
      ),
    );
  }
}
