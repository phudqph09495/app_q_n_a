import 'package:app_q_n_a/Screens/Screens_TaiKhoan/question2_saved.dart';
import 'package:app_q_n_a/Screens/Screens_TaiKhoan/question_saved.dart';
import 'package:app_q_n_a/Screens/comment.dart';
import 'package:app_q_n_a/Screens/login.dart';
import 'package:app_q_n_a/bloc/bloc/auth/bloc_rating_answer.dart';
import 'package:app_q_n_a/bloc/check_log_state.dart';
import 'package:app_q_n_a/bloc/state_bloc.dart';
import 'package:app_q_n_a/config/next_page.dart';
import 'package:app_q_n_a/config/path/share_pref_path.dart';
import 'package:app_q_n_a/config/share_pref.dart';
import 'package:app_q_n_a/item/button.dart';
import 'package:app_q_n_a/item/grid_view.dart';
import 'package:app_q_n_a/item/input_text.dart';
import 'package:app_q_n_a/item/item_answer/build_image_ans.dart';
import 'package:app_q_n_a/item/load_image.dart';
import 'package:app_q_n_a/item/radio_list_tile.dart';
import 'package:app_q_n_a/styles/colors.dart';
import 'package:app_q_n_a/styles/styles.dart';
import 'package:app_q_n_a/widget/items/dia_log_item.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';
import 'package:toast/toast.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';

import '../../bloc/bloc/auth/bloc_get_wallet.dart';
import '../../bloc/bloc/auth/bloc_good_answer.dart';
import '../../bloc/bloc/auth/bloc_report.dart';
import '../../bloc/bloc/question/get_price_bloc.dart';
import '../../bloc/event_bloc.dart';
import '../../config/const.dart';
import '../../models/model_answer.dart';
import '../../models/model_local.dart';
import '../../widget/items/custom_toast.dart';
import '../gridView/grid_view_custom.dart';
import '../input/text_filed2.dart';
import '../item_user.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:app_q_n_a/widget/widget_info/widgetText.dart' as iduser;

class AnswerCard extends StatefulWidget {
  int? user_id;
  bool showAnswer;
  Answer model;
  bool isUser;
  bool hasShow;
  int deadLine;
  int index;
  Function()? refresh;
  List<String> listUserIdAnswer;
  String? ispaid;
  Function()? openQues;


  AnswerCard(
      {required this.model,
      this.user_id,
      this.showAnswer = false,
      this.isUser = true,
      this.hasShow = false,
      this.deadLine = 0,
      this.index = 0,
      this.refresh,
      required this.listUserIdAnswer,
      this.ispaid,
      this.openQues});

  @override
  State<AnswerCard> createState() => _AnswerCardState();
}

class _AnswerCardState extends State<AnswerCard> {
  List<String> listImages = [];
  int groupValue = 0;
  BlocReport blocReport = BlocReport();
  BlocGoodAnswer blocGoodAnswer = BlocGoodAnswer();
  TextEditingController textReport = TextEditingController();
  TextEditingController textTip = TextEditingController();
  TextEditingController textRate = TextEditingController();
  BlocGetPrice blocGetPrice = BlocGetPrice()..add(GetData());
  int user_id = iduser.userID;
  double rate = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getUserId();
    groupValue = Const.convertNumber(widget.model.status).round() == 2
        ? 2
        : Const.convertNumber(widget.model.status).round();
    if (widget.model.images!.isNotEmpty) {
      for (var element in widget.model.images!) {
        listImages.add("${Const.image_host}${element.path}${element.name}");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.openQues,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            !widget.isUser
                ? const SizedBox()
                : Text(
                    'Trả lời',
                    style: StyleApp.textStyle700(
                        fontSize: 20, color: ColorApp.black),
                  ),
            ItemUser(
              username: widget.model.username ?? "",
              time: widget.model.createdAt ?? "",
              image: widget.model.avatar_path.toString() +
                  widget.model.avatar_name.toString(),
            ),
            _buildAnswer(),
          ],
        ),
      ),
    );
  }

  _buildAnswer() {
    if (widget.user_id == user_id ||
        widget.listUserIdAnswer.contains(user_id.toString())) {
      if (widget.model.status == "3" ||
          DateTime.now().millisecondsSinceEpoch >= widget.deadLine ||
          widget.model.userId == user_id.toString() ||
          widget.user_id == user_id) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 10,
            ),
            RatingBarIndicator(
              rating: Const.convertNumber(widget.model.ratings),
              itemBuilder: (context, index) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              itemCount: 5,
              itemSize: 15,
              direction: Axis.horizontal,
            ),
            const SizedBox(
              height: 10,
            ),
            ReadMoreText(
              widget.model.answer ?? "",
              trimLines: 3,
              colorClickableText: ColorApp.orangeF01,
              trimMode: TrimMode.Line,
              trimCollapsedText: 'Xem thêm',
              trimExpandedText: 'Ẩn bớt',
              style: StyleApp.textStyle500(fontSize: 16, color: ColorApp.black),
            ),
            listImages.isNotEmpty
                ? BuildImageAns(
                    listImages: listImages,
                    maxWight: 100,
                    mainAxisExtent: 100,
                  )
                : const SizedBox(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                !widget.isUser
                    ? const SizedBox()
                    : BlocListener(
                        bloc: blocReport,
                        listener: (_, StateBloc state) {
                          CheckLogState.check(context,
                              state: state, msg: "Báo cáo vi phạm thành công");
                        },
                        child: IconButton(
                            onPressed: () {
                              _showDataReport();
                            },
                            icon: const Icon(Icons.report_gmailerrorred,
                                color: Colors.red)),
                      ),
                Expanded(
                  child: BlocListener(
                      bloc: blocGoodAnswer,
                      listener: (_, StateBloc state) {
                        CheckLogState.check(context,
                            state: state,
                            msg: "Trả tiền thành công", success: () {
                          groupValue = 2;
                          context.read<BlocGetWallet>().add(GetData());
                          widget.refresh!();
                        });
                      },
                      child: RadioListTile(
                        visualDensity: const VisualDensity(
                          horizontal: VisualDensity.minimumDensity,
                          vertical: VisualDensity.minimumDensity,
                        ),
                        selectedTileColor: Colors.green,
                        activeColor: Colors.green,
                        contentPadding: EdgeInsets.zero,
                        dense: true,
                        toggleable: true,
                        title: Text(
                          groupValue == 2 ? 'Đã trả tiền' : "Trả tiền",
                          style: StyleApp.textStyle500(
                              color: groupValue == 2
                                  ? Colors.green
                                  : Colors.orange),
                        ),
                        value: 2,
                        groupValue: groupValue,
                        onChanged: (val) async {
                          if (user_id != widget.user_id) {
                            DialogItem.showMsg(
                                context: context,
                                title: "Lỗi",
                                msg: "Đây không phải câu hỏi của bạn");
                          } else if (widget.ispaid == '1') {
                            DialogItem.showMsg(
                                context: context,
                                title: "Lỗi",
                                msg: "Câu hỏi đã được trả thưởng");
                          } else
                            _payment();
                        },
                      )),
                ),
                !widget.isUser ? const SizedBox() : const SizedBox(width: 10),
                !widget.isUser
                    ? const SizedBox()
                    : Button1(
                        height: 35,
                        colorButton: ColorApp.whiteF7,
                        textColor: ColorApp.black,
                        border:
                            Border.all(color: ColorApp.orangeF2, width: 0.5),
                        textButton: 'Bình luận',
                        ontap: () {
                          PageNavigator.next(
                            context: context,
                            page: CommentScreen(
                              answerind: widget.index,
                              quesID:
                                  Const.convertNumber(widget.model.questionId)
                                      .round(),
                              parent_id:
                                  Const.convertNumber(widget.model.id).round(),
                              item: widget.model.items ?? [],
                            ),
                          );
                        },
                      )
              ],
            ),
          ],
        );
      }
    }
    if (widget.hasShow) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 10,
          ),
          RatingBarIndicator(
            rating: Const.convertNumber(widget.model.ratings),
            itemBuilder: (context, index) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            itemCount: 5,
            itemSize: 15,
            direction: Axis.horizontal,
          ),
          const SizedBox(
            height: 10,
          ),
          ReadMoreText(
            widget.model.answer ?? "",
            trimLines: 3,
            colorClickableText: ColorApp.orangeF01,
            trimMode: TrimMode.Line,
            trimCollapsedText: 'Xem thêm',
            trimExpandedText: 'Ẩn bớt',
            style: StyleApp.textStyle500(fontSize: 16, color: ColorApp.black),
          ),
          listImages.isNotEmpty
              ? BuildImageAns(
                  listImages: listImages,
                  maxWight: 100,
                  mainAxisExtent: 100,
                )
              : const SizedBox(),
        ],
      );
    }
    return const SizedBox();
  }

  _payment() async {
    if (widget.model.userId != user_id.toString()) {
      Const.checkLogin(
        context,
        nextPage: () {
          if (groupValue != 2 && user_id == widget.user_id) {
            DialogItem.showPayMent(
                context: context,
                title: "Thanh toán",
                msg: "Xác nhận thanh toán cho người trả lời",
                onTap: () {
                  Navigator.pop(context);
                  _showDataTip();
                });
          } else {
            if (widget.model.userId == widget.user_id.toString()) {
              DialogItem.showMsg(
                  context: context,
                  title: "Lỗi",
                  msg: "Bạn không thể tự trả tiền cho chính mình");
            }
          }
        },
      );
    }
  }

  _showDataReport() {
    textReport.clear();
    showBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      builder: (_) => Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InputText2(
                counter: true,
                hint: 'Nhập thông tin vi phạm',
                keyboardType: TextInputType.multiline,
                maxline: 6,
                controller: textReport,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      if (textReport.text.isNotEmpty) {
                        blocReport.add(reportANS(
                            id: Const.convertNumber(widget.model.id).round(),
                            content: textReport.text));
                      } else {
                        DialogItem.showMsg(
                            context: context,
                            title: "Lỗi",
                            msg: "Vui lòng nhập thông tin vi phạm");
                      }
                    },
                    child: Text(
                      "Gửi báo cáo",
                      style: StyleApp.textStyle500(color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Hủy",
                      style: StyleApp.textStyle500(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _showDataTip() {
    textTip.clear();
    showBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      builder: (_) => Container(
        padding: const EdgeInsets.all(10.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Thưởng thêm cho người trả lời',
                style: StyleApp.textStyle700(fontSize: 16),
              ),
              const SizedBox(height: 10),
              BlocBuilder(
                  bloc: blocGetPrice,
                  builder: (context, state) {
                    final list = state is LoadSuccess
                        ? state.data as List<ModelLocal2>
                        : <ModelLocal2>[];
                    return GridViewCustom(
                      itemCount: list.length,
                      showFull: true,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      mainAxisExtent: 45,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      maxWight: 120,
                      itemBuilder: (_, index) => OutlinedButton(
                        onPressed: () {
                          textTip.text =
                              Const.convertPrice(list[index].id) + " đ";
                        },
                        style: OutlinedButton.styleFrom(
                            primary: Colors.green.shade200,
                            side: BorderSide(
                              color: Colors.green.shade200,
                            )),
                        child: Text(
                          list[index].name.toString(),
                          style: StyleApp.textStyle500(color: Colors.green),
                        ),
                      ),
                    );
                  }),
              const SizedBox(height: 10),
              InputText2(
                textInputFormatter: [
                  CurrencyTextInputFormatter(
                    locale: 'vi',
                    decimalDigits: 0,
                    symbol: 'đ',
                  ),
                ],
                keyboardType: TextInputType.number,
                hint: 'Phần thưởng thêm cho người trả lời',
                controller: textTip,
              ),
              const SizedBox(height: 10),
              RatingBar.builder(
                initialRating: rate,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 25,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  rate = rating;
                },
              ),
              const SizedBox(height: 10),
              InputText2(
                counter: true,
                hint: 'Nhập đánh giá',
                keyboardType: TextInputType.multiline,
                maxline: 6,
                controller: textRate,
                maxLength: 200,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      String priceText = "";
                      if (textTip.text.isNotEmpty) {
                        priceText = textTip.text.replaceAll(".", "").substring(
                            0, textTip.text.replaceAll(".", "").length - 2);
                      }
                      int priceTip = Const.convertNumber(priceText).round();
                      blocGoodAnswer.add(
                        GoodAnswer(
                          id: widget.model.id ?? "",
                          ratings: rate,
                          price_tip: priceTip,
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                    child: Text(
                      "Xác nhận",
                      style: StyleApp.textStyle500(color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      widget.refresh;
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.deepOrange),
                    child: Text(
                      "Hủy",
                      style: StyleApp.textStyle500(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
