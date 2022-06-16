

import 'package:app_q_n_a/styles/init_style.dart';
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

            child: Row(
              children: [
                Icon(Icons.menu_open_sharp,),
                Text('Lọc câu hỏi',style: StyleApp.textStyle700(),)
              ],
            ),
          )),
      Spacer(),
      FlatButton(
          onPressed: () {},
          child: Container(
            child: Row(
              children: [
                Text('Top thành viên ',style: StyleApp.textStyle700()),
                const FaIcon(
                  FontAwesomeIcons.trophy,
                  color: ColorApp.black,
                  size: 14,
                ),
              ],
            ),
          ))
    ],
  );}