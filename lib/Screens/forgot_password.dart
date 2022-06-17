import 'package:app_q_n_a/Screens/login.dart';
import 'package:app_q_n_a/item/button.dart';
import 'package:app_q_n_a/item/input_text.dart';
import 'package:app_q_n_a/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class ForgotPass extends StatefulWidget {
  @override
  State<ForgotPass> createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  TextEditingController forgot = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorApp.orangeF2,
        title: Text('Quên mật khẩu'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
          child: Column(
          children: [
            InputText(

                hasPass: false,
                hint: 'Nhập Email đăng ký hoặc tên đăng nhập',
                controller: forgot),
            SizedBox(
              height: 50,
            ),
            Button1(
                colorButton: Colors.blue,
                textColor: Colors.white,
                textButton: 'Khôi phục mật khẩu',
                ontap: () {

                 if(forgot.text!=''){
                   Toast.show("Yêu cầu cấp lại mật khẩu của bạn đã được phê duyệt", duration: 3, gravity:  Toast.bottom);

                   Future.delayed(Duration(milliseconds: 3500), () {
                     Navigator.push(
                         context, MaterialPageRoute(builder: (context) => LoginScreen()));
                   });
                 }else{
                   Toast.show("Hãy nhập email hoặc tên đăng nhập", duration: 3, gravity:  Toast.bottom);

                 }
                })
          ],
        ),
      ),
    );
  }
}
