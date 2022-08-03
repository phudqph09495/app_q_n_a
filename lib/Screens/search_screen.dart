import 'dart:async';
import 'dart:io';

import 'package:app_q_n_a/Screens/add_question.dart';
import 'package:app_q_n_a/Screens/answer_screen.dart';
import 'package:app_q_n_a/bloc/bloc/auth/bloc_getquestion.dart';
import 'package:app_q_n_a/bloc/check_log_state.dart';
import 'package:app_q_n_a/bloc/event_bloc.dart';
import 'package:app_q_n_a/bloc/state_bloc.dart';
import 'package:app_q_n_a/item/input_text.dart';
import 'package:app_q_n_a/item/question_tile.dart';
import 'package:app_q_n_a/models/model_question.dart';
import 'package:app_q_n_a/styles/init_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../styles/colors.dart';
import '../widget/items/dia_log_item.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController search = TextEditingController();
BlocGetQuestion blocGetQuestion=BlocGetQuestion();
  StreamController listController = StreamController.broadcast();
  Stream get imageStream => listController.stream;
  List<ModelQuestion> list=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.whiteF7,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorApp.whiteF0,
        title: Text(
          'Tìm kiếm câu hỏi',
          style: StyleApp.textStyle700(fontSize: 18),
        ),
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
      body:SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: BlocConsumer(
         builder: (_,state){
           if(state is LoadSuccess){
             list=state.data;
             return Column(
               children: [
                 SizedBox(
                   height: 6,
                 ),
                 InputText(
                     onSubmit: (val){
                       blocGetQuestion.add(GetData(keyword: val));
                     }
                     ,
                     textColor: Colors.black,
                     maxline: null,
                     action: TextInputAction.search,
                     suffixIcon: Icon(
                       Icons.close,
                       color: ColorApp.black,
                     ),
                     hint: 'Tìm nội dung, ID câu hỏi bạn quan tâm',
                     controller: search,
                     iconPress: () {
                       search.clear();
                     list.clear();
                     listController.sink.add(list);
                     },
                     colorBorder: Colors.black,
                     colorhint: ColorApp.black.withOpacity(0.3),
                     iconS: true),
                StreamBuilder(
                  stream: imageStream,
                    initialData: list,
                    builder: (context,snapshot){
                  return
                    ListView.builder(
                      itemCount: list.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AnswerScreen(
                                      modelQuestion: list[index],
                                    )));
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Divider(
                                color: Colors.black,
                              ),
                              QuestionTile(context, modelQuestion: list[index]),
                            ],
                          ),
                        );
                      });
                })
               ],
             );
           }

           return  InputText(
               onSubmit: (val){
                 blocGetQuestion.add(GetData(keyword: val));
               }
               ,
               textColor: Colors.black,
               maxline: null,
               action: TextInputAction.search,
               suffixIcon: Icon(
                 Icons.close,
                 color: ColorApp.black,
               ),
               hint: 'Tìm nội dung, ID câu hỏi bạn quan tâm',
               controller: search,
               iconPress: () {
                 search.clear();
               },
               colorBorder: Colors.black,
               colorhint: ColorApp.black.withOpacity(0.3),
               iconS: true);
         },
            listener: (_,StateBloc state){
CheckLogState.check(context, state: state,isShowMsg: false,

);
            },
            bloc: blocGetQuestion,

          ),
        ),
      )
      ,
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




