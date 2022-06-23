import 'dart:io';

import 'package:app_q_n_a/item/dropdown_button.dart';
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
      Toast.show("Yêu cầu cấp lại mật khẩu của bạn đã được phê duyệt",
          duration: 3, gravity: Toast.bottom);

      Future.delayed(Duration(milliseconds: 3500), () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      });
    } else {
      Toast.show("Thất bại", duration: 3, gravity: Toast.bottom);
    }
  }

  String type = 'Đăng ký User';
  List<String> typeList = ['Đăng ký User', 'Đăng ký Supporter'];

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      backgroundColor: ColorApp.whiteF7,
      appBar: AppBar(
        backgroundColor: ColorApp.whiteF0,

        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            setState(() {});
          },
          icon: Icon(
            Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
            color: ColorApp.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
          child: Form(
            key: keyForm,
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
                SizedBox(height: 15,),
                Text('Đăng ký',style: StyleApp.textStyle700(fontSize: 30,color: ColorApp.orangeF2),),
                SizedBox(height: 15,),
                Dropdown1(

                  val: type,
                  monList: typeList,
                ),
                SizedBox(
                  height: 15,
                ),
                InputText(
                    validator: (val) {
                      return ValidatorApp.checkNull(
                          text: val, isTextFiled: true);
                    },

                    hint: 'Tên đăng nhập',
                    controller: username),
                SizedBox(
                  height: 15,
                ),
                InputText(
                  validator: (val) {
                    return ValidatorApp.checkPhone(text: val);
                  },

                  hint: 'Số điện thoại',
                  controller: phone,
                  inputType: TextInputType.number,
                ),
                SizedBox(
                  height: 15,
                ),
                InputText(
                    validator: (val) {
                      return ValidatorApp.checkEmail(text: val);
                    },

                    hint: 'Email',
                    controller: email,
                    inputType: TextInputType.emailAddress),
                SizedBox(
                  height: 15,
                ),
                InputText(
                    validator: (val) {
                      return ValidatorApp.checkPass(
                          text: val, isSign: true, text2: confirm.text);
                    },
                    maxline: 1,
                    hasPass: true,
                    hint: 'Mật khẩu',
                    controller: password),
                SizedBox(
                  height: 15,
                ),
                InputText(
                    validator: (val) {
                      return ValidatorApp.checkPass(
                          text: val, isSign: true, text2: password.text);
                    },
                    maxline: 1,
                    hasPass: true,
                    hint: ' Nhập lại mật khẩu',
                    controller: confirm),
                SizedBox(
                  height: 15,
                ),
                Button1(
                    ontap: () {},
                    colorButton: Colors.blue,
                    textColor: Colors.white,
                    textButton: 'Đăng ký'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
