
import 'package:app_q_n_a/Screens/screen_home.dart';
import 'package:flutter/material.dart';

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
      home: ScreenHome(),
    );
  }
}
