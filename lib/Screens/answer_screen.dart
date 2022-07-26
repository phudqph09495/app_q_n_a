// import 'dart:html';

import 'dart:io';

import 'package:app_q_n_a/bloc/bloc/auth/bloc_get_answer.dart';
import 'package:app_q_n_a/bloc/bloc/auth/bloc_good_answer.dart';
import 'package:app_q_n_a/bloc/bloc/auth/bloc_report.dart';
import 'package:app_q_n_a/bloc/check_log_state.dart';
import 'package:app_q_n_a/bloc/event_bloc.dart';
import 'package:app_q_n_a/bloc/state_bloc.dart';
import 'package:app_q_n_a/config/path/share_pref_path.dart';
import 'package:app_q_n_a/config/share_pref.dart';
import 'package:app_q_n_a/item/grid_view.dart' as Grid;
import 'package:app_q_n_a/item/item_answer/item_answer1.dart';
import 'package:app_q_n_a/item/item_answer/item_answer2.dart';
import 'package:app_q_n_a/item/load_image.dart';
import 'package:app_q_n_a/models/model_answer.dart';
import 'package:app_q_n_a/styles/colors.dart';
import 'package:app_q_n_a/styles/init_style.dart';
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
  int? deadline;
  String? question;
  String? username;
  int? createAt;
  int? uqid;
  String? mon;
  String? lop;
  double? money;
  String? qid;
  AnswerScreen(
      {this.deadline,
      this.question,
      this.username,
      this.createAt,
      this.uqid,
      this.money,
      this.lop,
      this.mon,
      this.qid});
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
  //
  // getUserid() async {
  //   int userid = Body.id;
  //   if (userid == 0) {
  //     userStatus = 0;
  //   } else if (userid != widget.uqid) {
  //     userStatus = 1;
  //   } else {
  //     userStatus = 2;
  //   }
  // }


  BlocGetAnswer bloc = BlocGetAnswer();
  BlocReport blocReport = BlocReport();

  BlocGoodAnswer blocGoodAnswer = BlocGoodAnswer();

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

  Future<void> onRefresh() async {
    int userid = Body.id;

    if (userid == 0) {
      userStatus = 0;
    } else if (userid != widget.uqid) {
      userStatus = 1;
    } else {
      userStatus = 2;
    }

    bloc.add(
        getAns(user_id: Body.id, question_id: int.parse(widget.qid ?? '0')));

      int end = widget.deadline!;
      int now = DateTime.now().millisecondsSinceEpoch;
      if (now >= end) {
        timing = false;
      }

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
 onRefresh();
  }

  // showQuestion() {
  //   int end = widget.deadline!;
  //   int now = DateTime.now().millisecondsSinceEpoch;
  //   if (now >= end) {
  //     timing = false;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: BlocBuilder(
        bloc: bloc,
        builder: (_, state) {
          if (state is LoadSuccess) {
            final list = state.data as ModelAnswer;

            return Scaffold(
              bottomSheet: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Button1(
                    colorButton:
                        timing ? ColorApp.orangeF2 : Colors.grey.withOpacity(0.5),
                    textColor: ColorApp.whiteF0,
                    radius: 30,
                    fontSize: 18,
                    style: false,
                    // border: Border.all(color: ColorApp.orangeF2, width: 0.5),
                    textButton:
                        timing ? 'Viết câu trả lời' : 'Đã hết thời gian trả lời',
                    ontap: () {
                      if ((timing == true) && (hasPaid == false)) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Add_Answer_Screen(
                                      user_id: Body.id,
                                      question_id: int.parse(widget.qid ?? '0'),
                                    )));
                      } else if (timing == false) {
                        Toast.show("Đã hết thời gian trả lời câu hỏi",
                            duration: 1, gravity: Toast.bottom);
                      } else if (hasPaid == true) {
                        Toast.show("Câu hỏi đã được trả thưởng",
                            duration: 1, gravity: Toast.bottom);
                      }
                    }),
              ),
              backgroundColor: ColorApp.whiteF0,
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: ColorApp.whiteF0,
                title: Text(
                  '${widget.mon} - ${widget.lop} - ${widget.money} đ',
                  style: StyleApp.textStyle700(
                    fontSize: 18,
                  ),
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
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      QuestionCard(
                        countAns: list.countAnswer,
                        imageFileList: list.images,
                        image: GridView.builder(
                            itemCount: list.images?.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: 2, crossAxisCount: 3),
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return LoadImage(
                                  ans: false,
                                  url:
                                      "http://hoidap.nanoweb.vn/static${list.images?[index].path}${list.images?[index].name}");
                            }),
                        endTime: widget.deadline ?? 0,
                        avatar: '',
                        ques: list.question?.description ?? '',
                        user: widget.username ?? '',
                        time: DateFormat('dd/MM/yyyy, HH:mm').format(
                            DateTime.fromMillisecondsSinceEpoch(
                                widget.createAt! * 1000)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: int.parse(list.countAnswer ?? '0'),
                        itemBuilder: (context, index) {
                          if(
                          list.answer?[index].status=='2'
                          ){
                            hasPaid=true;
                          }
                          return AnswerCard(
                            imageFileList: [],
                            // list.answer?[index].images ,

                            status: 3,
                            //trạng thái của câu trả lời
                            //0: chưa đăng nhập
                            //1: không phải chủ câu hỏi
                            //2: là chủ câu hỏi
                            //3: hiển thị khi hết deadline

                            imageAns: Container()
                            // GridView.builder(
                            //     itemCount: list.answer?[index].images?.length,
                            //     gridDelegate:
                            //         SliverGridDelegateWithFixedCrossAxisCount(
                            //             childAspectRatio: 2, crossAxisCount: 3),
                            //     shrinkWrap: true,
                            //     itemBuilder: (BuildContext context, int index) {
                            //       return LoadImage(
                            //           ans: false,
                            //           url:
                            //               "http://hoidap.nanoweb.vn/static${list.answer?[index].images?[index].path}${list.answer?[index].images?[index].name}");
                            //     })
                            ,
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

                              showPlatformDialog(
                                context: context,
                                builder: (context) => BlocConsumer(
                                  bloc: blocGoodAnswer,
                                  listener: (_,StateBloc state){
                                    CheckLogState.check(context, state: state,msg: "Trả tiền thành công"
                                    ,success: (){
                                      setState((){
                                        value=val;
                                      });
                                      Navigator.pop(context);
                                        });
                                  },
                                  builder: (_,state){
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
                                                list.answer?[index].id ?? '0');
                                            payANS();
                                          },
                                        ),
                                      ],
                                    );
                                  }
                                  ,
                                ),
                              );

                              }
                              else {
                                Toast.show(
                                    "Bạn không thể trả tiền cho câu hỏi của người khác",
                                    duration: 1,
                                    gravity: Toast.bottom);
                              }
                            },

                            time: DateFormat('dd/MM/yyyy, HH:mm').format(
                                    DateTime.fromMillisecondsSinceEpoch(int.parse(
                                            list.answer?[index].createdAt ??
                                                '0')! *
                                        1000)) ??
                                '',
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
                                                list.answer?[index].id ?? '0');
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
                          );
                        },
                      ),
                      SizedBox(
                        height: 100,
                      )
                    ],
                  ),
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
