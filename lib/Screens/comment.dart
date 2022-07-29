import 'dart:io';

import 'package:app_q_n_a/bloc/bloc/auth/bloc_get_answer.dart';
import 'package:app_q_n_a/bloc/event_bloc.dart';
import 'package:app_q_n_a/bloc/state_bloc.dart';
import 'package:app_q_n_a/config/const.dart';
import 'package:app_q_n_a/item/input_text.dart';
import 'package:app_q_n_a/item/load_image.dart';
import 'package:app_q_n_a/models/model_answer.dart';
import 'package:app_q_n_a/styles/init_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readmore/readmore.dart';
import 'package:toast/toast.dart';

class CommentScreen extends StatefulWidget {
  int quesID;
  int parent_id;
  int user_id;
  List<Items> item;
  CommentScreen(
      {required this.quesID, required this.parent_id, required this.item,required this.user_id});
  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {


  TextEditingController reply = TextEditingController();








  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  Scaffold(
        bottomSheet: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: InputText(
            iconPress: () {
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
                itemCount: widget.item.length,
                itemBuilder: (context,  index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      children: [
                        Text(widget.item[index].username??'hello',style:StyleApp.textStyle600(fontSize: 14) ,),
                        const SizedBox(
                          width: 15,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Text(Const.checkTime(Const.convertNumber(widget.item[index].createdAt??00).round())??'hi'),
                              Text(
                                widget.item[index].answer??'hi',
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
