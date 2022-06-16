import 'package:app_q_n_a/styles/init_style.dart';
import 'package:flutter/material.dart';
import '../../../screens_y/product/widget/widgetIcons.dart';

Widget getAppBottomView() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    child: Row(
      children: [
        getProfileView(),
        const SizedBox(width: 10,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Họ và tên:',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: StyleApp.textStyle700(color: Colors.white,fontSize: 16),
              ),
              Text(
                'Id thành viên',maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: StyleApp.textStyle700(color: Colors.white,fontSize: 16),
              ),
              Text(
                'Điểm',maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: StyleApp.textStyle700(color: Colors.white,fontSize: 16),
              ),
            ],
          ),
        ),
        // const SizedBox(width: 10,),
        // IconButton(onPressed: (){}, icon: const Icon(Icons.settings, color: Colors.white,))
      ],
    ),
  );
}
