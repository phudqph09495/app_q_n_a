import 'package:app_q_n_a/Screens/Screens_Pays/ScreensViPays.dart';
import 'package:app_q_n_a/Screens/Screens_Pays/qrPays.dart';
import 'package:flutter/material.dart';
import '../../config/next_page.dart';
import '../../styles/colors.dart';
import '../../styles/styles.dart';
class ScreensPays extends StatelessWidget {
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
              "Thanh Toán",
              style: StyleApp.textStyle500(color: ColorApp.black),
            ),
            onTap: () {
              Navigator.pop(context);
              PageNavigator.next(context: context, page: QrScans());
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
