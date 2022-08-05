// import 'dart:html';

import 'dart:io';

import 'package:app_q_n_a/Screens/comment.dart';
import 'package:app_q_n_a/Screens/login.dart';
import 'package:app_q_n_a/bloc/bloc/auth/bloc_get_answer.dart';
import 'package:app_q_n_a/bloc/bloc/auth/bloc_good_answer.dart';
import 'package:app_q_n_a/bloc/bloc/auth/bloc_report.dart';
import 'package:app_q_n_a/bloc/check_log_state.dart';
import 'package:app_q_n_a/bloc/event_bloc.dart';
import 'package:app_q_n_a/bloc/state_bloc.dart';
import 'package:app_q_n_a/config/const.dart';
import 'package:app_q_n_a/config/next_page.dart';
import 'package:app_q_n_a/item/grid_view.dart' as Grid;
import 'package:app_q_n_a/item/item_answer/item_answer1.dart';
import 'package:app_q_n_a/item/item_answer/item_answer2.dart';
import 'package:app_q_n_a/item/load_image.dart';
import 'package:app_q_n_a/models/model_answer.dart';
import 'package:app_q_n_a/models/model_question.dart';
import 'package:app_q_n_a/styles/init_style.dart';
import 'package:app_q_n_a/widget/items/dia_log_item.dart';
import 'package:app_q_n_a/widget/items/item_load_page.dart';
import 'package:flutter/material.dart';
import 'package:app_q_n_a/item/button.dart';
import 'package:app_q_n_a/Screens/add_answer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:intl/intl.dart';
import 'package:toast/toast.dart';
import '../config/path/share_pref_path.dart';
import '../config/share_pref.dart';
import 'Screens_TaiKhoan/body_product.dart' as Body;

late int ansid;
late String ansCon;
late int goodid;
List<String> reportList = [
  'Spam',
  'Trả lời sai',
  'Quấy rối',
  'Bắt nạt',
  'Xúc phạm',
  'Lạc đề',
  'Sai chính tả',
  'Không phù hợp',
  'Thiếu sáng tạo',
];

class AnswerScreen extends StatefulWidget {
  ModelQuestion modelQuestion;

  AnswerScreen({required this.modelQuestion});

  @override
  State<AnswerScreen> createState() => _AnswerScreenState();
}

class _AnswerScreenState extends State<AnswerScreen> {
  BlocGetAnswer bloc = BlocGetAnswer();
  BlocReport blocReport = BlocReport();
  int end = 0;
  int now = 0;
  bool isPass = false;


  report() async {
    blocReport
        .add(reportANS(user_id: Body.id, id: ansid, content: Grid.content));
  }


  Future<void> onRefresh() async {
    bloc.add(getAns(question_id: int.parse(widget.modelQuestion.id ?? '0')));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    onRefresh();
     end = Const.convertNumber(widget.modelQuestion.deadline).round() * 1000;

  }

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    now = DateTime.now().millisecondsSinceEpoch;
    return Scaffold(backgroundColor: ColorApp.whiteF0,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: Button1(
            colorButton:
            end > now && !isPass? ColorApp.orangeF2 : Colors.grey.withOpacity(0.5),
            textColor: ColorApp.whiteF0,
            radius: 30,
            fontSize: 18,
            height: 40,
            style: false,
            textButton:
            end > now && !isPass ? 'Viết câu trả lời' : 'Đã hết thời gian trả lời',
            ontap: end > now && !isPass ? _send : null,
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorApp.whiteF0,
        iconTheme: const IconThemeData(
          color: Colors.black
        ),
        title: Text(
          '${widget.modelQuestion.subjectName ?? 'Lĩnh vực khác'} - ${widget.modelQuestion.className} - ${Const.convertNumber(widget.modelQuestion.priceGift)} đ',
          style: StyleApp.textStyle700(fontSize: 18,),
        ),
      ),
      body: BlocConsumer(
        bloc: bloc,
        listener: (_,StateBloc state){
          if(state is LoadSuccess){
            final model =state.data as ModelAnswer;
            for (var element in model.answer!) {
              if(element.status == "2"){
                isPass = true;
                setState((){});
              }
            }
          }
        },
        builder: (_, StateBloc state) {
          final model =
              state is LoadSuccess ? state.data as ModelAnswer : ModelAnswer.fromJson({});
          return ItemLoadPage(
              state: state,
              onTapErr: () {
                onRefresh();
              },
              success: RefreshIndicator(
                onRefresh: onRefresh,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      QuestionCard(
                        modelQuestion: widget.modelQuestion,
                        modelAnswer: model,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      model.answer!.isEmpty ?
                      Text("Chưa có người trả lời\ncho câu hỏi này",textAlign: TextAlign.center, style: StyleApp.textStyle400(),)
                          : ListView.builder(
                        physics:const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: int.parse(model.countAnswer ?? '0'),
                        itemBuilder: (context, index) {
                          return AnswerCard(
                            model: model.answer![index],
                            user_id: model.question!.userId,
                            comment: () {
                              PageNavigator.next(
                                context: context,
                                page: CommentScreen(
                                  answerind: index,
                                  user_id: Body.id,
                                  quesID: model.question?.id ?? 0,
                                  parent_id: int.parse(
                                      (model.answer?[index].id) ?? ''),
                                  item: model.answer?[index].items ?? [],
                                ),
                              );
                            },
                          );
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }

  _send() async {
    Const.checkLogin(context, nextPage: () async {
      now = DateTime.now().millisecondsSinceEpoch;
      var user_id = await (SharedPrefs.readString(SharePrefsKeys.user_id));
      if(user_id != widget.modelQuestion.userId && end > now && !isPass){
        PageNavigator.next(context: context, page: Add_Answer_Screen(
          user_id: Body.id,
          question_id:
          int.parse(widget.modelQuestion.id ?? '0'),
        )).then((value) => onRefresh());
      }else{
        String err = "Lỗi kết nối";

        if(end <= now){
          err = "Đã hết thời gian trả lời câu hỏi";
        }
        if(user_id == widget.modelQuestion.userId){
          err = "Bạn không thể trả lời câu hỏi của mình";
        }
        if(isPass){
          err = "Câu hỏi đã được trả thưởng";
        }
        DialogItem.showMsg(context: context, title: "Lỗi", msg: err);
      }
    });
  }
}
