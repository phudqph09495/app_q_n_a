import 'dart:io';

import 'package:app_q_n_a/Screens/add_question.dart';
import 'package:app_q_n_a/Screens/answer_screen.dart';
import 'package:app_q_n_a/item/input_text.dart';
import 'package:app_q_n_a/styles/init_style.dart';
import 'package:flutter/material.dart';

import '../styles/colors.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: ColorApp.whiteF7,
      appBar: AppBar(

        backgroundColor: ColorApp.whiteF0,
        title: Text('Tìm kiếm câu hỏi',style: StyleApp.textStyle700(fontSize: 18),),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
            color: ColorApp.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              SizedBox(height: 6,),
              InputText(

                textColor: Colors.black,
                  maxline: null,
action: TextInputAction.search,
                  suffixIcon: Icon(Icons.close,color: ColorApp.black,),
                  hint: 'Tìm nội dung, ID câu hỏi bạn quan tâm',
                  controller: search,
                  iconPress: (){
                  search.clear();
                  },
                  colorBorder: Colors.black,
                  colorhint: ColorApp.black.withOpacity(0.3 ),
                  iconS: true),
              ListView.builder(
                  itemCount: 50,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: (){ Navigator.push(
                          context, MaterialPageRoute(builder: (context) => AnswerScreen()));},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Divider(
                            color: Colors.black,
                          ),
                          Text(
                            'Đếm số đỉnh, số cạnh của khối bát diện đều.',
                            style: StyleApp.textStyle500(color: ColorApp.black),

                          ),
                          Text('số câu trả lời: 2',
                              style: StyleApp.textStyle500(color: Colors.red)),
                        ],
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
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
    );
  }
}
