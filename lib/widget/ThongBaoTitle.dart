import 'package:flutter/material.dart';
import 'package:app_q_n_a/styles/init_style.dart';

Widget ThongBaoTitle({
  required String skTextTren,
  required String thoiGian,
  required String SkTextDuoi,
  required String Avatar,
  Function()? ontap,
}) {
  return Container(
    child: Card(
      child: InkWell(
        onTap: ontap,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image(
                image: NetworkImage(Avatar),
                height: 80,
                width: 80,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        skTextTren,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: StyleApp.textStyle700(
                            fontSize: 14, color: ColorApp.orangeF8),
                      ),
                      Text(
                        thoiGian,
                        overflow: TextOverflow.ellipsis,
                        style: StyleApp.textStyle700(
                            fontSize: 14, color: ColorApp.black),
                      ),
                      Text(
                        SkTextDuoi,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: StyleApp.textStyle700(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
