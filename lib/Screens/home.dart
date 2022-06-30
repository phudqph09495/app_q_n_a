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
        backgroundColor: ColorApp.orangeF2,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddQuestion()));
        },
        label: Text(
          'Đặt câu hỏi',
          style: StyleApp.textStyle900(fontSize: 16, color: Colors.white),
        ),
        icon: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      backgroundColor: ColorApp.whiteF0,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 90,
        backgroundColor: ColorApp.whiteF0,
        elevation: 0,
        flexibleSpace: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 17,
              ),
              Image.asset(
                'images/logo2.png',
                height: 40,
                fit: BoxFit.fitHeight,
                alignment: Alignment.centerLeft,
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 35,
                width: 160,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorApp.whiteF7,
                    border: Border.all(color: Colors.black, width: 0.5)),
                child: FlatButton(
                    height: 35,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Filter()));
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.menu_open),
                        Text(
                          '  Lọc câu hỏi',
                          style: StyleApp.textStyle900(fontSize: 16),
                        )
                      ],
                    )),
              ),
            ],
          ),
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
            children: [
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
