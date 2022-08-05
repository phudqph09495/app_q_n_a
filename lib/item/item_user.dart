import 'package:app_q_n_a/item/load_image.dart';
import 'package:flutter/material.dart';

import '../config/const.dart';
import '../styles/init_style.dart';

class ItemUser extends StatefulWidget {

  String image ;
  String username;
  String time;
  bool isSave;
  bool isSHowSave;
  Function()? onTap;

  ItemUser({
    required this.username,
    this.image = "",
    this.time = '',
    this.isSave = false,
    this.isSHowSave = false,
    this.onTap
});

  @override
  State<ItemUser> createState() => _ItemUserState();
}

class _ItemUserState extends State<ItemUser> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: LoadImage(
              url: Const.image_host + widget.image,
              height: 35,
              width: 35,
              fit: BoxFit.cover,
            )),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
               widget.username,
                overflow: TextOverflow.ellipsis,
                style: StyleApp.textStyle500(fontSize: 16),
              ),
              Text(
                Const.formatTime(
                    Const.convertNumber(widget.time)
                        .round() *
                        1000,
                    format: "dd/MM/yyyy HH:mm"),
                style: StyleApp.textStyle400(color: ColorApp.grey82),
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ),
        SizedBox(width: widget.isSHowSave ? 10 : 0),
        widget.isSHowSave ? ElevatedButton(
          onPressed: (){
            widget.isSave = !widget.isSave;
            setState((){});
            widget.onTap!();
          },
          style: ElevatedButton.styleFrom(primary: ColorApp.blue6D),
          child: Text(
            widget.isSave ? "Hủy" : "Lưu",
            style: StyleApp.textStyle700(color: Colors.white),
          ),
        ) : const SizedBox(),
      ],
    );
  }
}
