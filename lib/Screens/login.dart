import 'dart:io';

import 'package:app_q_n_a/Screens/forgot_password.dart';
import 'package:app_q_n_a/Screens/registration.dart';
import 'package:app_q_n_a/Screens/screen_home.dart';
import 'package:app_q_n_a/bloc/bloc/auth/bloc_get_user_local.dart';
import 'package:app_q_n_a/bloc/bloc/auth/bloc_get_wallet.dart';
import 'package:app_q_n_a/bloc/bloc/auth/bloc_login.dart';
import 'package:app_q_n_a/bloc/event_bloc.dart';
import 'package:app_q_n_a/bloc/state_bloc.dart';
import 'package:app_q_n_a/config/share_pref.dart';
import 'package:app_q_n_a/item/input/text_filed.dart';
import 'package:app_q_n_a/models/model_user.dart';
import 'package:app_q_n_a/validator.dart';
import 'package:flutter/material.dart';
import '../bloc/bloc/auth/bloc_check_login.dart';
import '../bloc/check_log_state.dart';
import '../item/button.dart';
import '../styles/init_style.dart';
import 'package:toast/toast.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_q_n_a/config/path/share_pref_path.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  bool checkedValue = false;
  BlocLogin bloc = BlocLogin();
  final keyForm = GlobalKey<FormState>();
  LoginVoid() async {
    if (keyForm.currentState!.validate()) {
      bloc.add(loginApp(email: username.text, password: password.text));
    }
  }

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      backgroundColor: ColorApp.whiteF7,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Form(
          key: keyForm,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
              ),
              Image.asset(
                'images/backg.png',
                width: 230,
                height: 88,
                fit: BoxFit.fitHeight,
                alignment: Alignment.centerLeft,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Đăng nhập',
                style: StyleApp.textStyle700(
                    fontSize: 30, color: ColorApp.red),
              ),
              const SizedBox(
                height: 20,
              ),
              InputText1(
                label: "Nhập email hoặc số điện thoại",
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
              const SizedBox(
                height: 10,
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
                  return ValidatorApp.checkPass(text: val);
                },
              ),
              Row(
                children: [
                  Checkbox(
                      shape: CircleBorder(),
                      activeColor: ColorApp.orangeF2,
                      value: checkedValue,
                      onChanged: (val) {
                        setState(() {
                          checkedValue = val!;
                        });
                      }),
                  Text(
                    'Ghi nhớ mật khẩu',
                    style: StyleApp.textStyle700(),
                  ),
                  const SizedBox(
                    width: 60,
                  ),
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
              BlocListener(
                bloc: bloc,
                listener: (_, StateBloc state) {
                  ModelUser user = ModelUser();
                  if (state is LoadSuccess) {
                    user = state.data;
                  }
                  CheckLogState.check(
                    context,
                    state: state,
                    msg: "Đăng nhập thành công",
                    success: () async {
                      await SharePrefsKeys.seveUserKey(user);
                  await    SharedPrefs.saveString("pass", password.text);
                      context.read<BLocLocalUser>().getUser();
                      context.read<BlocGetWallet>().add(GetData());
                      context.read<BlocCheckLogin>().add(GetData());

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ScreenHome()));
                    },
                  );
                },
                child: Button1(
                    border:
                    Border.all(color: ColorApp.orangeF2, width: 0.5),
                    style: false,
                    fontSize: 18,
                    ontap: LoginVoid,
                    textColor: Colors.white,
                    textButton: 'Đăng nhập',
                    colorButton: ColorApp.orangeF2,
                    radius: 30),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Button1(
                      border:
                      Border.all(color: ColorApp.orangeF2, width: 0.5),
                      width: 175,
                      ontap: () {},
                      icon: true,
                      imagePath: 'images/Google.png',
                      textColor: Colors.black,
                      textButton: 'Google',
                      colorButton: Colors.white,
                      radius: 30),
                  Button1(
                      border:
                      Border.all(color: ColorApp.orangeF2, width: 0.5),
                      width: 175,
                      ontap: () {},
                      icon: true,
                      imagePath: 'images/Facebook.png',
                      textColor: Colors.black,
                      textButton: 'Facebook',
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
                                builder: (context) =>
                                    RegistrationScreen()));
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
    );
  }
}
