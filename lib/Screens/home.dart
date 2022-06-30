import 'package:app_q_n_a/Screens/answer_screen.dart';
import 'package:app_q_n_a/Screens/filter.dart';
import 'package:app_q_n_a/Screens/search_screen.dart';

import 'package:app_q_n_a/styles/init_style.dart';
import 'package:flutter/material.dart';

import '../item/question_tile.dart';
import 'add_question.dart';

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
        backgroundColor: Colors.white,
        leading: const SizedBox(),
        leadingWidth: 0,
        title: Image.asset(
          'images/backg.png',
          height: 45,
          fit: BoxFit.fitHeight,
          alignment: Alignment.centerLeft,
        ),
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              InkWell(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Filter()));
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border.all(color: Colors.black, width: 0.5)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.menu_open),
                      Text(
                        ' Lọc câu hỏi',
                        style: StyleApp.textStyle700(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              children: List.generate(10, (index) => QuestionTile(
                  mon: 'Toán',
                  deadline: 'Còn 3h',
                  lop: 12,
                  money: 50,
                  time: '1h',
                  ontap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AnswerScreen()));
                  } ,
                  question: 'Đếm số đỉnh, số cạnh của khối bát diện đều.',
                  attach: true,
                  attachCount: 1,
                  first: true,
                  avatar:
                  '')),
            ),
          ),
        ],
      ),
    );
  }
}
