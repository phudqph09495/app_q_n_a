import 'dart:io';

import 'package:app_q_n_a/Screens/forgot_password.dart';
import 'package:app_q_n_a/Screens/registration.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../item/input_text.dart';
import '../item/button.dart';
import '../styles/init_style.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Đăng nhập",
          style: StyleApp.textStyle700(fontSize: 18),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Platform.isAndroid ? Icons.back_hand : Icons.arrow_back_ios,
            color: ColorApp.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Đăng nhập ',
              style: StyleApp.textStyle700(fontSize: 30),
            ),
            const SizedBox(
              height: 20,
            ),
            InputText(
                hasPass: false,
                hint: 'Tên đăng nhập',
                controller: username,
                maxline: 1),
            const SizedBox(
              height: 20,
            ),
            InputText(
                hasPass: true,
                hint: 'Mật khẩu',
                controller: password,
                maxline: 1),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgotPass()));
                    },
                    child: const Text(
                      'Quên mật khẩu',
                      style: StyleApp.textStyle700(),
                    )),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Button1(
                textColor: Colors.white,
                textButton: 'Đăng nhập',
                colorButton: Colors.blue,
                radius: 10),
            const SizedBox(
              height: 30,
            ),
            Button1(
                icon: true,
                IconData: 'images/Google.png',
                textColor: Colors.black,
                textButton: 'Đăng nhập với Google',
                colorButton: Colors.white,
                border: Border.all(color: Colors.black),
                radius: 10),
            const SizedBox(
              height: 10,
            ),
            Button1(
                icon: true,
                IconData: 'images/Facebook.png',
                textColor: Colors.black,
                textButton: 'Đăng nhập với Facebook',
                border: Border.all(color: Colors.black),
                colorButton: Colors.white,
                radius: 10),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Nếu chưa có tài khoản'),
                FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegistrationScreen()));
                    },
                    child: Text(
                      'Đăng ký ngay',
                      style: TextStyle(color: Colors.green),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
