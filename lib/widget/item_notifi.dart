import 'package:app_q_n_a/item/load_image.dart';
import 'package:flutter/material.dart';
import 'package:app_q_n_a/styles/init_style.dart';

class ItemNotifi extends StatelessWidget {
  Function()? onTap;
  String avatar;
  String title;
  String time;
  String sub;

  ItemNotifi({required this.avatar, required this.sub, this.onTap, required this.time, required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          const SizedBox(height: 5),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: LoadImage(
                      url: avatar, height: 50, width: 80, fit: BoxFit.cover)),
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
                            fontSize: 16, color: ColorApp.main),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        time,
                        overflow: TextOverflow.ellipsis,
                        style: StyleApp.textStyle400(
                            fontSize: 12, color: ColorApp.grey82),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        sub,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: StyleApp.textStyle400(
                            fontSize: 12, color: ColorApp.grey82),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          const Divider(color: ColorApp.black),
        ],
      ),
    );
  }
}

