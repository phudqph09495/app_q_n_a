import 'package:app_q_n_a/item/button.dart';
import 'package:app_q_n_a/item/input_text.dart';
import 'package:app_q_n_a/item/load_image.dart';
import 'package:app_q_n_a/styles/colors.dart';
import 'package:app_q_n_a/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:readmore/readmore.dart';

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
  String imageReply;

  AnswerWidget(
      {this.deadline,
      this.imageReply = '',
      required this.question,
      required this.avatar,
      required this.type,
      this.image,
      this.reply = false,
      this.hasImage = false,
      required this.time,
      required this.user});

  @override
  State<AnswerWidget> createState() => _AnswerWidgetState();
}

class _AnswerWidgetState extends State<AnswerWidget> {
  TextEditingController reply = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.type
                ? Text(
                    'Câu hỏi',
                    style: StyleApp.textStyle700(fontSize: 20),
                  )
                : Text('Trả lời', style: StyleApp.textStyle700(fontSize: 20)),
            Row(
              children: [
                Image(
                  image: NetworkImage(widget.avatar),
                  height: 30,
                  width: 30,
                ),
                SizedBox(
                  width: 30,
                ),
                Text(
                  '${widget.user}       ${widget.time}',
                  style: TextStyle(color: Colors.black.withOpacity(0.3)),
                ),
              ],
            ),
            widget.type
                ? Text(
                    widget.deadline!,
                    style: StyleApp.textStyle500(fontSize: 16),
                  )
                : RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    itemSize: 20,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
            ReadMoreText(
              widget.question,
              trimLines: 2,
              colorClickableText: Colors.pink,
              trimMode: TrimMode.Line,
              trimCollapsedText: 'Hiện thêm',
              trimExpandedText: 'Thu gọn',
              style: StyleApp.textStyle500(fontSize: 16),
            ),
            widget.hasImage
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image(image: NetworkImage(widget.image!)))
                : Container(),
            SizedBox(
              height: 10,
            ),
            widget.type
                ? Container()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Button1(
                        colorButton: ColorApp.whiteF7,
                        textColor: ColorApp.black,
                        textButton: 'Report',
                        ontap: () {},
                      ),
                      Button1(
                        colorButton: ColorApp.whiteF7,
                        textColor: ColorApp.black,
                        textButton: 'Trả lời',
                        ontap: () {
                          setState(() {
                            widget.reply = !widget.reply;
                          });
                        },
                      ),

                    ],
                  ),
            widget.reply
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      InputText(
                        width: 270,
                        maxline: null,
                        controller: reply,
                        hint: 'Nhâp bình luận',
                        hasPass: false,
                        iconS: true,
                        suffixIcon: Icon(Icons.send),
                      ),
                      ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: (context, int index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 8),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 70,
                                  ),
                                  LoadImage(
                                    url: widget.imageReply,
                                    height: 30,
                                    width: 30,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: ReadMoreText(
                                      'Replyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy',
                                      trimLines: 2,
                                      colorClickableText: Colors.blue,
                                      trimMode: TrimMode.Line,
                                      trimCollapsedText: 'Hiện thêm',
                                      trimExpandedText: 'Thu gọn',
                                      style:
                                          StyleApp.textStyle400(fontSize: 16),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          })
                    ],
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
