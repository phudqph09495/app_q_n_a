import 'dart:io';

import 'package:app_q_n_a/Screens/login.dart';
import 'package:app_q_n_a/item/button.dart';
import 'package:app_q_n_a/item/input_text.dart';
import 'package:app_q_n_a/styles/colors.dart';
import 'package:app_q_n_a/styles/init_style.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class ForgotPass extends StatefulWidget {
  @override
  State<ForgotPass> createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  TextEditingController forgot = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorApp.whiteF0,
        title: Text('Quên mật khẩu',style: StyleApp.textStyle500(fontSize: 16),),
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
        padding: EdgeInsets.all(8.0),
          child: Column(
          children: [
            InputText(

                hasPass: false,
                hint: 'Nhập Email đăng ký hoặc tên đăng nhập',
                controller: forgot),
            SizedBox(
              height: 8,
            ),
            Button1(radius: 10,
                colorButton: ColorApp.orangeF2,
                textColor: Colors.black,
                textButton: 'Khôi phục mật khẩu',
                ontap: () {

                 if(forgot.text!=''){
                   Toast.show("Yêu cầu cấp lại mật khẩu của bạn đã được phê duyệt", duration: 3, gravity:  Toast.bottom);

                   Future.delayed(Duration(milliseconds: 3500), () {
                     Navigator.push(
                         context, MaterialPageRoute(builder: (context) => LoginScreen()));
                   });
                 }else{
                   Toast.show("Hãy nhập email hoặc tên đăng nhập", duration: 3, gravity:  Toast.bottom);

                 }
                })
          ],
        ),
      ),
    );
  }
}
