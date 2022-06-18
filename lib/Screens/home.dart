import 'package:app_q_n_a/Screens/answer_screen.dart';
import 'package:app_q_n_a/Screens/filter.dart';
import 'package:app_q_n_a/Screens/search_screen.dart';
import 'package:app_q_n_a/item/button.dart';
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
        backgroundColor: ColorApp.orangeF2,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddQuestion()));
        },
        label: Text('Đặt câu hỏi',style: StyleApp.textStyle600(fontSize: 20, color: Colors.white),),
        icon: Icon(Icons.add),
      ),
      backgroundColor: ColorApp.orangeF8,
      appBar: AppBar(
        backgroundColor: ColorApp.orangeF2,
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
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
           mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Header(context),
              Button1(
                colorButton: ColorApp.orangeF2,
                textColor: ColorApp.black,
                textButton: 'Lọc câu hỏi',
                width: 150,
                height: 35,
                ontap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>Filter()));
                },
              ),
              SizedBox(height: 8,),
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
