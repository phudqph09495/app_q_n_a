import 'package:app_q_n_a/Screens/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Screens_Notification/notification.dart';
import '../styles/init_style.dart';
import 'Screens_TaiKhoan/body_product.dart';

class ScreenHome extends StatefulWidget {
  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: index,
        children: [
          HomeScreen(),
          Notificationbar(),
          BodyProduct(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (val) {
          index = val;
          setState(() {});
        },
        elevation: 4,
        backgroundColor: ColorApp.orangeF01,
        currentIndex: index,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: ColorApp.main,
        selectedLabelStyle:
            StyleApp.textStyle400(color: ColorApp.main, fontSize: 12),
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle:
            StyleApp.textStyle400(color: Colors.black, fontSize: 12),
        items: const [
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
