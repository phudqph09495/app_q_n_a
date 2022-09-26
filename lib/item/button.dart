import 'package:app_q_n_a/styles/init_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Button1 extends StatefulWidget {
  String? imagePath;
  bool icon;
  Function()? ontap;
  double height;
  double? width;
  double fontSize;
  Color colorButton;
  double radius;
  Border? border;
  Color textColor;
  bool style;
  String textButton;
  Button1(
      {this.height = 50,
      this.ontap,
      required this.colorButton,
      this.icon = false,
      required this.textColor,
      required this.textButton,
      this.width,
      this.border,
      this.imagePath,
      this.radius = 5,
      this.fontSize = 14,
      this.style = true});

  @override
  State<Button1> createState() => _Button1State();
}

class _Button1State extends State<Button1> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.radius),
        color: widget.colorButton,
        border: widget.border,
      ),
      alignment: Alignment.center,
      child: TextButton(
        onPressed: widget.ontap,

       style: TextButton.styleFrom(minimumSize: Size(80, widget.height),padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            widget.icon ? Image.asset(widget.imagePath!) : SizedBox(),
            Text(widget.textButton,
                style: widget.style
                    ? StyleApp.textStyle600(
                        fontSize: widget.fontSize, color: widget.textColor)
                    : StyleApp.textStyle900(
                        fontSize: widget.fontSize, color: widget.textColor)),
          ],
        ),
      ),
    );
  }
}


