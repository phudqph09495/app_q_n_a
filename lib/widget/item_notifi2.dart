import 'package:app_q_n_a/item/load_image.dart';
import 'package:flutter/material.dart';
import 'package:app_q_n_a/styles/init_style.dart';

class ItemNotifi2 extends StatelessWidget {
  Function()? onTap;
  String avatar;
  String title;
  String time;
  String sub;

  ItemNotifi2(
      {required this.avatar,
      required this.sub,
      this.onTap,
      required this.time,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            const SizedBox(height: 5),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 4),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: LoadImage(
                          //   url: avatar,
                          //   height: 120,
                          //   width: 90,
                          // )),
                          url: avatar,
                          height: 75,
                          width: 55,
                          fit: BoxFit.cover)),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(left: 15),
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
                          sub,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: StyleApp.textStyle400(
                              fontSize: 12, color: ColorApp.black),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          time,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: StyleApp.textStyle400(
                              fontSize: 12, color: ColorApp.grey82),
                        ),
                        const SizedBox(height: 5),
                      ],
                    ),
                  ),
                )
              ],
            ),
            const Divider(color: ColorApp.greyBD),
          ],
        ),
      ),
    );
  }
}
