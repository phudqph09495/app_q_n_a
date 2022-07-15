import 'package:app_q_n_a/styles/init_style.dart';
import 'package:flutter/material.dart';
import 'widgetIcons.dart';

Widget getAppBottomView({
  required BuildContext context,
  String? id, String? name}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    child: Row(
      children: [
        getProfileView(context),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Họ và tên: $name',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: StyleApp.textStyle700(
                      color: ColorApp.black, fontSize: 16),
                ),
                Text(
                  'Id thành viên: $id',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: StyleApp.textStyle700(
                      color: ColorApp.black, fontSize: 16),
                ),
                Text(
                  'Điểm',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: StyleApp.textStyle700(
                      color: ColorApp.black, fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
