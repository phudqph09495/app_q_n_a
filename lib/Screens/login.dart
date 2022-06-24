import 'dart:io';

import 'package:app_q_n_a/Screens/forgot_password.dart';
import 'package:app_q_n_a/Screens/registration.dart';
import 'package:app_q_n_a/Screens/screen_home.dart';
import 'package:app_q_n_a/item/input/text_filed.dart';
import 'package:app_q_n_a/item/load_image.dart';
import 'package:app_q_n_a/validator.dart';
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

  bool checkedValue = false;
  final keyForm = GlobalKey<FormState>();
LoginVoid() async{
  if (keyForm.currentState!.validate()) {
    Toast.show("Đăng nhập thành công",
        duration: 1, gravity: Toast.bottom);

    Future.delayed(Duration(milliseconds: 1500), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ScreenHome()));
    });
  } else {
    Toast.show("Đăng nhập thất bại", duration: 3, gravity: Toast.bottom);
  }
}
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      backgroundColor: ColorApp.whiteF7,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: ColorApp.whiteF0,
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
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Form(
            key: keyForm,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
SizedBox(height: 60,),
                LoadImage(
                  url: "https://hoidap247.com/static/img/logo_h247.png",
                  height: 30,
                  fit: BoxFit.fitHeight,
                  alignment: Alignment.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text('Đăng nhập',style: StyleApp.textStyle700(fontSize: 30,color: ColorApp.orangeF8),),
                const SizedBox(
                  height: 20,
                ),
            InputText1(
              label: "Tên đăng nhập",
              controller: username,
              borderColor: ColorApp.main.withOpacity(0.2),
              hasLeading: true,
              iconData: Icons.person,
              obscureText: false,
              hasPass: false,
              radius: 10,
              width: double.infinity,
              validator: (val) {
                return ValidatorApp.checkNull(text: val,isTextFiled: true);
              },
            ),
                const SizedBox(
                  height: 10,
                ),
                InputText1(
                  label: "Mật khẩu",
                  controller: password,
                  borderColor: ColorApp.main.withOpacity(0.2),
                  hasLeading: true,
                  iconData: Icons.lock_open,
                  obscureText: true,
                  hasPass: true,
                  radius: 10,
                  width: double.infinity,
                  validator: (val) {
                    return ValidatorApp.checkPass(text: val);
                  },
                ),
                Row(
                  children: [
                    Checkbox(
                        activeColor: Colors.yellow,
                        value: checkedValue,
                        onChanged: (val) {
                          setState(() {
                            checkedValue = val!;
                          });
                        }),Text('Ghi nhớ mật khẩu',style: StyleApp.textStyle700(),),
                    SizedBox(width: 60,),
                    FlatButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ForgotPass()));
                        },
                        child: Text(
                          'Quên mật khẩu',
                          style: StyleApp.textStyle700(),
                        )),
                  ],
                ),
                Button1(
                  fontSize: 18,
                    ontap: () {
                 LoginVoid();
                    },
                    textColor: Colors.white,
                    textButton: 'Đăng nhập',
                    colorButton: ColorApp.orangeF2,
                    radius: 30),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button1(
                        width: 175,
                        ontap: () {},
                        icon: true,
                        imagePath: 'images/Google.png',
                        textColor: Colors.black,
                        textButton: 'Google',
                        colorButton: Colors.white,
                        border: Border.all(color: ColorApp.orangeF2),
                        radius: 30),
                    Button1(
                        width: 175,
                        ontap: () {},
                        icon: true,
                        imagePath: 'images/Facebook.png',
                        textColor: Colors.black,
                        textButton: 'Facebook',
                        border: Border.all(color: ColorApp.orangeF2),
                        colorButton: Colors.white,
                        radius: 30),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Bạn chưa có tài khoản?'),
                    FlatButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegistrationScreen()));
                        },
                        child: Text(
                          'Đăng ký ngay',
                          style: TextStyle(color: ColorApp.orangeF2),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
