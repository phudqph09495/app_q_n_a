import 'dart:io';

import 'package:app_q_n_a/config/path/share_pref_path.dart';
import 'package:app_q_n_a/config/share_pref.dart';
import 'package:app_q_n_a/item/item_answer/item_answer1.dart';
import 'package:app_q_n_a/item/item_answer/item_answer2.dart';
import 'package:app_q_n_a/styles/colors.dart';
import 'package:app_q_n_a/styles/init_style.dart';
import 'package:flutter/material.dart';
import 'package:app_q_n_a/item/button.dart';
import 'package:app_q_n_a/Screens/add_answer.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:intl/intl.dart';
import 'package:toast/toast.dart';
import 'Screens_TaiKhoan/body_product.dart' as Body;

class AnswerScreen extends StatefulWidget {
  int? deadline;
  String? question;
  String? username;
  int? createAt;
  int? uqid;
  String? mon;
  String? lop;
  double? money;
  AnswerScreen(
      {this.deadline, this.question, this.username, this.createAt, this.uqid,this.money,this.lop,this.mon});
  @override
  State<AnswerScreen> createState() => _AnswerScreenState();
}

class _AnswerScreenState extends State<AnswerScreen> {
  var groupValue = 0;

  int value = -1;
  bool hasPaid = false;
  List<int> i = [0, 1, 2, 2, 3, 5];
  bool timing = true;
  late int kq;

  getUserid() async {
    int userid = Body.id;
    print(userid);
    if ( userid == 0) {
      kq = 0;
    }
   else if (userid != widget.uqid) {
      kq = 1;
    } else {
      kq = 2;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserid();
    showQuestion();
    print(kq);

  }

  showQuestion() {
    int end = widget.deadline!;
    int now = DateTime.now().millisecondsSinceEpoch;
    if (now >= end) {
      timing = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
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
                        builder: (context) => Add_Answer_Screen()));
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
                endTime: widget.deadline??0,
                avatar: '',
                ques: widget.question??'',
                user: widget.username??'',
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
                itemCount: 4,
                itemBuilder: (context, index) {
                  return AnswerCard(
                    status: timing ? kq : 3,
                    //trạng thái của câu trả lời
                    //0: chưa đăng nhập
                    //1: không phải chủ câu hỏi
                    //2: là chủ câu hỏi
                    //3: hiển thị khi hết deadline
                    value: index,
                    groupValue: value,
                    title: Text(
                      'Trả tiền',
                      style: StyleApp.textStyle500(fontSize: 14),
                    ),
                    onchanged: (val) {
                      if (kq == 2) {
                        if (hasPaid == false) {
                          showPlatformDialog(
                            context: context,
                            builder: (context) => BasicDialogAlert(
                              title: Text("Thanh toán"),
                              content:
                                  Text("Xác nhận thanh toán cho người trả lời"),
                              actions: <Widget>[
                                BasicDialogAction(
                                  title: Text("Từ chối"),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                BasicDialogAction(
                                  title: Text("Đồng ý"),
                                  onPressed: () {
                                    setState(() {
                                      Toast.show("Thanh toán thành công",
                                          duration: 2, gravity: Toast.bottom);

                                      Navigator.pop(context);
                                      value = val;
                                      hasPaid = true;
                                    });
                                  },
                                ),
                              ],
                            ),
                          );
                        } else {
                          Toast.show(
                              "Bạn chỉ có thể thanh toán cho 1 câu trả lời",
                              duration: 1,
                              gravity: Toast.bottom);
                        }
                      } else {
                        Toast.show(
                            "Bạn không thể trả tiền cho câu hỏi của người khác",
                            duration: 1,
                            gravity: Toast.bottom);
                      }
                    },

                    time: '12:00 14/06/2022',
                    user: 'Nguyen van nam',
                    avatar: '',
                    answer: 'Khối bát diện đều có 6 đỉnh, 12 cạnh',
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
}
