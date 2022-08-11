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
  List<Color> _colors = <Color>[
    ColorApp.black,
    ColorApp.orangeF0,
    ColorApp.orangeF01,
    ColorApp.blue3D,
    ColorApp.whiteF7,
  ];
  int _currentColorIndex = 0;
  void _incrementColorIndex() {
    setState(() {
      if (_currentColorIndex < _colors.length - 1) {
        _currentColorIndex++;
      } else {
        _currentColorIndex = 0;
      }

      widget.colorButton = _colors[_currentColorIndex];
    });
  }

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
      child: FlatButton(
        onPressed: widget.ontap,
        // onLongPress: () {
        //   setState(() {
        //     _incrementColorIndex();
        //   });
        // },
        height: widget.height,
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

// Widget Button1({
//   String? imagePath,
//   bool icon = false,
//   Function()? ontap,
//   double height = 50,
//   double? width,
//   required Color colorButton,
//   double radius = 5,
//   Border? border,
//   required Color textColor,
//   required String textButton,
// }) {
//   return Container(
//     height: height,
//     width: width,
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(radius),
//       color: colorButton,
//       border: border,
//     ),
//     alignment: Alignment.center,
//     child: FlatButton(onPressed: ontap,
//       height: height,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
// crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           icon ? Image.asset(imagePath!) : SizedBox(),
//           Text(textButton,
//               style: StyleApp.textStyle600(fontSize: 16, color: textColor)),
//         ],
//       ),
//     ),
//   );
// }
