import 'package:flutter/material.dart';

import '../../styles/init_style.dart';

Widget Button2({
  required String title,
  Color bgColor = Colors.white,
  double height = 45,
  double width = double.infinity,
  double radius = 45,
  double fontSize = 14,
  Border? border,
  Color textColor = ColorApp.main,
  Function()? onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: height,
      width: width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: bgColor,
        border: border,
      ),
      child: Text(title,
          style: StyleApp.textStyle700(color: textColor, fontSize: fontSize),
          overflow: TextOverflow.ellipsis),
    ),
  );
}
