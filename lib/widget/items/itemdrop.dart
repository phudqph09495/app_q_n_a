import 'package:app_q_n_a/widget/items/dropdown.dart';
import 'package:flutter/material.dart';

import '../../styles/init_style.dart';

Widget itemDrop({
  required String title,
  required String hint,
  dynamic value,
  required Function(dynamic) onChanged,
  Function(dynamic)? validator,
  required List items,
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
        DropDown1(
          onChanged: onChanged,
          hint: hint,
          listItem: items,
          value: value,
          filled: false,
          colorBorder: ColorApp.grey90,
          validator: (val) => validator!(val),
        ),
      ],
    ),
  );
}
