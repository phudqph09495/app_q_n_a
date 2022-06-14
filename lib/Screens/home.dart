import 'package:app_q_n_a/Screens/answer_screen.dart';
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
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddQuestion()));
        },
        label: Text('Đặt câu hỏi'),
        icon: Icon(Icons.add),
        
      ),
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent.shade100,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.black.withOpacity(0.5),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
             Header(context),
              ListQuestion(ontap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AnswerScreen()));
              }),

            ],
          ),
        ),
      ),
    );
  }
}
