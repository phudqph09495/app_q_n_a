import 'dart:io';
import 'package:app_q_n_a/Screens/Screens_TaiKhoan/body_product.dart';
import 'package:app_q_n_a/bloc/bloc/auth/bloc_changpass.dart';
import 'package:app_q_n_a/item/input/text_filed.dart';
import 'package:app_q_n_a/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/event_bloc.dart';
import '../../../bloc/state_bloc.dart';
import '../../../config/path/share_pref_path.dart';
import '../../../config/share_pref.dart';
import '../../../item/button.dart';
import '../../../styles/colors.dart';
import '../../../styles/styles.dart';
import '../../../widget/items/custom_toast.dart';
import '../../../widget/items/dia_log_item.dart';

class ChangePass extends StatefulWidget {
  @override
  State<ChangePass> createState() => _ChangePassState();
}

class _ChangePassState extends State<ChangePass> {
  TextEditingController password = TextEditingController();
  TextEditingController password1 = TextEditingController();
  TextEditingController password2 = TextEditingController();
  final keyForm = GlobalKey<FormState>();
  BlocChangPass bloc = BlocChangPass();
  ChangePassword() async {
    var passii=await(SharedPrefs.readString("pass"));
    if (keyForm.currentState!.validate()&&password.text==passii) {
      bloc.add(
        ChagePassIsLogin(
          passwordre: password1.text,
          password: password.text,
        ),
      );
    }
    else CustomToast.showToast(context: context, msg: "Mật khẩu cũ không đúng");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.whiteF0,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorApp.whiteF0,
        title: Text(
          'Đổi mật khẩu',
          style: StyleApp.textStyle700(
            fontSize: 18,
          ),
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: Form(
          key: keyForm,
          child: BlocListener(
            bloc: bloc,
            listener: (_, state) {
              if (state is Loading) DialogItem.showLoading(context: context);
              if (state is LoadSuccess) {
                DialogItem.hideLoading(context: context);
                CustomToast.showToast(
                  context: context,
                  msg: "Đổi mật khẩu thành công",
                );
                password.clear();
                password1.clear();
                password2.clear();
                Navigator.pop(context);
              }
              if (state is LoadFail) {
                DialogItem.hideLoading(context: context);
                DialogItem.showMsg(
                    context: context, title: "Lỗi", msg: state.error);
              }
            },
            child: Column(
              children: [
                InputText1(
                  iconData: Icons.lock_open,
                  label: "Mật khẩu cũ*",
                  controller: password,
                  hasLeading: false,
                  hasPass: true,
                  obscureText: true,
                  colorBg: Colors.white,
                  radius: 10,
                  borderColor: ColorApp.main.withOpacity(0.2),
                  validator: (val) {
                    return ValidatorApp.checkPass(text: val);
                  },
                ),
                const SizedBox(height: 15),
                InputText1(
                  iconData: Icons.lock_open,
                  label: "Mật khẩu mới*",
                  controller: password1,
                  hasLeading: false,
                  hasPass: true,
                  obscureText: true,
                  colorBg: Colors.white,
                  radius: 10,
                  borderColor: ColorApp.main.withOpacity(0.2),
                  validator: (val) {
                    return ValidatorApp.checkPass(
                        text: val, text2: password2.text, isSign: true);
                  },
                ),
                const SizedBox(height: 15),
                InputText1(
                  iconData: Icons.lock_open,
                  label: "Nhập lại mật khẩu mới*",
                  controller: password2,
                  hasLeading: false,
                  hasPass: true,
                  obscureText: true,
                  colorBg: Colors.white,
                  radius: 10,
                  borderColor: ColorApp.main.withOpacity(0.2),
                  validator: (val) {
                    return ValidatorApp.checkPass(
                        text: val, text2: password1.text, isSign: true);
                  },
                ),
                const SizedBox(height: 15),
                Button1(
                  radius: 10,
                  ontap: () {
                    ChangePassword();
                  },
                  fontSize: 16,
                  style: false,
                  colorButton: ColorApp.orangeF2,
                  textColor: Colors.white,
                  textButton: 'Lưu',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
