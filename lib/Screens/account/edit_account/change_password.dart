import 'dart:io';
import 'package:app_q_n_a/styles/colors.dart';
import 'package:app_q_n_a/styles/styles.dart';
import 'package:flutter/material.dart';

import '../../../item/button.dart';
import '../../../item/input_text.dart';

class ChangePass extends StatefulWidget {
  const ChangePass({Key? key}) : super(key: key);

  @override
  State<ChangePass> createState() => _ChangePassState();
}

class _ChangePassState extends State<ChangePass> {
  TextEditingController changePass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.whiteF0,
      appBar: AppBar(
        backgroundColor: ColorApp.whiteF0,
        title: Text(
          'Đổi mật khẩu',
          style: StyleApp.textStyle700(fontSize: 18, color: ColorApp.black),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
            color: ColorApp.black,
          ),
        ),
      ),
      body: Padding(
        padding:const EdgeInsets.all(10.0),
        child: Column(
          children: [
            InputText(
              hint: 'Mật khẩu cũ',
              controller: changePass,
            ),
            const SizedBox(
              height: 10,
            ),
            InputText(

              hint: 'Mật khẩu mới',
              controller: changePass,
            ),
            const SizedBox(
              height: 10,
            ),
            InputText(

              hint: 'Nhập lại mật khẩu mới',
              controller: changePass,
            ),
            const SizedBox(
              height: 10,
            ),
            Button1(
              colorButton:const Color(0xffB0E0E6),
              textColor: ColorApp.whiteF0,
              border: Border.all(color: ColorApp.black00),
              textButton: 'Đổi mật khẩu',
              ontap: null,
            ),
          ],
        ),
      ),
    );
  }
}
