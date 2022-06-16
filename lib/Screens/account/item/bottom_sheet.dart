import 'package:app_q_n_a/Screens/account/edit_account/edit_profile.dart';
import 'package:app_q_n_a/config/next_page.dart';
import 'package:app_q_n_a/styles/init_style.dart';
import 'package:flutter/material.dart';

class BottomSheetAccount extends StatelessWidget {
  const BottomSheetAccount({Key? key}) : super(key: key);

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
              "Thay ảnh đại diện",
              style: StyleApp.textStyle500(),
            ),
          ),
          ListTile(
            onTap: (){
              Navigator.pop(context);
              PageNavigator.next(context: context, page: EditProfile());

            },
            title: Text(
              "Thông tin chung",
              style: StyleApp.textStyle500(),
            ),
          ),
          ListTile(
            title: Text(
              "Thay đổi mật khẩu",
              style: StyleApp.textStyle500(),
            ),
          ),
        ],
      ),
    );
  }
}