import 'dart:io';

import 'package:app_q_n_a/bloc/check_log_state.dart';
import 'package:app_q_n_a/bloc/event_bloc.dart';
import 'package:app_q_n_a/config/path/share_pref_path.dart';
import 'package:app_q_n_a/config/share_pref.dart';
import 'package:app_q_n_a/item/dropdown/Dropdown1.dart';
import 'package:app_q_n_a/models/model_local.dart';
import 'package:app_q_n_a/models/model_user.dart';
import 'package:app_q_n_a/widget/items/custom_toast.dart';
import 'package:app_q_n_a/widget/items/dia_log_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_q_n_a/item/dropdown_button.dart';
import 'package:app_q_n_a/item/input/text_filed.dart';
import 'package:app_q_n_a/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import '../bloc/state_bloc.dart';
import '../item/button.dart';
import '../item/input_text.dart';
import '../styles/init_style.dart';
import 'package:toast/toast.dart';
import '../widget/items/item_input.dart';
import 'login.dart';

import 'package:app_q_n_a/bloc/bloc/auth/bloc_registrantion.dart';

enum EnumRegistrantion { username, phone }

class RegistrationScreen extends StatefulWidget {
  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController username = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController confirm = TextEditingController();
  TextEditingController work = TextEditingController();
  BlocRegistrantion bloc = BlocRegistrantion();
  final keyForm = GlobalKey<FormState>();
  String? role;
  String? roleStr;

  bool isInput = false;

  TextEditingController userNameBank = TextEditingController();
  TextEditingController bankName = TextEditingController();
  TextEditingController bankNumber = TextEditingController();
  TextEditingController cccd=TextEditingController();
  RegistrationVoid() async {
    if (keyForm.currentState!.validate()) {
      if(role=="2"){
      bloc.add(AddDataRegistrantion(
          username: username.text,
          email: email.text,
          phone: phone.text,
          password: password.text,
          register_by: EnumRegistrantion.phone.toString()));
         }else if(role=="1"&&userNameBank.text.isNotEmpty&&bankName.text.isNotEmpty&&bankNumber.text.isNotEmpty){
        //bloc.add.....
        print(username.text);
        print(email.text);
        print(phone.text);
        print(userNameBank.text);
        print(bankName.text);
        print(bankNumber);
      }
    }
  }

  cleanInput() {
    username.clear();
    password.clear();
    phone.clear();
    confirm.clear();
  }

  String type = 'Đăng ký User';
  List<String> typeList = ['Đăng ký User', 'Đăng ký Supporter'];

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
        backgroundColor: ColorApp.whiteF7,
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
                            height: 40,
                          ),
                          Image.asset(
                            'images/backg.png',
                            width: 222,
                            height: 88,
                            fit: BoxFit.fitHeight,
                            alignment: Alignment.centerLeft,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Đăng ký',
                            style: StyleApp.textStyle700(
                                fontSize: 30, color: ColorApp.red),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          DropDown2(
                            pad: 47,
                            hint: 'Chọn vai trò của bạn',
                            listItem: [
                              ModelLocal(id: "1", name: "Người trả lời"),
                              ModelLocal(id: "2", name: "Người hỏi")
                            ],
                            onChanged: (value) {
                              role = value.id;
                              print(role);

                              role = value.id;
                              if (role == "1") {
                                _showbank();
                              }
                              if(role=="2"){
                                userNameBank.clear();
                                bankName.clear();
                                bankNumber.clear();
                              }
                            },
                            value: roleStr,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          InputText1(
                            label: "Họ và tên",
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
                            keyboardType: TextInputType.phone,
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
                            keyboardType: TextInputType.emailAddress,
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
                            label: "Nghề nghiệp",
                            controller: work,
                            borderColor: ColorApp.main.withOpacity(0.2),
                            hasLeading: true,
                            iconData: Icons.work_outline,
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
                                  text: val,
                                  isSign: true,
                                  text2: password.text);
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          BlocListener(
                            bloc: bloc,
                            listener: (_, StateBloc state) {
                              CheckLogState.check(
                                context,
                                state: state,
                                msg: "Đăng ký tài khoản thành công",
                                success: () {
                                  Navigator.pop(context);
                                },
                              );
                            },
                            child: Button1(
                                border: Border.all(
                                    color: ColorApp.orangeF2, width: 0.5),
                                style: false,
                                fontSize: 18,
                                radius: 30,
                                ontap: RegistrationVoid,
                                colorButton: ColorApp.orangeF2,
                                textColor: Colors.white,
                                textButton: 'Đăng ký'),
                          ),
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

  _showbank() {
    return showPlatformDialog(
        context: context,
        builder: (context) => BasicDialogAlert(
              title: Text("Nhập đầy đủ thông tin để trở thành người trả lời"),
              content: Container(
                height: 350,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      itemInput(
                        title: "Tên chủ tài khoản ngân hàng",
                        hint: "Viết hoa và không có dấu",
                        readOnly: isInput,
                        controller: userNameBank,
                      ),
                      itemInput(
                        title: "Tên ngân hàng",
                        hint: "Nhập tên ngân hàng",
                        readOnly: isInput,
                        controller: bankName,
                      ),
                      itemInput(
                        title: "Số tài khoản",
                        hint: "Nhập số tài khoản",
                        readOnly: isInput,
                        controller: bankNumber,
                      ),
                      itemInput(
                        title: "Số Căn cước công dân",
                        hint: "Nhập số CCCD hoặc chứng minh thư",
                        readOnly: isInput,
                        controller: cccd,
                      ),
                    ],
                  ),
                ),
              ),
              actions: <Widget>[
                BasicDialogAction(
                  title: Text(
                    "Xác nhận",
                    style: StyleApp.textStyle500(color: Colors.blue),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                BasicDialogAction(
                  title: Text(
                    "Trở lại",
                    style: StyleApp.textStyle500(color: Colors.red),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    userNameBank.clear();
                    bankName.clear();
                    bankNumber.clear();
                  },
                ),
              ],
            ));
  }
}
