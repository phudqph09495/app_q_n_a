
import 'package:flutter/material.dart';

import '../../styles/init_style.dart';

class InputText3 extends StatefulWidget {
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

  InputText3({
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
    this.radius = 5,
    this.width = double.infinity,
    this.borderColor = ColorApp.main,
    this.colorBg = Colors.white,
    this.hint = "",
  });

  @override
  State<InputText3> createState() => _InputText3State();
}

class _InputText3State extends State<InputText3> {
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
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: ColorApp.orangeF0, width: 0.5),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: Colors.red, width: 0.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
                color: ColorApp.black.withOpacity(0.2), width: 0.5),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: Colors.red, width: 0.5),

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
