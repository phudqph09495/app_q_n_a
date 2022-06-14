

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
            width: 100,
            child: Row(
              children: [
                Icon(Icons.menu_open_sharp),
                Text('Lọc câu hỏi')
              ],
            ),
          )),
      MaterialButton(
          color: Colors.black.withOpacity(0.1),
          minWidth: 20,
          onPressed: () {},
          child: Text(
            'X2',
            style: TextStyle(color: Colors.white, fontSize: 20),
          )),
      SizedBox(
        width: 35,
      ),
      FlatButton(
          onPressed: () {},
          child: Container(
            child: Row(
              children: [
                Text('Top thành viên'),
                FaIcon(
                  FontAwesomeIcons.trophy,
                  color: Colors.black.withOpacity(0.5),
                ),
              ],
            ),
          ))
    ],
  );}