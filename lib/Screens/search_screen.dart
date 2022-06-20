import 'dart:io';

import 'package:app_q_n_a/Screens/add_question.dart';
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
        centerTitle: true,
        backgroundColor: ColorApp.whiteF0,
        title: Text('Tìm kiếm câu hỏi',style: StyleApp.textStyle700(fontSize: 16),),
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

                textColor: Colors.white,
                  maxline: null,
                  hasPass: false,
                  suffixIcon: Icon(Icons.search,color: ColorApp.black,),
                  hint: 'Tìm nội dung, ID câu hỏi bạn quan tâm',
                  controller: search,
                  colorBorder: Colors.black,
                  colorhint: ColorApp.grey4F,
                  iconS: true),
              ListView.builder(
                  itemCount: 50,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Divider(
                          color: Colors.blue,
                        ),
                        Text(
                          'câu hỏi tìm thấy',
                          style: StyleApp.textStyle700(color: ColorApp.black),

                        ),
                        Text('số câu trả lời',
                            style: StyleApp.textStyle700(color: Colors.red)),
                      ],
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
          style: StyleApp.textStyle600(fontSize: 20, color: Colors.white),
        ),
        icon: Icon(Icons.add),
      ),
    );
  }
}
