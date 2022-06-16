import 'package:flutter/material.dart';
import '../item/button.dart';
import '../item/input_text.dart';

late bool userShow;
late bool spShow;

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
TextEditingController confirm=TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userShow = false;
    spShow = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.orangeAccent.shade100,
        title: Text('Đăng ký'),

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
          child: Form(

            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Button1(
                        width: 150,
                        colorButton: Colors.blue,
                        textColor: Colors.white,
                        textButton: 'Trở thành User',
                        ontap: () {
                          setState(() {
                            userShow = !userShow;
                            spShow = false;
                            print(userShow);
                          });
                        }),
                    Button1(
                        width: 200,
                        colorButton: Colors.red,
                        textColor: Colors.white,
                        textButton: 'Trở thành Supporter',
                        ontap: () {
                          setState(() {
                            spShow = !spShow;
                            userShow = false;
                            print(userShow);
                          });
                        }),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                userShow
                    ? formRegistration(name: name, username: username, phone: phone, email: email, password: password, textButton: 'User', colorButton: Colors.blue,confirm: confirm)
                    : SizedBox(
                        height: 0,
                      ),
                spShow
                    ? formRegistration(name: name, username: username, phone: phone, email: email, password: password, textButton: 'Supporter',colorButton: Colors.red,confirm: confirm)
                    : SizedBox(
                        height: 0,
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


Widget formRegistration(
{
  required TextEditingController name,
  required TextEditingController username,
  required TextEditingController phone,
  required TextEditingController email,
  required TextEditingController password,
  required TextEditingController confirm,
  required String textButton,
  required Color colorButton


}
    ){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      InputText(
          hasPass: false,
          hint: 'Họ và tên',
          controller: name),
      SizedBox(
        height: 15,
      ),
      InputText(
          hasPass: false,
          hint: 'Tên đăng nhập',
          controller: username),
      SizedBox(
        height: 15,
      ),
      InputText(
          hasPass: false,
          hint: 'Số điện thoại',
          controller: phone),
      SizedBox(
        height: 15,
      ),
      InputText(
          hasPass: false, hint: 'Email', controller: email,inputType: TextInputType.emailAddress),
      SizedBox(
        height: 15,
      ),
      InputText(
          maxline: 1,
          hasPass: true,
          hint: 'Mật khẩu',
          controller: password),
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
          colorButton:colorButton ,
          textColor: Colors.white,
          textButton: 'Đăng ký $textButton'),
    ],
  );
}