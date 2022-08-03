import 'package:flutter/material.dart';

import '../../styles/init_style.dart';

Widget itemInput({
  required String title,
  String? hint,
  required TextEditingController controller,
  bool readOnly = false,
  bool obscureText = false,
  GestureTapCallback? onTap,
  String? errorText,
  Function(String)? onChanged,
  Function(String)? validator,
  TextInputType? keyboardType,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: StyleApp.textStyle700()),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          onTap: onTap,
          readOnly: readOnly,
          controller: controller,
          obscureText: obscureText,
          onChanged: onChanged,
          keyboardType: keyboardType,
          style: StyleApp.textStyle400(),
          validator: (val) {
            if (validator != null) {
              return validator(val as String);
            }
          },
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: ColorApp.grey90, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: ColorApp.grey90, width: 1),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 1),
              borderRadius: BorderRadius.circular(5),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: ColorApp.grey90, width: 1),
              borderRadius: BorderRadius.circular(5),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 15),
            hintStyle: StyleApp.textStyle400(),
            errorText: errorText,
            errorStyle: StyleApp.textStyle400(color: Colors.red),
            errorMaxLines: 2,
            hintText: hint ?? title,
          ),
        ),
      ],
    ),
  );
}
