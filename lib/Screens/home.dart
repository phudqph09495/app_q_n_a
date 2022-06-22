import 'package:app_q_n_a/Screens/answer_screen.dart';
import 'package:app_q_n_a/Screens/filter.dart';
import 'package:app_q_n_a/Screens/search_screen.dart';
import 'package:app_q_n_a/item/button.dart';
import 'package:app_q_n_a/item/load_image.dart';


import 'package:app_q_n_a/styles/init_style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app_q_n_a/item/question_list.dart';

import 'add_question.dart';
import 'add_answer.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: ColorApp.orangeF0,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddQuestion()));
        },
        label: Text(
          'Đặt câu hỏi',
          style: StyleApp.textStyle600(fontSize: 20, color: ColorApp.orangeF01),
        ),
        icon:const Icon(Icons.add,color: ColorApp.orangeF01,),
      ),
      backgroundColor: ColorApp.whiteF7,
      appBar: AppBar(
        backgroundColor: ColorApp.whiteF0,
        elevation: 0,
        title: LoadImage(
          url: "https://hoidap247.com/static/img/logo_h247.png",
          height: 30,
          fit: BoxFit.fitHeight,
          alignment: Alignment.centerLeft,
        ),
        centerTitle: false,
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.transparent,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0)),
              padding: const EdgeInsets.all(5),
            ),
            onPressed: () {
              print("search");
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchScreen()));
            },
            child: const Icon(
              Icons.search,
              color: ColorApp.black,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [


              Button1(
                colorButton: ColorApp.whiteF0,
                textColor: ColorApp.black,
                border: Border.all(color: ColorApp.black,width: 1),
                textButton: 'Lọc câu hỏi',
                width: 150,
                height: 35,
                ontap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Filter()));
                },
              ),
              const SizedBox(
                height: 8,
              ),
              ListQuestion(
                ontap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AnswerScreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
