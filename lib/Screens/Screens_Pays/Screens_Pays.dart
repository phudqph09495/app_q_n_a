import 'package:app_q_n_a/Screens/Screens_Pays/ScreensNapTien.dart';
import 'package:app_q_n_a/Screens/Screens_Pays/ScreensViPays.dart';
import 'package:app_q_n_a/Screens/Screens_Pays/qrPays.dart';
import 'package:flutter/material.dart';
import '../../config/next_page.dart';
import '../../styles/colors.dart';
import '../../styles/styles.dart';

class ScreensPays extends StatefulWidget {
  int? user_id;
  int? limit;
  int? page;
  int? is_week;
  int? is_day;
  int? is_month;
  int? is_last_month;
  DateTime? start_time;
  DateTime? end_time;
  @override
  State<ScreensPays> createState() => _ScreensPaysState();
}

class _ScreensPaysState extends State<ScreensPays> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListTile(
            title: Text(
              "Nạp Tiền",
              style: StyleApp.textStyle500(color: ColorApp.black),
            ),
            onTap: () {
              Navigator.pop(context);
              PageNavigator.next(context: context, page: NapTien());
            },
          ),
          ListTile(
            title: Text(
              "Ví Tiền",
              style: StyleApp.textStyle500(color: ColorApp.black),
            ),
            onTap: () {
              Navigator.pop(context);
              PageNavigator.next(context: context, page: ViTien());
            },
          ),
        ],
      ),
    );
  }
}
