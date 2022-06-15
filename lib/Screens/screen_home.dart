import 'package:app_q_n_a/Screens/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens_y/product/body_product.dart';
import '../styles/init_style.dart';

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
          Container(),
          BodyProduct(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (val){
          index = val;
          setState(() {});
        },
        elevation: 4,
        backgroundColor: Colors.white,
        currentIndex: index,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: ColorApp.main,
        selectedLabelStyle:
        StyleApp.textStyle400(color: ColorApp.main, fontSize: 12),
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle:
        StyleApp.textStyle400(color: Colors.grey, fontSize: 12),
        items: const [
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: "Trang chủ"),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.bell), label: "Thông báo"),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.person), label: "Tài khoản"),
        ],
      ),
    );
  }
}
