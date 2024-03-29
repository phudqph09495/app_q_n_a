import 'package:app_q_n_a/styles/init_style.dart';
import 'package:flutter/material.dart';

class DropItem extends StatefulWidget {
  List listItem;
  String hint;
  dynamic value;
  bool filled;
  ValueChanged valueChanged;
  double radius;
  Color? colorBorder;

  DropItem({
    required this.listItem,
    required this.hint,
    this.value,
    required this.valueChanged,
    this.filled = true,
    this.radius = 5,
    this.colorBorder,
  });

  @override
  State<DropItem> createState() => _DropItemState();
}

class _DropItemState extends State<DropItem> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: widget.value,
      onChanged: (val) {
        return widget.valueChanged(val);
      },
      isExpanded: true,
      style: StyleApp.textStyle400(),
      hint: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          widget.hint,
          style: StyleApp.textStyle400(color: ColorApp.grey82),
        ),
      ),
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: ColorApp.orangeF2, width: 0.5),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.red, width: 0.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
                BorderSide(color: Colors.black.withOpacity(0.2), width: 0.5),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.red, width: 0.5),
          ),
          fillColor:
              widget.filled ? ColorApp.blue1F.withOpacity(0.1) : Colors.white,
          filled: widget.filled,
          contentPadding: const EdgeInsets.symmetric(horizontal: 15)),
      items: List.generate(
        widget.listItem.length,
        (index) => DropdownMenuItem(
          child: Text(
            widget.listItem[index].name.toString(),
            style: StyleApp.textStyle400(),
          ),
          value: widget.listItem[index],
        ),
      ),
    );
  }
}
