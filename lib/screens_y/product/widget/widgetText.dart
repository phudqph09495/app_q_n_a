import 'package:flutter/material.dart';
import '../../../screens_y/product/widget/widgetIcons.dart';

Widget getAppBottomView() {
  return Container(
    padding: const EdgeInsets.only(left: 30, bottom: 20),
    child: Row(
      children: [
        getProfileView(),
        Container(
          margin: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Họ và tên:',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
              Text(
                'Id thành viên',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
              Text(
                'Điểm',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
