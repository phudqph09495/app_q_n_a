
import 'package:flutter/material.dart';

import '../../styles/init_style.dart';

class InputText2 extends StatefulWidget {
  IconData? iconData;
  bool obscureText;
  bool hasPass;
  bool hasLeading;
  bool readOnly;
  Function(String)? onChanged;
  Function(String)? validator;
  TextEditingController? controller;
  TextInputType? keyboardType;
  double width;
  double radius;
  Color colorBg;
  Color borderColor;
  String hint;
  Function()? onTap;

  InputText2({
    this.onTap,
    this.obscureText = false,
    this.keyboardType,
    this.controller,
    this.onChanged,
    this.iconData,
    this.hasPass = false,
    this.hasLeading = false,
    this.readOnly = false,
    this.validator,
    this.radius = 20,
    this.width = double.infinity,
    this.borderColor = ColorApp.main,
    this.colorBg = Colors.white,
    this.hint = "",
  });

  @override
  State<InputText2> createState() => _InputText2State();
}

class _InputText2State extends State<InputText2> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: widget.width,
      child: TextFormField(
        obscureText: widget.obscureText,
        onTap: widget.onTap,
        readOnly: widget.readOnly,
        onChanged: widget.onChanged,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        style: StyleApp.textStyle400(),
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: StyleApp.textStyle400(color: ColorApp.grey82),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius),
            borderSide:
            const BorderSide(color: ColorApp.black, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius),
            borderSide: BorderSide(color: widget.borderColor, width: 1),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius),
            borderSide: const BorderSide(color: Colors.red, width: 1),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius),
            borderSide:
            const BorderSide(color: ColorApp.black, width: 1),
          ),
          contentPadding: const  EdgeInsets.symmetric(horizontal: 15,vertical: 10),
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
