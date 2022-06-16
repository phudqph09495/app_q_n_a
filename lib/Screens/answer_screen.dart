import 'dart:io';

import 'package:app_q_n_a/styles/colors.dart';
import 'package:app_q_n_a/styles/init_style.dart';
import 'package:flutter/material.dart';
import 'package:app_q_n_a/item/question_tile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app_q_n_a/item/button.dart';
import 'package:readmore/readmore.dart';
import 'package:app_q_n_a/Screens/add_answer.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
class AnswerScreen extends StatefulWidget {
  @override
  State<AnswerScreen> createState() => _AnswerScreenState();
}

class _AnswerScreenState extends State<AnswerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text('Trả lời', style: StyleApp.textStyle700(fontSize: 18),),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Platform.isAndroid ? Icons.back_hand : Icons.arrow_back_ios,
            color: ColorApp.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
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
                  image:
                      'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg'),
              SizedBox(height: 10,),
              Button1(
                ontap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Add_Answer_Screen()));
                },
                  colorButton: Colors.blue,
                  textColor: Colors.white,
                  textButton: 'Viết câu trả lời'),
              SizedBox(height: 10,),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        CardWidget(
                            avatar: 'https://tinypng.com/images/social/website.jpg',
                            user: 'người trả lời',
                            time: '12:00 14/06/2022',
                            hasImage: true,
                            image:'https://tinypng.com/images/social/website.jpg',
                            question: 'đây là câu trả lời',
                            type: false),
                        SizedBox(height: 10,)
                      ],
                    );
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
   String? deadline,
  required String question,
  required bool type,
  bool hasImage = false,
  String? image,
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
         type? Text(
            deadline!,
            style: GoogleFonts.nunito(
                textStyle: TextStyle(
              color: Colors.black,
              fontSize: 16,
            )),
          ):RatingBar.builder(
           initialRating: 3,
           minRating: 1,
           itemSize: 20,
           direction: Axis.horizontal,
           allowHalfRating: true,
           itemCount: 5,
           itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
           itemBuilder: (context, _) => Icon(
             Icons.star,
             color: Colors.amber,
           ),
           onRatingUpdate: (rating) {
             print(rating);
           },
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
          hasImage ? Image(image: NetworkImage(image!)) : Container(),
          SizedBox(
            height: 10,
          )
        ],
      ),
    ),
  );
}
