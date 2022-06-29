import 'dart:io';
import 'package:app_q_n_a/Screens/add_question.dart';
import 'package:app_q_n_a/item/input/text_filed.dart';
import 'package:app_q_n_a/validator.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import '../../../item/button.dart';
import '../../../styles/colors.dart';
import '../../../styles/styles.dart';
import '../../login.dart';

class ChangePass extends StatefulWidget {
  @override
  State<ChangePass> createState() => _ChangePassState();
}

class _ChangePassState extends State<ChangePass> {
  TextEditingController password = TextEditingController();
  TextEditingController password1 = TextEditingController();
  TextEditingController password2 = TextEditingController();
  final keyForm = GlobalKey<FormState>();
  ChangPassVoid() async {
    if (keyForm.currentState!.validate()) {

      Toast.show("Đổi mật khẩu thành công", duration: 1, gravity: Toast.bottom);

      Future.delayed(Duration(milliseconds: 1500), () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AddQuestion()));
      });
    } else {
      Toast.show("Đổi mật khẩu thất bại", duration: 1, gravity: Toast.bottom);
    }
  }

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      backgroundColor: ColorApp.whiteF0,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorApp.whiteF0,
        title: Text(
          'Đổi mật khẩu',
          style: StyleApp.textStyle700(fontSize: 18,),
        ),
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
        reverse: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
          child: Form(
            key: keyForm,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 15,
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
                      return ValidatorApp.checkPass(
                          text: val, isSign: true, text2: password.text);
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InputText1(
                    label: "Mật khẩu mới",
                    controller: password1,
                    borderColor: ColorApp.main.withOpacity(0.2),
                    hasLeading: true,
                    iconData: Icons.lock_open,
                    obscureText: true,
                    hasPass: true,
                    radius: 10,
                    width: double.infinity,
                    validator: (val) {
                      return ValidatorApp.checkPass(
                          text: val, isSign: true, text2: password1.text);
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InputText1(
                    label: "Nhập lại mật khẩu mới",
                    controller: password2,
                    borderColor: ColorApp.main.withOpacity(0.2),
                    hasLeading: true,
                    iconData: Icons.lock_open,
                    obscureText: true,
                    hasPass: true,
                    radius: 10,
                    width: double.infinity,
                    validator: (val) {
                      return ValidatorApp.checkPass(
                          text: val, isSign: true, text2: password1.text);
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Button1(
                      radius: 10,
                      ontap: () {
                        ChangPassVoid();
                      },
                      fontSize: 16,
                      style: false,
                      colorButton: ColorApp.orangeF2,
                      textColor: Colors.white,
                      textButton: 'Lưu'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
