import 'dart:io';

import 'package:app_q_n_a/item/dropdown_button.dart';
import 'package:app_q_n_a/item/input/text_filed.dart';
import 'package:app_q_n_a/item/input/text_filed2.dart';
import 'package:app_q_n_a/item/load_image.dart';
import 'package:app_q_n_a/models/model_local.dart';
import 'package:app_q_n_a/validator.dart';
import 'package:flutter/material.dart';
import '../item/button.dart';
import '../item/input_text.dart';
import '../styles/init_style.dart';
import 'package:toast/toast.dart';
import 'login.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController confirm = TextEditingController();

  final keyForm = GlobalKey<FormState>();
  RegistrationVoid() async {
    if (keyForm.currentState!.validate()) {
      Toast.show("Đăng ký thành công", duration: 1, gravity: Toast.bottom);

      Future.delayed(Duration(milliseconds: 1500), () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      });
    } else {
      Toast.show("Đăng ký thất bại", duration: 1, gravity: Toast.bottom);
    }
  }

  String type = 'Đăng ký User';
  List<String> typeList = ['Đăng ký User', 'Đăng ký Supporter'];

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
        backgroundColor: ColorApp.whiteF7,
        // appBar: AppBar(
        //   backgroundColor: ColorApp.whiteF0,
        //
        //   // leading: IconButton(
        //   //   onPressed: () {
        //   //     Navigator.pop(context);
        //   //     setState(() {});
        //   //   },
        //   //   icon: Icon(
        //   //     Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
        //   //     color: ColorApp.black,
        //   //   ),
        //   // ),
        // ),
        body: SafeArea(
          child: Stack(
            alignment: Alignment.topLeft,
            children: <Widget>[
              SingleChildScrollView(
                reverse: true,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
                  child: Form(
                    key: keyForm,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 60,
                          ),
                          // LoadImage(
                          //   url: "https://hoidap247.com/static/img/logo_h247.png",
                          //   height: 30,
                          //   fit: BoxFit.fitHeight,
                          //   alignment: Alignment.center,
                          // ),
                          Image.asset(
                            'images/logo2.png',

                            fit: BoxFit.fitHeight,
                            alignment: Alignment.centerLeft,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Đăng ký',
                            style: StyleApp.textStyle700(
                                fontSize: 30, color: ColorApp.red),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Dropdown1(
                            pad: 32,
                            val: type,
                            monList: typeList,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          InputText1(
                            label: "Tên đăng nhập",
                            controller: username,
                            borderColor: ColorApp.main.withOpacity(0.2),
                            hasLeading: true,
                            iconData: Icons.person_outline,
                            obscureText: false,
                            hasPass: false,
                            radius: 10,
                            width: double.infinity,
                            validator: (val) {
                              return ValidatorApp.checkNull(
                                  text: val, isTextFiled: true);
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          InputText1(
                            label: "Số điện thoại",
                            controller: phone,
                            borderColor: ColorApp.main.withOpacity(0.2),
                            hasLeading: true,
                            iconData: Icons.phone_android,
                            obscureText: false,
                            hasPass: false,
                            radius: 10,
                            width: double.infinity,
                            validator: (val) {
                              return ValidatorApp.checkPhone(text: val);
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          InputText1(
                            label: "Email",
                            controller: email,
                            borderColor: ColorApp.main.withOpacity(0.2),
                            hasLeading: true,
                            iconData: Icons.email_outlined,
                            obscureText: false,
                            hasPass: false,
                            radius: 10,
                            width: double.infinity,
                            validator: (val) {
                              return ValidatorApp.checkEmail(text: val);
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          InputText1(
                            label: "Mật khẩu",
                            controller: password,
                            borderColor: ColorApp.main.withOpacity(0.2),
                            hasLeading: true,
                            iconData: Icons.lock_outline,
                            obscureText: true,
                            hasPass: true,
                            radius: 10,
                            width: double.infinity,
                            validator: (val) {
                              return ValidatorApp.checkPass(
                                  text: val, isSign: true, text2: confirm.text);
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          InputText1(
                            label: "Nhập lại mật khẩu",
                            controller: confirm,
                            borderColor: ColorApp.main.withOpacity(0.2),
                            hasLeading: true,
                            iconData: Icons.lock_outline,
                            obscureText: true,
                            hasPass: true,
                            radius: 10,
                            width: double.infinity,
                            validator: (val) {
                              return ValidatorApp.checkPass(
                                  text: val, isSign: true, text2: password.text);
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Button1(
                              border: Border.all(color: ColorApp.orangeF2,width: 0.5),
                            style: false,
                            fontSize: 18,
                              radius: 30,
                              ontap: () {
                                RegistrationVoid();
                              },
                              colorButton: ColorApp.orangeF2,
                              textColor: Colors.white,
                              textButton: 'Đăng ký'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ));
  }
}
