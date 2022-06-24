import 'package:app_q_n_a/styles/init_style.dart';
import 'package:flutter/material.dart';

import '../../widget/widget_info/widgetIcons.dart';

Widget GetNotification(BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    child: AppBar(
      backgroundColor: ColorApp.whiteF0,
      title: TabBar(
        labelColor: ColorApp.black,
        unselectedLabelStyle:
        StyleApp.textStyle500(color: ColorApp.grey82),
        labelStyle: StyleApp.textStyle500(),
        indicatorColor: ColorApp.orangeF01,
        unselectedLabelColor: ColorApp.grey82,
        tabs:   [
          Row (children: [Icon(null), SizedBox(width:5), Text("Sự kiện nóng")]),
          Row (children: [Icon(null), SizedBox(width:5), Text("Thông báo")]),
          // Tab(
          //   child: Text(
          //     "Sự kiện nóng",
          //     style: TextStyle(color: ColorApp.black),
          //   ),
          // ),
          // Tab(
          //   child: Text(
          //     "Thông báo",
          //     style: TextStyle(color: ColorApp.black),
          //   ),
          // ),
        ],
      ),
    ),
  );
}
