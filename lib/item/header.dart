

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app_q_n_a/Screens/filter.dart';
Widget Header(BuildContext context){

  return
  Row(
    children: [
      FlatButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Filter()));
          },
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5)
            ),
            padding: const  EdgeInsets.symmetric(vertical: 3,horizontal: 7),
            alignment: Alignment.center,
            child: Row(
              children: const [
                Icon(Icons.menu_open_sharp),
                Text('Lọc câu hỏi')
              ],
            ),
          )),
    ],
  );}