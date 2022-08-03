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

  int? maxline;
  bool counter;

  InputText2({
    this.maxline,
    this.counter = false,
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
    this.radius = 10,
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
        maxLines: widget.maxline,
        obscureText: widget.obscureText,
        onTap: widget.onTap,
        readOnly: widget.readOnly,
        onChanged: widget.onChanged,
        controller: widget.controller,
        maxLength: 5000,
        buildCounter: (context,
            {required currentLength, required isFocused, maxLength}) {
          return widget.counter
              ? Container(
                  transform:
                      Matrix4.translationValues(0, -kToolbarHeight + 25, 0),
                  child: Text(
                    "$currentLength/$maxLength kí tự",
                    style: StyleApp.textStyle400(color: Colors.black45),
                  ),
                )
              : SizedBox();
        },
        keyboardType: widget.keyboardType,
        style: StyleApp.textStyle400(),
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: StyleApp.textStyle400(color: ColorApp.grey82),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: ColorApp.orangeF0, width: 0.5),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.red, width: 0.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
                BorderSide(color: ColorApp.black.withOpacity(0.2), width: 0.5),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.red, width: 0.5),
          ),
          contentPadding: EdgeInsets.only(left: 33, top: 15, right: 20),
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
