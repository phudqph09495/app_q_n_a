import 'package:flutter/material.dart';

import '../../styles/init_style.dart';

class ItemLoad extends StatefulWidget {
  String title;
  ItemLoad({this.title = "Đang tải"});
  @override
  State<ItemLoad> createState() => _ItemLoadState();
}

class _ItemLoadState extends State<ItemLoad> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 200,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.black.withOpacity(0.75),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator(
            color: Colors.white,
            strokeWidth: 2,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            widget.title,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: StyleApp.textStyle400(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
