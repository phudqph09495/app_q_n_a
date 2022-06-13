import 'package:flutter/material.dart';
import 'package:app_q_n_a/question_tile.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerScreen extends StatefulWidget {
  @override
  State<AnswerScreen> createState() => _AnswerScreenState();
}

class _AnswerScreenState extends State<AnswerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.orangeAccent.shade100,
        title: Text('Trả lời'),
        leading: IconButton(
            onPressed: () {}, icon: Icon(Icons.arrow_back_ios_new_rounded)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CardQuestion(
                  avatar:
                      'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
                  user: 'tran thanh',
                  time: '11:07 7/6/2022',
                  deadline: 'Đây là deadline',
                  question: 'Đây là câu hỏi',
                  hasImage: true,
                  imageQues:
                      'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg'),
            ],
          ),
        ),
      ),
    );
  }
}

Widget CardQuestion({
  required String avatar,
  required String user,
  required String time,
  required String deadline,
  required String question,
  bool hasImage = false,
  String? imageQues,
}) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image(
                image: NetworkImage(avatar),
                height: 30,
                width: 30,
              ),
              Text(
                '$user       $time',
                style: TextStyle(color: Colors.black.withOpacity(0.3)),
              ),
            ],
          ),
          Text(
            deadline,
            style: GoogleFonts.nunito(
                textStyle: TextStyle(
              color: Colors.black,
              fontSize: 16,
            )),
          ),
          Text(
            question,
            style: GoogleFonts.nunito(
                textStyle: TextStyle(
              color: Colors.black,
              fontSize: 16,
            )),
          ),
          hasImage ? Image(image: NetworkImage(imageQues!)) : Container(),
          SizedBox(
            height: 10,
          )
        ],
      ),
    ),
  );
}
