import 'package:app_q_n_a/item/button.dart';
import 'package:app_q_n_a/item/input_text.dart';
import 'package:app_q_n_a/item/load_image.dart';
import 'package:app_q_n_a/styles/colors.dart';
import 'package:app_q_n_a/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:readmore/readmore.dart';

int maxline = 1;
double height = 40;

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
  Function()? report;

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
      required this.user,
      this.report});

  @override
  State<AnswerWidget> createState() => _AnswerWidgetState();
}

class _AnswerWidgetState extends State<AnswerWidget> {
  TextEditingController reply = TextEditingController();
  @override
  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorApp.whiteF0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.type
                ? SizedBox()
                : Text(
                    'Trả lời',
                    style: StyleApp.textStyle700(
                        fontSize: 20, color: ColorApp.black),
                  ),
            Row(
              children: [
                Container(
                  width: 30.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover, image: NetworkImage(widget.avatar)),
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    color: Colors.white,
                  ),
                ),

                const SizedBox(
                  width: 10,
                ),

                Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text('${widget.user}',style: StyleApp.textStyle500(),), Text('${widget.time}',style: StyleApp.textStyle500())],
                )
                ,
          SizedBox(width: 120,),
          widget.type?Button1(ontap: (){},colorButton: ColorApp.blue6D, textColor: ColorApp.whiteF0, textButton: 'Lưu',height: 35,):SizedBox(),
              ],
            ),
            widget.type
                ? SizedBox(height: 20,)

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
              trimLines: 2,
              colorClickableText: ColorApp.orangeF01,
              trimMode: TrimMode.Line,
              trimCollapsedText: 'Hiện thêm',
              trimExpandedText: 'Thu gọn',
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
            widget.reply
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InputText(
                        deadline: () {
                          setState(() {
                            height = 110;
                            maxline = 4;
                          });
                        },
                        width: 270,
                        inputType: TextInputType.multiline,
                        maxline: maxline,
                        height: height,
                        controller: reply,
                        hint: 'Nhập bình luận....',
                        iconS: true,
                        suffixIcon: Icon(
                          Icons.send,
                        ),
                      ),
                    ],
                  )
                : SizedBox(),
            widget.type
                ? Container()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Button1(
                        ontap: widget.report,
                        colorButton: ColorApp.whiteF7,
                        textColor: ColorApp.black,
                        textButton: 'Report',
                        border: Border.all(color: ColorApp.black, width: 0.2),
                        height: 35,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Button1(
                        height: 35,
                        colorButton: ColorApp.whiteF7,
                        textColor: ColorApp.black,
                        border: Border.all(color: ColorApp.black, width: 0.2),
                        textButton: 'Bình luận',
                        ontap: () {
                          setState(() {
                            widget.reply = !widget.reply;
                            if (widget.reply == false) {
                              height = 40;
                              maxline = 1;
                            }
                          });
                        },
                      )
                    ],
                  ),
            SizedBox(
              height: 5,
            ),
            widget.reply
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 3,
                          itemBuilder: (context, int index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 8),
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 70,
                                  ),
                                  LoadImage(
                                    url: widget.imageReply,
                                    height: 30,
                                    width: 30,
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: ReadMoreText(
                                      'Câu trả lời rất chính xác',
                                      trimLines: 2,
                                      colorClickableText: ColorApp.blue6D,
                                      trimMode: TrimMode.Line,
                                      trimCollapsedText: 'Hiện thêm',
                                      trimExpandedText: 'Thu gọn',
                                      style: StyleApp.textStyle400(
                                          fontSize: 16, color: ColorApp.black),
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
