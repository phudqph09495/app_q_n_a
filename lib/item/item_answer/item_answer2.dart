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

List<String> report = [
  'Spam',
  'Trả lời sai',
  'Quấy rồi',
  'Bắt nạt',
  'Xúc phạm',
  'Lạc đề',
  'Sai chính tả',
  'Không phù hợp',
  'Thiếu sáng tạo',
];

class AnswerCard extends StatefulWidget {
  String avatar;
  String user;
  String time;
  String answer;
  String imageAns;
  int status;

  AnswerCard({
    required this.time,
    required this.user,
    required this.avatar,
    required this.answer,
    this.imageAns = '',
    this.status = 0,
  });

  @override
  State<AnswerCard> createState() => _AnswerCardState();
}

class _AnswerCardState extends State<AnswerCard> {
  @override
  Widget build(BuildContext context) {
    if ((widget.status == 0) || (widget.status == 1) || (widget.status == 2)) {
      return InkWell(
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
                content: Text("Bạn không phải người hỏi câu hỏi này"),
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

          ;
        },
        child: Card(
          color: ColorApp.whiteF7,
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Center(
              child: Text(
                '..... đã trả lời câu hỏi của bạn',
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
              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                itemSize: 20,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
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
              (widget.imageAns != '')
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image(image: NetworkImage(widget.imageAns!)))
                  : Container(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        showPlatformDialog(
                          context: context,
                          builder: (context) => BasicDialogAlert(
                            title: Text("Báo cáo câu trả lời"),
                            content: Container(
                              height: 250,
                              width: 200,
                              child: SingleChildScrollView(
                                child: FilterList(
                                  color: Colors.white,
                                  title: '',
                                  column: 1,
                                  list: report,
                                  space: 5.5,
                                ),
                              ),
                            ),
                            actions: <Widget>[
                              BasicDialogAction(
                                title: Text(
                                  "Report",
                                  style:
                                      StyleApp.textStyle500(color: Colors.red),
                                ),
                                onPressed: () {
                                  Toast.show("Ý kiến của bạn đã được ghi nhận",
                                      duration: 3, gravity: Toast.bottom);

                                  Future.delayed(Duration(milliseconds: 2000),
                                      () {
                                    Navigator.pop(context);
                                  });
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
      ;
    }
  }
}
