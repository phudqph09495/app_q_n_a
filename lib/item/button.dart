import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget Button1({
  String? IconData,
  bool icon = false,
  Function()? ontap,
  double height = 52,
  double? width,
  required Color colorButton,
  double radius = 5,
  Border? border,
  required Color textColor,
  required String textButton,
}) {
  return InkWell(
    onTap: ontap,
    child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: colorButton,
        border: border,
      ),
      alignment: Alignment.center,
      child: Text(
        textButton,
        style: GoogleFonts.nunito(
            textStyle: TextStyle(fontSize: 16, color: textColor)),
      ),
    ),
  );
}
