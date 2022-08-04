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
import 'package:app_q_n_a/config/path/share_pref_path.dart';
import 'package:app_q_n_a/config/share_pref.dart';
import 'package:app_q_n_a/item/grid_view.dart' as Grid;
import 'package:app_q_n_a/item/item_answer/item_answer1.dart';
import 'package:app_q_n_a/item/item_answer/item_answer2.dart';
import 'package:app_q_n_a/item/load_image.dart';
import 'package:app_q_n_a/models/model_answer.dart';
import 'package:app_q_n_a/models/model_question.dart';
import 'package:app_q_n_a/styles/colors.dart';
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
  var groupValue = 0;
  int? valueReport;
  int value = -1;
  bool hasPaid = false;
  List<int> i = [0, 1, 2, 2, 3, 5];
  bool timing = true;
  late int userStatus;

  int userid = Body.id;
  BlocGetAnswer bloc = BlocGetAnswer();
  BlocReport blocReport = BlocReport();

  BlocGoodAnswer blocGoodAnswer = BlocGoodAnswer();
  late int answerStatus;

  // getANS() async {
  //   bloc.add(
  //       getAns(user_id: Body.id, question_id: int.parse(widget.qid ?? '0')));
  // }

  report() async {
    blocReport
        .add(reportANS(user_id: Body.id, id: ansid, content: Grid.content));
  }

  payANS() async {
    blocGoodAnswer.add(goodAns(user_id: Body.id, answer_id: goodid));
  }

  getAnswerStatus() {
    if (timing == true) {
      answerStatus = userStatus;
    }

    if ((timing == false) && (userStatus == 0)) {
      answerStatus = userStatus;
    }
    if ((timing == false) && (userStatus != 0)) {
      answerStatus = 3;
    }
  }

  Future<void> onRefresh() async {
    if (userid == 0) {
      userStatus = 0;
    } else if (userid !=
        Const.convertNumber(widget.modelQuestion.userId).round()) {
      userStatus = 1;
    } else {
      userStatus = 2;
    }

    bloc.add(getAns(question_id: int.parse(widget.modelQuestion.id ?? '0')));

    int end = Const.convertNumber(widget.modelQuestion.deadline).round() * 1000;
    int now = DateTime.now().millisecondsSinceEpoch;
    if (now >= end) {
      timing = false;
    }
    getAnswerStatus();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    onRefresh();
  }

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      backgroundColor: ColorApp.whiteF0,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10,left: 10,right: 10,top: 5),
        child: Button1(
            colorButton:
                timing ? ColorApp.orangeF2 : Colors.grey.withOpacity(0.5),
            textColor: ColorApp.whiteF0,
            radius: 30,
            fontSize: 18,
            style: false,
            textButton:
                timing ? 'Viết câu trả lời' : 'Đã hết thời gian trả lời',
            ontap: _send,
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
      body: BlocBuilder(
        bloc: bloc,
        builder: (_, StateBloc state) {
          final list =
              state is LoadSuccess ? state.data as ModelAnswer : ModelAnswer();
          return ItemLoadPage(
              state: state,
              onTapErr: () {
                onRefresh();
              },
              success: RefreshIndicator(
                onRefresh: onRefresh,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        QuestionCard(
                          countAns: list.countAnswer,
                          imageFileList: list.images,
                          image: GridView.builder(
                              itemCount: list.images?.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      childAspectRatio: 2, crossAxisCount: 3),
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return LoadImage(
                                    ans: false,
                                    url:
                                        "${Const.image_host}${list.images?[index].path}${list.images?[index].name}");
                              }),
                          endTime:
                              Const.convertNumber(widget.modelQuestion.deadline)
                                      .round() *
                                  1000,
                          avatar: '',
                          ques: list.question?.description ?? '',
                          user: widget.modelQuestion.username ?? '',
                          time: Const.formatTime(
                              Const.convertNumber(
                                          widget.modelQuestion.createdAt)
                                      .round() *
                                  1000,
                              format: "dd/MM/yyyy HH:mm"),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ListView.builder(
                          physics:const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: int.parse(list.countAnswer ?? '0'),
                          itemBuilder: (context, index) {
                            if (list.answer?[index].status == '2') {
                              hasPaid = true;
                            }
                            return AnswerCard(
                              imageFileList: list.answer?[index].images ?? [],

                              status: answerStatus,
                              //trạng thái của câu trả lời
                              //0: chưa đăng nhập
                              //1: không phải chủ câu hỏi
                              //2: là chủ câu hỏi
                              //3: hiển thị khi hết deadline

                              imageAns: GridView.builder(
                                  itemCount: list.answer?[index].images?.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          childAspectRatio: 2,
                                          crossAxisCount: 3),
                                  shrinkWrap: true,
                                  itemBuilder:
                                      (BuildContext context, int index2) {
                                    return LoadImage(
                                        ans: true,
                                        url:
                                            "${Const.image_host}${list.answer?[index].images?[index2].path}${list.answer?[index].images?[index2].name}");
                                  }),
                              value: index,
                              groupValue: (list.answer?[index].status == '2')
                                  ? index
                                  : value,

                              title: Text(
                                'Trả tiền',
                                style: StyleApp.textStyle500(fontSize: 14),
                              ),
                              onchanged: (val) {
                                if (userStatus == 2) {
                                  if (hasPaid == false) {
                                    showPlatformDialog(
                                      context: context,
                                      builder: (context) => BlocConsumer(
                                        bloc: blocGoodAnswer,
                                        listener: (_, StateBloc state) {
                                          CheckLogState.check(context,
                                              state: state,
                                              msg: "Trả tiền thành công",
                                              success: () {
                                            setState(() {
                                              value = val;
                                            });
                                            Navigator.pop(context);
                                          });
                                        },
                                        builder: (_, state) {
                                          return BasicDialogAlert(
                                            title: Text("Thanh toán"),
                                            content: Text(
                                                "Xác nhận thanh toán cho người trả lời"),
                                            actions: <Widget>[
                                              BasicDialogAction(
                                                title: Text("Trở lại"),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                              ),
                                              BasicDialogAction(
                                                title: Text("Đồng ý"),
                                                onPressed: () {
                                                  goodid = int.parse(
                                                      list.answer?[index].id ??
                                                          '0');
                                                  payANS();
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    );
                                  } else {
                                    DialogItem.showMsg(
                                        context: context,
                                        title: "Lỗi",
                                        msg:
                                            "Câu hỏi \"${list.question?.question}\" đã có câu trả lời đúng nhất");
                                  }
                                } else {
                                  Toast.show(
                                      "Bạn không thể trả tiền cho câu hỏi của người khác",
                                      duration: 1,
                                      gravity: Toast.bottom);
                                }
                              },

                              time: Const.formatTime(
                                  int.parse(list.answer?[index].createdAt ??
                                          "0") *
                                      1000,
                                  format: "dd/MM/yyyy HH:mm"),
                              user: list.answer?[index].username ?? '',
                              avatar: '',
                              answer: list.answer?[index].answer ?? '',

                              IconReport: IconButton(
                                  onPressed: () {
                                    showPlatformDialog(
                                      context: context,
                                      builder: (context) => BasicDialogAlert(
                                        title: Text("Báo cáo câu trả lời"),
                                        content: Container(
                                          height: 250,
                                          width: 200,
                                          child: SingleChildScrollView(
                                            child: Grid.FilterList(
                                              value: valueReport,
                                              color: Colors.white,
                                              title: '',
                                              column: 1,
                                              list: reportList,
                                              space: 5.5,
                                            ),
                                          ),
                                        ),
                                        actions: <Widget>[
                                          BasicDialogAction(
                                            title: Text(
                                              "Report",
                                              style: StyleApp.textStyle500(
                                                  color: Colors.red),
                                            ),
                                            onPressed: () {
                                              ansid = int.parse(
                                                  list.answer?[index].id ??
                                                      '0');
                                              report();
                                              CheckLogState.check(context,
                                                  state: state,
                                                  msg:
                                                      "Ý kiến của bạn đã được ghi nhận",
                                                  success: () {});
                                            },
                                          ),
                                          BasicDialogAction(
                                            title: Text(
                                              "Trở lại",
                                              style: StyleApp.textStyle400(),
                                            ),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  icon: Image.asset('images/report.png')),
                              comment: () {
                                PageNavigator.next(
                                  context: context,
                                  page: CommentScreen(
                                    answerind: index,
                                    user_id: Body.id,
                                    quesID: list.question?.id ?? 0,
                                    parent_id: int.parse(
                                        (list.answer?[index].id) ?? ''),
                                    item: list.answer?[index].items ?? [],
                                  ),
                                );
                              },
                            );
                          },
                        ),
                        const SizedBox(
                          height: 100,
                        )
                      ],
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }
  _send(){
    if ((timing == true) && (hasPaid == false) && (userStatus == 1)) {
      PageNavigator.next(context: context, page: Add_Answer_Screen(
        user_id: Body.id,
        question_id:
        int.parse(widget.modelQuestion.id ?? '0'),
      )).then((value) => onRefresh());
    } else if (userStatus == 0) {
      showPlatformDialog(
        context: context,
        builder: (context) => BasicDialogAlert(
          title: Text("Lỗi",style: StyleApp.textStyle500(),),
          content: Text("Bạn phải đăng nhập để xem",style: StyleApp.textStyle400(),),
          actions: <Widget>[
            BasicDialogAction(
              title: Text("Trở lại",style: StyleApp.textStyle500(),),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            BasicDialogAction(
              title: Text("Đăng nhập", style: StyleApp.textStyle500(),),
              onPressed: () {
                PageNavigator.next(context: context, page: LoginScreen());
              },
            ),
          ],
        ),
      );
    } else if (userStatus == 2) {
      Toast.show("Bạn không thể trả lời câu hỏi của mình",
          duration: 1, gravity: Toast.bottom);
    } else if (timing == false) {
      Toast.show("Đã hết thời gian trả lời câu hỏi",
          duration: 1, gravity: Toast.bottom);
    } else if (hasPaid == true) {
      Toast.show("Câu hỏi đã được trả thưởng",
          duration: 1, gravity: Toast.bottom);
    }
  }
}
