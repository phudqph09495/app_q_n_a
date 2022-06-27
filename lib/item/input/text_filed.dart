import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../styles/init_style.dart';

class InputText1 extends StatefulWidget {
  IconData? iconData;
  bool obscureText;
  bool hasPass;
  bool hasLeading;
  String label;
  Function(String)? onChanged;
  Function(String)? validator;
  TextEditingController? controller;
  TextInputType? keyboardType;
  double width;
  double radius;
  Color colorBg;
  Color borderColor;

  InputText1({
    this.obscureText = false,
    required this.label,
    this.keyboardType,
    this.controller,
    this.onChanged,
    this.iconData,
    this.hasPass = false,
    this.hasLeading = false,
    this.validator,
    this.radius = 20,
    this.width = double.infinity,
    this.borderColor = ColorApp.main,
    this.colorBg = Colors.white,
  });

  @override
  State<InputText1> createState() => _InputText1State();
}

class _InputText1State extends State<InputText1> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: widget.width,
      child: TextFormField(
        obscureText: widget.obscureText,
        onChanged: widget.onChanged,
        controller: widget.controller,

        keyboardType: widget.keyboardType,
        textAlign: TextAlign.left,
        style: StyleApp.textStyle400(),
        decoration: InputDecoration(

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius),
            // borderSide:
            // const BorderSide(color: ColorApp.black, width: 1),
            borderSide: BorderSide(color: ColorApp.orangeF2, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius),
            borderSide:  BorderSide(color: Colors.black.withOpacity(0.2), width: 2),
            // borderSide:
            // const BorderSide(color: ColorApp.black, width: 1),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius),
            borderSide: const BorderSide(color: Colors.red, width: 2),
            // borderSide:
            // const BorderSide(color: ColorApp.black, width: 1),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius),
            borderSide:
                BorderSide(color: Colors.red, width: 2),
            // borderSide:
            // const BorderSide(color: ColorApp.black, width: 1),
          ),
          filled: true,
          fillColor: widget.colorBg,

          contentPadding:  EdgeInsets.only(left: 15,top: 10),

          prefixIcon:
          widget.hasLeading ? Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Icon(widget.iconData, color: ColorApp.black.withOpacity(0.5)),
          ): null,
          labelText: widget.label,
          labelStyle:
          StyleApp.textStyle400(),
          suffixIcon: widget.hasPass
              ? InkWell(
                  onTap: () {
                    widget.obscureText = !widget.obscureText;
                    setState(() {});
                  },
                  child: Icon(
                      !widget.obscureText
                          ? CupertinoIcons.eye
                          : CupertinoIcons.eye_slash,
                      color: ColorApp.black.withOpacity(0.5)),
                )
              : null,
          errorText: null,
        ),
        validator: (val) {
          if (val != null && widget.validator != null) {
            return widget.validator!(val);
          }
          return null;
        },
      ),
    );
  }
}
