import 'dart:io';

import 'package:app_q_n_a/Screens/login.dart';
import 'package:app_q_n_a/bloc/bloc/auth/bloc_reset_pass.dart';
import 'package:app_q_n_a/bloc/check_log_state.dart';
import 'package:app_q_n_a/bloc/event_bloc.dart';
import 'package:app_q_n_a/bloc/state_bloc.dart';
import 'package:app_q_n_a/item/button.dart';
import 'package:app_q_n_a/item/input/text_filed.dart';
import 'package:app_q_n_a/item/input_text.dart';
import 'package:app_q_n_a/styles/colors.dart';
import 'package:app_q_n_a/styles/init_style.dart';
import 'package:app_q_n_a/validator.dart';
import 'package:app_q_n_a/widget/items/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toast/toast.dart';

class ForgotPass extends StatefulWidget {
  @override
  State<ForgotPass> createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  BlocReSet blocReSet = BlocReSet();

  TextEditingController forgot = TextEditingController();
  Reset()async{
    print(forgot.text);
    if (keyForm.currentState!.validate()) {
      blocReSet.add(ResetP(email: forgot.text));
    }
  }
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
                keyboardType: TextInputType.emailAddress,
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
              BlocListener(
                bloc: blocReSet,
                listener: (_, StateBloc state) {
                  print(state);

                  CheckLogState.check(context,
                      isShowMsg: false,
                      state: state,
                  isShowDlg: true,
                  success: (){
                    forgot.clear();
                  });

                },
                child: Button1(
                    colorButton: ColorApp.orangeF2,
                    textColor: ColorApp.whiteF0,
                    radius: 30,
                    fontSize: 18,
                    style: false,
                    border: Border.all(color: ColorApp.orangeF2),
                    textButton: 'Khôi phục mật khẩu',
                    ontap: Reset,
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
