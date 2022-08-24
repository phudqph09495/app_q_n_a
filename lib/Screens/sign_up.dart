import 'package:app_q_n_a/item/button.dart';
import 'package:app_q_n_a/item/input/text_filed.dart';
import 'package:app_q_n_a/styles/init_style.dart';
import 'package:app_q_n_a/validator.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final keyFormHoi = GlobalKey<FormState>();
  final keyFormTraLoi = GlobalKey<FormState>();


  TextEditingController usernameHoi = TextEditingController();
  TextEditingController phoneHoi = TextEditingController();
  TextEditingController passwordHoi = TextEditingController();
  TextEditingController emailHoi = TextEditingController();
  TextEditingController confirmHoi = TextEditingController();

  clearHoi(){
    usernameHoi.clear();
    phoneHoi.clear();
    passwordHoi.clear();
    emailHoi.clear();
    confirmHoi.clear();
  }

  TextEditingController workTL = TextEditingController();
  TextEditingController usernameTL = TextEditingController();
  TextEditingController phoneTL = TextEditingController();
  TextEditingController passwordTL = TextEditingController();
  TextEditingController emailTL = TextEditingController();
  TextEditingController confirmTL = TextEditingController();


  TextEditingController userNameBank = TextEditingController();
  TextEditingController bankName = TextEditingController();
  TextEditingController bankNumber = TextEditingController();
  TextEditingController cccd=TextEditingController();


  int tab=0;
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      bottomSheet: Button1(
          border: Border.all(
              color: ColorApp.orangeF2, width: 0.5),
          style: false,
          fontSize: 18,
          radius: 30,
          colorButton: ColorApp.orangeF2,
          textColor: Colors.white,
          textButton: 'Đăng ký'),
      backgroundColor: ColorApp.whiteF7,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            SingleChildScrollView(
              reverse: true,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
                child: Center(
                  child: Column(
                    children: [
                      Image.asset(
                        'images/backg.png',
                        width: 222,
                        height: 88,
                        fit: BoxFit.fitHeight,
                        alignment: Alignment.centerLeft,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Đăng ký',
                        style: StyleApp.textStyle700(
                            fontSize: 30, color: ColorApp.red),
                      ),
                      const SizedBox(
                        height: 15,
                      ),

                      DefaultTabController(
                          length: 2,
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: TabBar(
                                  onTap: (int val){
                                    tab=val;
                                    print(tab);
                                    if(val==1){
                                      clearHoi();
                                    }

                                  },
                                  labelColor: Colors.green,
                                  unselectedLabelColor: Colors.black,
                                  tabs: [
                                    Tab(text: 'Người hỏi'),
                                    Tab(text: 'Người trả lời'),
                                  ],
                                ),
                              ),
                              SingleChildScrollView(
                                child: Container(
                                    height: 400, //height of TabBarView
                                    decoration: BoxDecoration(
                                        border: Border(
                                            top: BorderSide(
                                                color: Colors.grey, width: 0.5))),
                                    child: TabBarView(children: <Widget>[
                                      _Nguoihoi(),
                                      _NguoiTraloi()
                                    ])),
                              )
                            ],
                          ))
                    ],
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
      ),
    );
  }

  _Nguoihoi() {
    return SingleChildScrollView(
      reverse: true,
      child: Form(
        key: keyFormHoi,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InputText1(
              label: "Họ và tên",
              controller: usernameHoi,
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
              controller: phoneHoi,
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
              controller: emailHoi,
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
              controller: passwordHoi,
              borderColor: ColorApp.main.withOpacity(0.2),
              hasLeading: true,
              iconData: Icons.lock_outline,
              obscureText: true,
              hasPass: true,
              radius: 10,
              width: double.infinity,
              validator: (val) {
                return ValidatorApp.checkPass(
                    text: val, isSign: true, text2: confirmHoi.text);
              },
            ),
            SizedBox(
              height: 15,
            ),
            InputText1(
              label: "Nhập lại mật khẩu",
              controller: confirmHoi,
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
                    text2: passwordHoi.text);
              },
            ),
            SizedBox(
              height: 15,
            ),

          ],
        ),
      ),
    );
  }

  _NguoiTraloi() {
    return  SingleChildScrollView(

      child: Form(
        key: keyFormTraLoi,
        child: Column(

          children: [
            SizedBox(height: 20,),
            InputText1(
              label: "Họ và tên",
              controller: usernameTL,
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
              controller: phoneTL,
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
              controller: emailTL,
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
              label: "Công việc",
              controller: workTL,
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
              controller: passwordTL,
              borderColor: ColorApp.main.withOpacity(0.2),
              hasLeading: true,
              iconData: Icons.lock_outline,
              obscureText: true,
              hasPass: true,
              radius: 10,
              width: double.infinity,
              validator: (val) {
                return ValidatorApp.checkPass(
                    text: val, isSign: true, text2: confirmTL.text);
              },
            ),
            SizedBox(
              height: 15,
            ),
            InputText1(
              label: "Nhập lại mật khẩu",
              controller: confirmTL,
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
                    text2: passwordTL.text);
              },
            ),
            SizedBox(
              height: 15,
            ),
            InputText1(
              label: "Nhập CCCD",
              controller: usernameTL,
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
              label: "Nhập tên ngân hàng",
              controller: bankName,
              borderColor: ColorApp.main.withOpacity(0.2),
              hasLeading: true,
              iconData: Icons.account_balance_outlined,
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
              label: "Nhập tên tài khoản ngân hàng",
              controller: userNameBank,
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
              label: "Nhập số tài khoản ngân hàng",
              controller: bankNumber,
              borderColor: ColorApp.main.withOpacity(0.2),
              hasLeading: true,
              iconData: Icons.numbers_outlined,
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

          ],
        ),
      ),
    );
  }
}
