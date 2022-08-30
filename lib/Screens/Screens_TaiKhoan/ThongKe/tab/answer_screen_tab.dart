import 'package:app_q_n_a/Screens/add_answer.dart';
import 'package:app_q_n_a/bloc/bloc/auth/bloc_get_answer.dart';
import 'package:app_q_n_a/bloc/bloc/question/bloc_save_question.dart';
import 'package:app_q_n_a/bloc/check_log_state.dart';
import 'package:app_q_n_a/bloc/event_bloc.dart';
import 'package:app_q_n_a/bloc/state_bloc.dart';
import 'package:app_q_n_a/config/const.dart';
import 'package:app_q_n_a/config/next_page.dart';
import 'package:app_q_n_a/config/path/share_pref_path.dart';
import 'package:app_q_n_a/config/share_pref.dart';
import 'package:app_q_n_a/item/button.dart';
import 'package:app_q_n_a/item/item_answer/build_image_ans.dart';
import 'package:app_q_n_a/item/item_answer/item_answer1.dart';
import 'package:app_q_n_a/item/item_user.dart';
import 'package:app_q_n_a/models/model_answer.dart';
import 'package:app_q_n_a/styles/colors.dart';
import 'package:app_q_n_a/widget/items/dia_log_item.dart';
import 'package:app_q_n_a/widget/items/item_count_down.dart';
import 'package:app_q_n_a/widget/items/item_load_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readmore/readmore.dart';

import '../../../../item/item_answer/item_answer2.dart';
import '../../../../styles/styles.dart';
import 'package:app_q_n_a/widget/widget_info/widgetText.dart' as user;


class AnswerScreenTab extends StatefulWidget {
  int quesID;
  AnswerScreenTab({required this.quesID});

  @override
  State<AnswerScreenTab> createState() => _AnswerScreenTabState();
}

class _AnswerScreenTabState extends State<AnswerScreenTab> {
  int end = 0;
  int now = 0;
  bool isPass = false;
  BlocGetAnswer blocGetAnswer = BlocGetAnswer();
  BlocSaveQuestion blocSaveQuestion = BlocSaveQuestion();
  Future<void> onRefresh() async {
    blocGetAnswer.add(getAns(question_id: widget.quesID));
  }
  ModelAnswer modelAnswer=ModelAnswer();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    onRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: blocGetAnswer,
        builder: (_, StateBloc state) {

          if(state is LoadSuccess) {
             modelAnswer=state.data as ModelAnswer;
            List<String> listImages = [];
            if (modelAnswer.images!.isNotEmpty) {
              for (var image in modelAnswer.images!) {
                listImages.add("${Const.image_host}${image.path}${image.name}");
              }
            }
            now = DateTime.now().millisecondsSinceEpoch;

            for (var element in modelAnswer.answer!) {
              if(element.status == "2"){
                isPass = true;

              }
            }
            end = Const.convertNumber(modelAnswer.question!.deadline).round() * 1000;
            return   Scaffold(
              backgroundColor: ColorApp.whiteF0,
              bottomNavigationBar: Container(
                color: Colors.white,
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
                  '${modelAnswer.subjectName ?? 'Lĩnh vực khác'} - ${modelAnswer.className} - ${Const.convertNumber(modelAnswer.question!.priceGift)} đ',
                  style: StyleApp.textStyle700(fontSize: 18,),
                ),
              ),
              body:
              ItemLoadPage(
                  state: state,
                  onTapErr: () {
                    onRefresh();
                  },
                  success: RefreshIndicator(
                    onRefresh: onRefresh,
                    child:  SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          // QuestionCard(
                          //   modelQuestion: widget.modelQuestion,
                          //   modelAnswer: model,
                          // ),

                          Container(
                            padding: const EdgeInsets.all(10),
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                BlocListener(
                                  bloc: blocSaveQuestion,
                                  listener: (_,StateBloc state){
                                    CheckLogState.check(context, state: state,
                                        msg: "Lưu câu hỏi thành công"
                                    );
                                  },
                                  child: ItemUser(username:
                                    modelAnswer.userName??'',
                                    image:modelAnswer.avatarPath1.toString()+modelAnswer.avatarName1.toString(),
                                    time: modelAnswer.question!.createdAt.toString() ?? "",
                                    onTap: (){
                                      blocSaveQuestion.add(GetData(
                                          id:modelAnswer.question!.id.toString()
                                      ));
                                    },
                                    isSHowSave: true,
                                  ),

                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                ItemCountDown(
                                    time: Const.convertNumber(modelAnswer.question!.deadline).round() *
                                        1000),
                                const SizedBox(
                                  height: 10,
                                ),const SizedBox(
                                  height: 10,
                                ),
                                Text(modelAnswer.question!.question ?? "", style: StyleApp.textStyle500(),),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: ColorApp.whiteF0,
                                      borderRadius: BorderRadius.circular(5)),
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      ReadMoreText(
                                        modelAnswer.question!.description ?? "",
                                        trimLines: 3,
                                        colorClickableText: ColorApp.orangeF01,
                                        trimMode: TrimMode.Line,
                                        trimCollapsedText: 'Xem thêm',
                                        trimExpandedText: 'Ẩn bớt',
                                        style: StyleApp.textStyle500(fontSize: 16),
                                      ),
                                      listImages.isNotEmpty
                                          ? BuildImageAns(listImages: listImages)
                                          : const SizedBox(),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          modelAnswer.answer!.isEmpty ?
                          Text("Chưa có người trả lời\ncho câu hỏi này",textAlign: TextAlign.center, style: StyleApp.textStyle400(),)
                              : ListView.builder(
                            physics:const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: modelAnswer.answer!.length,
                            itemBuilder: (context, index) {
                              return AnswerCard(
                                refresh: onRefresh,
                                listUserIdAnswer: modelAnswer.listUseridAnswer ?? [],
                                model: modelAnswer.answer![index],
                                user_id: modelAnswer.question!.userId,
                                deadLine: Const.convertNumber(modelAnswer.question!.deadline).round() * 1000,
                                index: index,
                                ispaid:modelAnswer.question!.isComplete.toString() ,
                              );
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                  )),
            );
          }
return Container();
        });
  }










  _send() async {
    Const.checkLogin(context, nextPage: () async {
      now = DateTime.now().millisecondsSinceEpoch;
      var user_id = await (SharedPrefs.readString(SharePrefsKeys.user_id));
      if(user_id != modelAnswer.question!.userId.toString() && end > now && !isPass &&user.iskyc){
        PageNavigator.next(context: context, page: Add_Answer_Screen(
          user_id: user_id,
          question_id: modelAnswer.question!.id??0 ,
        )).then((value) => onRefresh());
      }else{
        String err = "Lỗi kết nối";

        if(end <= now){
          err = "Đã hết thời gian trả lời câu hỏi";
        }
        if(user_id == modelAnswer.question!.userId){
          err = "Bạn không thể trả lời câu hỏi của mình";
        }
        if(isPass){
          err = "Câu hỏi đã được trả thưởng";
        }
        if(user.iskyc==false){
          err="Thông tin của bạn chưa xác thực nên không thể thực hiện thao tác này ";
        }
        DialogItem.showMsg(context: context, title: "Lỗi", msg: err);
      }
    });
  }


}
