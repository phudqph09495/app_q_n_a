import 'dart:convert';
import 'dart:ui';

import 'package:app_q_n_a/config/const.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:overlay_support/overlay_support.dart';
import '../../../../../main.dart';
import '../../Screens/Screens_Notification/screens_news.dart';
import '../../Screens/Screens_Pays/ScreensViPays.dart';
import '../../Screens/Screens_TaiKhoan/ThongKe/tab/answer_screen_tab.dart';
import '../../config/next_page.dart';
import '../../models/model_notifi.dart';
import '../../styles/styles.dart';

class FirebaseSendNotifi {
  static showNotification(RemoteMessage message, BuildContext context) async {
    print(message.data);
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
            'full screen channel id', 'full screen channel name',
            channelDescription: 'full screen channel description',
            priority: Priority.high,
            importance: Importance.high,
            ticker: 'ticker',
            fullScreenIntent: false);
    const DarwinNotificationDetails iOSPlatformChannelSpecifics =
        DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      message.hashCode,
      message.data['title'],
      message.data['body'],
      platformChannelSpecifics,
      payload: json.encode(message.data),
    );
    return FirebaseSendNotifi.builItemNotifi(
      title: message.notification!.title ?? message.data['title'],
      content: message.notification!.body ?? message.data['body'],
    );
  }

  static builItemNotifi({
    required String title,
    required String content,
  }) {
    showOverlayNotification(
      (context) {
        return SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        title,
                        style: StyleApp.textStyle700(
                            color: Colors.black, fontSize: 16),
                      ),
                      Text(
                        content,
                        style: StyleApp.textStyle400(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
      duration: const Duration(milliseconds: 2000),
    );
  }

  static nextPage(BuildContext context, {required ModelNotifi model}) {
    List<String> typeWallet = ["RT", "NT", "PRT"];
    List<String> typeQs = ["QS", "AW", "PRT","RP"];

    if (model.type != null) {
      if (typeWallet.contains(model.type)) {
        PageNavigator.next(
          context: context,
          page: ViTien(),
        );
      } else if (typeQs.contains(model.type) && model.link.toString().contains("question")) {
        PageNavigator.next(
          context: context,
          page: AnswerScreenTab(
            quesID: Const.convertNumber(model.object_id ?? -1).round(),
          ),
        );
      } else {
        PageNavigator.next(
          context: context,
          page: ScreensNew(
            title: model.title ?? "Thông báo",
            des: model.description ?? "Đang cập nhật",
          ),
        );
      }
    }
  }
}
