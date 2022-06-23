import 'dart:io';

import 'package:app_q_n_a/Screens/forgot_password.dart';
import 'package:app_q_n_a/Screens/registration.dart';
import 'package:app_q_n_a/Screens/screen_home.dart';
import 'package:app_q_n_a/item/load_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../item/input_text.dart';
import '../item/button.dart';
import '../styles/init_style.dart';
import 'package:toast/toast.dart';

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
    ToastContext().init(context);
    return Scaffold(
      backgroundColor: ColorApp.whiteF7,
      resizeToAvoidBottomInset: false,
      // appBar: AppBar(
      //   backgroundColor: ColorApp.whiteF0,
      //   title: Text(
      //     "Đăng nhập",
      //     style: StyleApp.textStyle700(fontSize: 18),
      //   ),
      //   leading: IconButton(
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //     icon: Icon(
      //       Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
      //       color: ColorApp.black,
      //     ),
      //   ),
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              LoadImage(
                url: "https://hoidap247.com/static/img/logo_h247.png",
                height: 30,
                fit: BoxFit.fitHeight,
                alignment: Alignment.center,
              ),
              const SizedBox(
                height: 40,
              ),
              InputText(

                colorBorder: ColorApp.black,

                  hasPass: false,
                  hint: 'Tên đăng nhập',
                  controller: username,
                  maxline: 1),
              const SizedBox(
                height: 20,
              ),
              InputText(
                colorBorder: ColorApp.black,

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
                      child:  Text(
                        'Quên mật khẩu',
                        style: StyleApp.textStyle700(),
                      )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Button1(
                  ontap: (){

                    if((username.text!='')&&(password.text!='')){
                      Toast.show("Đăng nhập thành công", duration: 2, gravity:  Toast.bottom);

                      Future.delayed(Duration(milliseconds: 2500), () {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => ScreenHome()));
                      });
                    }else{
                      Toast.show("Đăng nhập thất bại", duration: 3, gravity:  Toast.bottom);

                    }
print(username.text);
                    print(password.text);
              },
                  textColor: Colors.white,
                  textButton: 'Đăng nhập',
                  colorButton: Colors.blue,
                  radius: 10),
              const SizedBox(
                height: 30,
              ),
              Button1(
                ontap: (){},
                  icon: true,
                  imagePath: 'images/Google.png',
                  textColor: Colors.black,
                  textButton: 'Đăng nhập với Google',
                  colorButton: Colors.white,
                  border: Border.all(color: Colors.black),
                  radius: 10),
              const SizedBox(
                height: 10,
              ),
              Button1(
                ontap: (){},
                  icon: true,
                  imagePath: 'images/Facebook.png',
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
                        style: TextStyle(color: ColorApp.blue6D),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
