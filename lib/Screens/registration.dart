import 'dart:io';

import 'package:app_q_n_a/item/dropdown_button.dart';
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

  String type='Đăng ký User';
  List<String>typeList=['Đăng ký User','Đăng ký Supporter'];



  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      backgroundColor: ColorApp.whiteF7,
      appBar: AppBar(
        backgroundColor: ColorApp.whiteF0,
        title: Text(
          "Đăng ký",
          style: StyleApp.textStyle700(fontSize: 18),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            setState((){});
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              SizedBox(
                height: 10,
              ),
              formRegistration(
                type: type,
                      typeList: typeList,
                      keyform: keyForm,
                      registration: () {
                        if ((name.text != '') &&
                            (username.text != '') &&
                            (phone.text != '') &&
                            (email.text != '') &&
                            (password.text != '') &&
                            (confirm.text != '')) {
                          print(name.text);
                          Toast.show("Đăng ký trở thành user thành công", duration: 3, gravity:  Toast.bottom);
                          setState((){});
                          Future.delayed(Duration(milliseconds: 3500), () {
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) => LoginScreen()));
                          });
                        }
                        else{
                          Toast.show("Vui lòng nhập đủ thông tin", duration: 3, gravity:  Toast.bottom);
                        }
                      },
                      name: name,
                      username: username,
                      phone: phone,
                      email: email,
                      password: password,

                      colorButton: Colors.blue,
                      confirm: confirm)

            ],
          ),
        ),
      ),
    );
  }
}

Widget formRegistration(

    {GlobalKey<FormState>? keyform,
      required String type,
      required List<String> typeList,
    required Function() registration,
    required TextEditingController name,
    required TextEditingController username,
    required TextEditingController phone,
    required TextEditingController email,
    required TextEditingController password,
    required TextEditingController confirm,

    required Color colorButton}) {
  return Form(
    key: keyform,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Dropdown1(val: type, monList: typeList,
        ),
        SizedBox(
          height: 15,
        ),
        InputText(hasPass: false, hint: 'Họ và tên', controller: name,),
        SizedBox(
          height: 15,
        ),
        InputText(hasPass: false, hint: 'Tên đăng nhập', controller: username),
        SizedBox(
          height: 15,
        ),
        InputText(hasPass: false, hint: 'Số điện thoại', controller: phone,inputType: TextInputType.number,),
        SizedBox(
          height: 15,
        ),
        InputText(
            hasPass: false,
            hint: 'Email',
            controller: email,
            inputType: TextInputType.emailAddress),
        SizedBox(
          height: 15,
        ),

        InputText(
            maxline: 1, hasPass: true, hint: 'Mật khẩu', controller: password),
        SizedBox(
          height: 15,
        ),
        InputText(
            maxline: 1,
            hasPass: true,
            hint: ' Nhập lại mật khẩu',
            controller: confirm),
        SizedBox(
          height: 15,
        ),
        Button1(
            ontap: registration,
            colorButton: colorButton,
            textColor: Colors.white,
            textButton: 'Đăng ký'),
      ],
    ),
  );
}
