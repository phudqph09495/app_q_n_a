import 'dart:io';

import 'package:app_q_n_a/Screens/login.dart';
import 'package:app_q_n_a/item/button.dart';
import 'package:app_q_n_a/item/input/text_filed.dart';
import 'package:app_q_n_a/item/input_text.dart';
import 'package:app_q_n_a/styles/colors.dart';
import 'package:app_q_n_a/styles/init_style.dart';
import 'package:app_q_n_a/validator.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class ForgotPass extends StatefulWidget {
  @override
  State<ForgotPass> createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  TextEditingController forgot = TextEditingController();
  final keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorApp.whiteF0,
        title: Text(
          'Quên mật khẩu',
          style: StyleApp.textStyle700(fontSize: 18),
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
        padding: EdgeInsets.all(8.0),
        child: Form(
          key: keyForm,
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              InputText1(
                label: "Nhập email đăng ký",
                controller: forgot,
                borderColor: ColorApp.main.withOpacity(0.2),
                obscureText: false,
                hasPass: false,
                radius: 10,
                width: double.infinity,
                validator: (val) {
                  return ValidatorApp.checkEmail(text: val);
                },
              ),
              SizedBox(
                height: 10,
              ),
              Button1(
                  colorButton: ColorApp.orangeF2,
                  textColor: ColorApp.whiteF0,
                  radius: 30,
                  fontSize: 18,
                  style: false,
                  border: Border.all(color: ColorApp.orangeF2),
                  textButton: 'Khôi phục mật khẩu',
                  ontap: () {
                    if (keyForm.currentState!.validate()) {
                      Toast.show(
                          "Yêu cầu cấp lại mật khẩu của bạn đã được phê duyệt",
                          duration: 3,
                          gravity: Toast.bottom);
                      forgot.clear();
                      Future.delayed(Duration(milliseconds: 3500), () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      });
                    } else {
                      Toast.show("Hãy nhập email hoặc tên đăng nhập",
                          duration: 3, gravity: Toast.bottom);
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
