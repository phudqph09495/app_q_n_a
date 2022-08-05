import 'package:flutter/material.dart';

import '../../../../config/const.dart';
import '../../../../path/image_path.dart';
import '../../../../styles/init_style.dart';

class ItemTab extends StatelessWidget {
  String? price;
  String? time;
  String note;
  ItemTab({this.time, this.price,required this.note});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 0.5),
        ),
        color: Colors.white
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            ImagesPath.walletTransfer,
            width: 40,
            height: 40,
            color: ColorApp.orangeF8,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    note,
                    style: StyleApp.textStyle700(),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          '${Const.convertPrice(price)} Đ',
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style:
                          StyleApp.textStyle400(color: ColorApp.orangeF01),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        Const.formatTime(Const.convertNumber(time).round() * 1000,
                            format: "HH:mm dd/MM/yyyy"),
                        style: StyleApp.textStyle400(),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
