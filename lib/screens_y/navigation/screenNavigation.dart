import 'package:app_q_n_a/Screens/home.dart';
import 'package:app_q_n_a/styles/colors.dart';
import 'package:flutter/material.dart';
import '../../screens_y/product/body_product.dart';
import '../../screens_y/product/widget/notification.dart';

class NavigationBarOne extends StatefulWidget {
  const NavigationBarOne({Key? key}) : super(key: key);
  @override
  State<NavigationBarOne> createState() => _NavigationBarOneState();
}

class _NavigationBarOneState extends State<NavigationBarOne> {
  int selectedIndex = 0;
  Widget _home = HomeScreen();
  Widget _notification = Notificationbar();
  Widget _taikhoan = BodyProduct();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.main,
      appBar: null,
      body: this.getBody(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ColorApp.main,
        type: BottomNavigationBarType.fixed,
        currentIndex: this.selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Trang chủ",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "Thông báo",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Tài khoản",
          ),
        ],
        onTap: (int index) {
          this.onTapHandler(index);
        },
      ),
    );
  }

  Widget getBody() {
    if (this.selectedIndex == 0) {
      return this._home;
    } else if (this.selectedIndex == 1) {
      return this._notification;
    } else {
      return this._taikhoan;
    }
  }

  void onTapHandler(int index) {
    this.setState(() {
      this.selectedIndex = index;
    });
  }
}
