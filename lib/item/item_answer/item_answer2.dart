import 'package:app_q_n_a/Screens/Screens_TaiKhoan/question2_saved.dart';
import 'package:app_q_n_a/Screens/Screens_TaiKhoan/question_saved.dart';
import 'package:app_q_n_a/Screens/comment.dart';
import 'package:app_q_n_a/Screens/login.dart';
import 'package:app_q_n_a/config/next_page.dart';
import 'package:app_q_n_a/item/button.dart';
import 'package:app_q_n_a/item/grid_view.dart';
import 'package:app_q_n_a/item/input_text.dart';
import 'package:app_q_n_a/item/load_image.dart';
import 'package:app_q_n_a/item/radio_list_tile.dart';
import 'package:app_q_n_a/styles/colors.dart';
import 'package:app_q_n_a/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:readmore/readmore.dart';
import 'package:toast/toast.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';



class AnswerCard extends StatefulWidget {
  String avatar;
  String user;
  String time;
  String answer;
  List<dynamic> imageFileList ;
  Widget imageAns;
  int status;
  var value;

  var groupValue;
  ValueChanged? onchanged;
  Widget? title;
  Widget IconReport;
Function()? report;
  AnswerCard(
      {required this.time,
      required this.user,
      required this.avatar,
      required this.answer,
        required this.imageAns ,
      this.status = 0,
      this.value,
      this.groupValue,
      this.onchanged,
        required this.IconReport,
required this.imageFileList,
      this.title,this.report});

  @override
  State<AnswerCard> createState() => _AnswerCardState();
}

class _AnswerCardState extends State<AnswerCard> {
  @override
  Widget build(BuildContext context) {
    if ((widget.status == 0) || (widget.status == 1) || (widget.status == 2)) {
      return
        InkWell(
        onTap: () {
          if (widget.status == 0) {
            showPlatformDialog(
              context: context,
              builder: (context) => BasicDialogAlert(
                title: Text("Lỗi"),
                content: Text("Bạn phải đăng nhập để xem"),
                actions: <Widget>[
                  BasicDialogAction(
                    title: Text("Trở lại"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  BasicDialogAction(
                    title: Text("Đăng nhập"),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                  ),
                ],
              ),
            );
          } else if (widget.status == 1) {
            showPlatformDialog(
              context: context,
              builder: (context) => BasicDialogAlert(
                title: Text("Lỗi"),
                content: Text("Bạn chưa thể xem câu trả lời này bây giờ"),
                actions: <Widget>[
                  BasicDialogAction(
                    title: Text("Trở lại"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            );
          } else if (widget.status == 2) {

            setState(() {
              widget.status = 3;
            });
          }
        },
        child:
        Card(
          color: ColorApp.whiteF7,
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Center(
              child: Text(
                '..... đã trả lời câu hỏi',
                style: StyleApp.textStyle400(color: ColorApp.blue6D),
              ),
            ),
          ),
        ),
      );
    } else {
      return Card(
        color: ColorApp.whiteF7,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Trả lời',
                style:
                    StyleApp.textStyle700(fontSize: 20, color: ColorApp.black),
              ),
              Row(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: LoadImage(
                        url: widget.avatar,
                        height: 40,
                        width: 40,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${widget.user}',
                        style: StyleApp.textStyle500(),
                      ),
                      Text('${widget.time}', style: StyleApp.textStyle500())
                    ],
                  ),
                ],
              ),
     SizedBox(height: 10,),
              ReadMoreText(
                widget.answer,
                trimLines: 2,
                colorClickableText: ColorApp.orangeF01,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'Hiện thêm',
                trimExpandedText: 'Thu gọn',
                style:
                    StyleApp.textStyle500(fontSize: 16, color: ColorApp.black),
              ),
              ( widget.imageFileList.isNotEmpty)
                  ? widget.imageAns:SizedBox(),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  widget.IconReport,
                  Container(
                    width: 140,
                    child: RadioListTile<int>(
                        visualDensity: const VisualDensity(
                          horizontal: VisualDensity.minimumDensity,
                          vertical: VisualDensity.minimumDensity,
                        ),
                        selectedTileColor: Colors.green,
                        activeColor: Colors.green,
                        contentPadding: EdgeInsets.zero,
                        dense: true,
                        toggleable: true,
                        title: (widget.value == widget.groupValue)
                            ? Text(
                                'Đã trả tiền',
                                style:
                                    StyleApp.textStyle500(color: Colors.green),
                              )
                            : widget.title,
                        value: widget.value,
                        groupValue: widget.groupValue,
                        onChanged: widget.onchanged),
                  ),
                  Button1(
                    height: 35,
                    colorButton: ColorApp.whiteF7,
                    textColor: ColorApp.black,
                    border: Border.all(color: ColorApp.orangeF2, width: 0.5),
                    textButton: 'Bình luận',
                    ontap: () {
                      PageNavigator.next(
                          context: context, page: CommentScreen());
                    },
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      );
    }
  }
}
