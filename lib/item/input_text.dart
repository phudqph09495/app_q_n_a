import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget InputText({
  int? maxline,

  bool readOnly=false,
  double? height,
  TextInputType inputType=TextInputType.multiline,
  required bool hasPass,
  required String hint,
Function()? deadline,
  required TextEditingController controller,
}) {
  return Container(
    height: height,
    child: TextFormField(

      onTap: deadline,
      readOnly: readOnly,
      maxLines: maxline,
      keyboardType: inputType,
      controller: controller,
      decoration: InputDecoration(

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(1),
            borderSide: BorderSide(color: Colors.blue, width: 1),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(1),
            borderSide: const BorderSide(color: Colors.red, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(1),
            borderSide:
                BorderSide(color: Colors.black.withOpacity(0.2), width: 1),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(1),
            borderSide: const BorderSide(color: Colors.red, width: 1),
          ),
          hintText: hint,
          hintStyle: GoogleFonts.nunito(textStyle: TextStyle(fontSize: 14))),
      onChanged: (val) {},
      textAlign: TextAlign.left,
      obscureText: hasPass,

    ),
  );
}
