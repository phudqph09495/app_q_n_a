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

      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorApp.main,
        title: const Text('Tìm kiếm câu hỏi'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              InputText(
                textColor: Colors.white,
                  maxline: 1,
                  hasPass: false,
                  hint: 'Tìm nội dung, ID câu hỏi bạn quan tâm',
                  controller: search,
                  colorBorder: Colors.black,
                  colorhint: Colors.black,
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
                          style: StyleApp.textStyle700(color: Colors.black.withOpacity(0.5)),
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
