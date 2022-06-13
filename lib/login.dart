import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'input_text.dart';
import 'button.dart';

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
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.orangeAccent.shade100,
        title: Text('Đăng nhập'),
        leading: IconButton(
            onPressed: () {}, icon: Icon(Icons.arrow_back_ios_new_rounded)),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
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
                  onPressed: () {},
                  icon: Image.network(
                      'http://pngimg.com/uploads/google/google_PNG19635.png'),
                  iconSize: 60,
                ),
                SizedBox(
                  width: 70,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Image.network(
                      'https://atpsoftware.vn/wp-content/uploads//2021/03/1200px-Facebook_Logo_2019.png'),
                  iconSize: 60,
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
                hasPass: false, hint: 'Tên đăng nhập', controller: username),
            InputText(hasPass: true, hint: 'Mật khẩu', controller: password),
            Row(
              children: [
                SizedBox(
                  width: 230,
                ),
                FlatButton(
                    onPressed: () {},
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
                colorButton: Colors.blue),
            Row(

              children: [
                Text('Nếu chưa có tài khoản'),
                FlatButton(onPressed: (){}, child: Text('Đăng ký ngay',style: TextStyle(color: Colors.green),))
              ],
            )
          ],
        ),
      ),
    );
  }
}
