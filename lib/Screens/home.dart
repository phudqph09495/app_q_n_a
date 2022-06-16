import 'package:app_q_n_a/Screens/answer_screen.dart';
import 'package:app_q_n_a/Screens/search_screen.dart';
import 'package:app_q_n_a/item/load_image.dart';
import 'package:app_q_n_a/item/top_member_list.dart';
import 'package:app_q_n_a/item/top_member_tile.dart';
import 'package:app_q_n_a/styles/init_style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app_q_n_a/item/question_list.dart';
import '../item/header.dart';
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
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddQuestion()));
        },
        label: Text('Đặt câu hỏi'),
        icon: Icon(Icons.add),
      ),
      backgroundColor: ColorApp.main,
      appBar: AppBar(
        backgroundColor: ColorApp.main,
        elevation: 0,
        title: LoadImage(
          url: "https://hoidap247.com/static/img/logo_h247.png",
          height: 30,
          fit: BoxFit.fitHeight,
          alignment: Alignment.centerLeft,
        ),
        centerTitle: false,
        actions: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            width: 35,
            height: 35,
            alignment: Alignment.center,
            child: ElevatedButton(
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
                color: ColorApp.main,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Header(context),


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
