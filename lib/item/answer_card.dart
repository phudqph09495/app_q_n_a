import 'package:app_q_n_a/Screens/Screens_TaiKhoan/question2_saved.dart';
import 'package:app_q_n_a/Screens/Screens_TaiKhoan/question_saved.dart';
import 'package:app_q_n_a/Screens/comment.dart';
import 'package:app_q_n_a/config/next_page.dart';
import 'package:app_q_n_a/item/button.dart';
import 'package:app_q_n_a/item/input_text.dart';
import 'package:app_q_n_a/item/load_image.dart';
import 'package:app_q_n_a/styles/colors.dart';
import 'package:app_q_n_a/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:readmore/readmore.dart';
import 'package:toast/toast.dart';

class AnswerWidget extends StatefulWidget {
  String avatar;
  String user;
  String time;
  String? deadline;
  String question;
  bool type;
  bool hasImage;
  String? image;
  bool reply;

  Function()? report;

  AnswerWidget(
      {this.deadline,
      required this.question,
      required this.avatar,
      required this.type,
      this.image,
      this.reply = false,
      this.hasImage = false,
      required this.time,
      required this.user,
      this.report});

  @override
  State<AnswerWidget> createState() => _AnswerWidgetState();
}

class _AnswerWidgetState extends State<AnswerWidget> {
  TextEditingController reply = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorApp.whiteF7,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.type
                ? const SizedBox()
                : Text(
                    'Trả lời',
                    style: StyleApp.textStyle700(
                        fontSize: 20, color: ColorApp.black),
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
                      widget.user,
                      style: StyleApp.textStyle500(),
                    ),
                    Text(widget.time, style: StyleApp.textStyle500())
                  ],
                ),
                const SizedBox(
                  width: 110,
                ),
                widget.type
                    ? Button1(
                        ontap: () {
                          Toast.show("Lưu thành công", gravity: Toast.bottom);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QuestionSavedSS()));
                        },
                        colorButton: ColorApp.blue6D,
                        textColor: ColorApp.whiteF0,
                        textButton: 'Lưu',
                        height: 35,
                      )
                    : SizedBox(),
              ],
            ),
            widget.type
                ? const SizedBox(
                    height: 20,
                  )
                : RatingBar.builder(
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
              widget.question,
              trimLines: 3,
              colorClickableText: ColorApp.orangeF01,
              trimMode: TrimMode.Line,
              trimCollapsedText: 'Xem thêm',
              trimExpandedText: 'Ẩn bớt',
              style: StyleApp.textStyle500(fontSize: 16, color: ColorApp.black),
            ),
            widget.hasImage
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image(image: NetworkImage(widget.image!)))
                : Container(),
            const SizedBox(
              height: 10,
            ),
            widget.type
                ? Container()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: widget.report,
                          icon: Image.asset('images/report.png')),
                      const SizedBox(
                        width: 10,
                      ),
                      Button1(
                        height: 35,
                        colorButton: ColorApp.whiteF7,
                        textColor: ColorApp.black,
                        border:
                            Border.all(color: ColorApp.orangeF2, width: 0.5),
                        textButton: 'Bình luận',
                        ontap: () {},
                      )
                    ],
                  ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
