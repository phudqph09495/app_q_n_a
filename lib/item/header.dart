


import 'package:app_q_n_a/styles/init_style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app_q_n_a/Screens/filter.dart';
Widget Header(BuildContext context){
  return
  FlatButton(

      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Filter()));
      },
      child: Container(
width: 150,
color: ColorApp.orangeF2,
        child: Row(
          children: [
            Icon(Icons.menu_open_sharp,),
            Text('Lọc câu hỏi',style: StyleApp.textStyle700(),)
          ],
        ),
      ));}