import 'package:app_q_n_a/Screens/home.dart';
import 'package:app_q_n_a/Screens/login.dart';
import 'package:app_q_n_a/bloc/bloc/auth/bloc_check_login.dart';

import 'package:app_q_n_a/bloc/bloc/auth/bloc_get_wallet.dart';

import 'package:app_q_n_a/bloc/event_bloc.dart';
import 'package:app_q_n_a/bloc/state_bloc.dart';
import 'package:app_q_n_a/main.dart';
import 'package:app_q_n_a/models/model_notifi.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../bloc/check_version.dart';
import '../widget/notifi/notifi.dart';
import 'Screens_Notification/notification.dart';
import '../styles/init_style.dart';
import 'Screens_Pays/ScreensViPays.dart';
import 'Screens_TaiKhoan/body_product.dart';

class ScreenHome extends StatefulWidget {
  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  int index = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<BlocCheckLogin>().add(GetData());
    context.read<BlocGetWallet>().add(GetData());
    FirebaseMessaging.instance.getToken().then((value) => print(value));
    listenToNotification();
    CheckVersion.check(
      context,
      ios: "com.app.hotrohoctap",
      android: "vn.com.hotrohoctap",
    );
  }

  void listenToNotification() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      FirebaseSendNotifi.showNotification(message, context);
      flutterLocalNotificationsPlugin.cancelAll();
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      FirebaseSendNotifi.nextPage(
        context,
        model: ModelNotifi.fromJson(message.data),
      );
      flutterLocalNotificationsPlugin.cancelAll();
    });
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) async {
      if (message != null) {}
      flutterLocalNotificationsPlugin.cancelAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   actions: [
      //     IconButton(onPressed: (){
      //       FirebaseSendNotifi.builItemNotifi(title: "title", content: "content");
      //     }, icon: Icon(Icons.add))
      //   ],
      // ),
      body: BlocBuilder<BlocCheckLogin, StateBloc>(
          builder: (context, StateBloc state) {
        final check = state is LoadSuccess ? state.data as bool : false;
        return IndexedStack(
          index: index,
          children: [
            HomeScreen(),
            Notificationbar(),
            check ? BodyProduct() : LoginScreen(),
          ],
        );
      }),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (val) {
          index = val;
          setState(() {});
        },
        elevation: 5,
        backgroundColor: Colors.white,
        currentIndex: index,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: ColorApp.orangeF01,
        selectedLabelStyle:
            StyleApp.textStyle400(color: ColorApp.black, fontSize: 12),
        unselectedItemColor: ColorApp.black,
        unselectedLabelStyle:
            StyleApp.textStyle400(color: ColorApp.black, fontSize: 12),
        items: [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home), label: "Trang chủ"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.bell), label: "Thông báo"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person), label: "Tài khoản"),
        ],
      ),
    );
  }
}
