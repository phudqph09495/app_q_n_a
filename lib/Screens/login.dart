import 'package:app_q_n_a/Screens/forgot_password.dart';
import 'package:app_q_n_a/Screens/registration.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../item/input_text.dart';
import '../item/button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,

        title: Text('Đăng nhập'),

      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Text(
              'Đăng nhập với',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {

                  },
                  icon: Image.asset('images/Google.png',),

                ),
                SizedBox(
                  width: 70,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset('images/Facebook.png'),

                ),
              ],
            ),
            Text(
              'Hoặc',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            InputText(
                hasPass: false, hint: 'Tên đăng nhập', controller: username,maxline: 1),
            InputText(hasPass: true, hint: 'Mật khẩu', controller: password,maxline: 1),
            Row(
              children: [
                SizedBox(
                  width: 230,
                ),
                FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => ForgotPass()));
                    },
                    child: Text(
                      'Quên mật khẩu',
                      style: TextStyle(
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                        decorationThickness: 1,
                      ),
                    )),
              ],
            ),
            Button1(

                textColor: Colors.white,
                textButton: 'Đăng nhập',
                colorButton: Colors.blue,
            radius: 10),
            Row(

              children: [
                Text('Nếu chưa có tài khoản'),
                FlatButton(onPressed: (){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => RegistrationScreen()));
                }, child: Text('Đăng ký ngay',style: TextStyle(color: Colors.green),))
              ],
            )
          ],
        ),
      ),
    );
  }
}
