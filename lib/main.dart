import 'package:app_q_n_a/Screens/filter.dart';
import 'package:flutter/material.dart';
import 'Screens/home.dart';
import 'Screens/login.dart';
import 'Screens/add_question.dart';
import 'package:app_q_n_a/Screens/registration.dart';
import 'Screens/answer_screen.dart';
void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(


      home:
      // LoginScreen(),
      // HomeScreen(),
      RegistrationScreen(),
      // AddQuestion(),
      // AnswerScreen(),
    );

  }
}



