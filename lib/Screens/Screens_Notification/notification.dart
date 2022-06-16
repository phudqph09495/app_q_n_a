import 'package:app_q_n_a/widget/DuaTopList.dart';
import 'package:app_q_n_a/widget/ThongBaoList.dart';
import 'package:app_q_n_a/widget/inFo_list.dart';
import 'package:app_q_n_a/widget/sk_list.dart';
import 'package:app_q_n_a/styles/colors.dart';
import 'package:flutter/material.dart';
import '../../styles/init_style.dart';

class Notificationbar extends StatefulWidget {
  const Notificationbar({Key? key}) : super(key: key);

  @override
  State<Notificationbar> createState() => _NotificationbarState();
}

class _NotificationbarState extends State<Notificationbar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: ColorApp.main,
          appBar: const PreferredSize(
            preferredSize: Size(double.infinity, 80),
            child: TabBar(
              isScrollable: true,
              tabs: [
                Tab(
                  child: Text(
                    "Người dùng",
                  ),
                ),
                Tab(
                  child: Text(
                    "Sự kiện nóng",
                  ),
                ),
                Tab(
                  child: Text(
                    "Kết quả đua top",
                  ),
                ),
                Tab(
                  child: Text(
                    "Thông báo",
                  ),
                ),
              ],
              indicatorColor: Colors.yellowAccent,
              unselectedLabelColor: Colors.white70,
            ),
          ),
          body: TabBarView(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      inFoList(onTap: () {}),
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      skListQuestion(onTap: () {}),
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Column(
                    children: <Widget>[
                      DuaTopList(onTap: () {}),
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Column(
                    children: <Widget>[
                      ThongBaoList(onTap: () {}),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
