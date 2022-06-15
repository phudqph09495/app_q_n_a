import 'package:app_q_n_a/Screens/screen_home.dart';
import 'package:app_q_n_a/Screens/filter.dart';
import 'package:app_q_n_a/Screens/search_screen.dart';
import 'package:app_q_n_a/screens_y/product/product.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'Screens/home.dart';
import 'Screens/login.dart';
import 'Screens/add_question.dart';
import 'package:app_q_n_a/Screens/registration.dart';
import 'Screens/answer_screen.dart';
import 'package:app_q_n_a/Screens/filter.dart';
import 'package:app_q_n_a/Screens/add_answer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        unselectedWidgetColor: Colors.green,
      ),
      //them y
      home:
      ScreenHome(),

      // home:
      //     // Filter(),
      //     // LoginScreen(),
      //     HomeScreen(),
      // RegistrationScreen(),
      // AddQuestion(),
      // AnswerScreen(),
      // Add_Answer_Screen(),
    );
  }
}
