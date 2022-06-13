import 'package:app_q_n_a/filter.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'login.dart';
import 'add_question.dart';
import 'package:app_q_n_a/registration.dart';
import 'answer_screen.dart';
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



