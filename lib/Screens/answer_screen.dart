import 'package:flutter/material.dart';
import 'package:app_q_n_a/item/question_tile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app_q_n_a/item/button.dart';
import 'package:readmore/readmore.dart';
import 'package:app_q_n_a/Screens/add_answer.dart';
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
              CardWidget(
                  type: true,
                  avatar:
                      'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
                  user: 'tran thanh',
                  time: '11:07 7/6/2022',
                  deadline: 'Đây là deadline',
                  question: 'Đây là câu hỏi',
                  hasImage: true,
                  imageQues:
                      'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg'),
              Button1(
                ontap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Add_Answer_Screen()));
                },
                  colorButton: Colors.blue,
                  textColor: Colors.white,
                  textButton: 'Viết câu trả lời'),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return CardWidget(
                        avatar: 'https://tinypng.com/images/social/website.jpg',
                        user: 'người trả lời',
                        time: '12:00 14/06/2022',
                        deadline: '',
                        question: 'đây là câu trả lời',
                        type: false);
                  })
            ],
          ),
        ),
      ),
    );
  }
}

Widget CardWidget({
  required String avatar,
  required String user,
  required String time,
  required String deadline,
  required String question,
  required bool type,
  bool hasImage = false,
  String? imageQues,
}) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          type
              ? Text(
                  'Câu hỏi',
                  style: GoogleFonts.nunito(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                )
              : Text('Câu trả lời',
                  style: GoogleFonts.nunito(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold))),
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
          ReadMoreText(
            question,
            trimLines: 2,
            colorClickableText: Colors.pink,
            trimMode: TrimMode.Line,
            trimCollapsedText: 'Hiện thêm',
            trimExpandedText: 'Thu gọn',
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
