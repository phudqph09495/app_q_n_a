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
    return SafeArea(
      child: Scaffold(
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
          toolbarHeight: 110,
          backgroundColor: ColorApp.whiteF0,
          elevation: 0,
          flexibleSpace: Padding(
            padding: EdgeInsets.only(left: 13),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 12,
                ),
                Image.asset(
                  'images/backg2.png',
                  height: 45,
                  fit: BoxFit.fitHeight,
                  alignment: Alignment.centerLeft,
                ),
                SizedBox(
                  height: 10,
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
                            style: StyleApp.textStyle700(fontSize: 16),
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

            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric( horizontal: 10),
                children: List.generate(
                    10,
                    (index) => QuestionTile(
                        mon: 'Toán',
                        deadline: 'Còn 3h',
                        lop: 12,
                        money: 50000,
                        time: '1h',
                        ontap: () {

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AnswerScreen()));
                        },
                        question: 'Đếm số đỉnh, số cạnh của khối bát diện đều.',
                        attach: true,
                        attachCount: 1,
                        first: true,
                        avatar: '')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
