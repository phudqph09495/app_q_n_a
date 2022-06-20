import 'package:app_q_n_a/styles/init_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class InputText extends StatefulWidget {
  Color textColor;
      int? maxline;
  bool readOnly;
      double? height;
      double? width;
  bool iconS ;
      TextInputType inputType ;
      Icon? suffixIcon;
   bool hasPass;
  String hint;
  Color colorhint;
      Color colorBorder ;
  Function()? deadline;
     TextEditingController controller;
InputText({ this.colorhint=Colors.black45, this.textColor=Colors.black,this.maxline,this.readOnly= false,required this.controller,this.colorBorder= Colors.black,this.inputType= TextInputType.multiline,this.deadline,this.height,required this.hint, required this.hasPass,this.iconS=false,this.suffixIcon,this.width});
  @override
  State<InputText> createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height:widget.height,
      width: widget.width,
      child: TextFormField(
        style: TextStyle(color:widget.textColor),
        onTap: widget.deadline,
        readOnly: widget.readOnly,
        maxLines: widget.maxline,
        keyboardType: widget.inputType,
        controller: widget.controller,
        decoration: InputDecoration(

            suffixIcon: widget.iconS
                ? IconButton(
              onPressed: () {

              },
              icon: widget.suffixIcon!,
            )
                : null,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.blue, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.red, width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
              BorderSide(color: widget.colorBorder.withOpacity(0.2), width: 2),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.red, width: 2),
            ),
            hintText: widget.hint,
            hintStyle: StyleApp.textStyle700(color: widget.colorhint)),
        onChanged: (val) {},
        textAlign: TextAlign.left,
        obscureText: widget.hasPass,
      ),
    );
  }
}


