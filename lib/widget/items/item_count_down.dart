import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';

import '../../styles/init_style.dart';

class ItemCountDown extends StatefulWidget {
  int time;
  ItemCountDown({required this.time});

  @override
  State<ItemCountDown> createState() => _ItemCountDownState();
}

class _ItemCountDownState extends State<ItemCountDown> {
  @override
  Widget build(BuildContext context) {
    return CountdownTimer(
      endTime: widget.time,
      widgetBuilder: (_, CurrentRemainingTime? time) {
        if (time == null) {
          return Text(
            'Đã hết giờ',
            style: StyleApp.textStyle500(color: ColorApp.red),
          );
        }
        return
          Row(
          children: [
            Text('Còn ',
                style:
                StyleApp.textStyle500(color: ColorApp.blue6D)),
            (time.days != null)
                ? Text('${time.days} ngày ',
                style: StyleApp.textStyle500(
                    color: ColorApp.blue6D))
                : const SizedBox(),
            (time.hours != null)
                ? Text('${time.hours} giờ ',
                style: StyleApp.textStyle500(
                    color: ColorApp.blue6D))
                : const SizedBox(),
            (time.min != null)
                ? Text('${time.min} phút ',
                style: StyleApp.textStyle500(
                    color: ColorApp.blue6D))
                : const SizedBox(),
            (time.sec != null)
                ? Text('${time.sec} giây',
                style: StyleApp.textStyle500(
                    color: ColorApp.blue6D))
                : const SizedBox(),
          ],
        );
      },
    );
  }
}
