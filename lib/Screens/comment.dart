import 'dart:io';

import 'package:app_q_n_a/item/input_text.dart';
import 'package:app_q_n_a/item/load_image.dart';
import 'package:app_q_n_a/styles/init_style.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:toast/toast.dart';

class CommentScreen extends StatefulWidget {
  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  String avatar = '';
  List<String> commentList = [];

  TextEditingController reply = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomSheet: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: InputText(
            iconPress: () {
              setState(() {
                (reply.text != '')
                    ? commentList.add(reply.text)
                    : Toast.show("Bạn chưa thêm bình luận",
                        duration: 1, gravity: Toast.bottom);
                ;
              });
              reply.clear();
            },
            width: double.infinity,
            inputType: TextInputType.multiline,
            maxline: null,
            controller: reply,
            hint: 'Nhập bình luận....',
            iconS: true,
            suffixIcon: Icon(
              Icons.send,
            ),
          ),
        ),
        backgroundColor: ColorApp.whiteF7,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: ColorApp.whiteF0,
          title: Text(
            'Bình luận',
            style: StyleApp.textStyle700(
              fontSize: 18,
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {});
            },
            icon: Icon(
              Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
              color: ColorApp.black,
            ),
          ),
        ),
        body: SingleChildScrollView(
          reverse: true,
          child: Padding(
            padding: EdgeInsets.all(8),
            child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: commentList.length,
                itemBuilder: (context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: LoadImage(
                            url: avatar,
                            height: 40,
                            width: 40,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '3 phút trước',
                                style: StyleApp.textStyle400(fontSize: 12),
                              ),
                              Text(
                                commentList[index],
                                style: StyleApp.textStyle600(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
