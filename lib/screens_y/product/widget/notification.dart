import 'package:app_q_n_a/screens_y/product/widget/sk_list.dart';
import 'package:app_q_n_a/styles/colors.dart';
import 'package:flutter/material.dart';
import '../../../styles/init_style.dart';

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
          backgroundColor: ColorApp.blue00,
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
              Container(
                child: const Center(
                  child: Text(
                    'Người Dùng',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                color: ColorApp.main,
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      skListQuestion(onTap: () {}),
                    ],
                  ),
                ),
              ),
              Container(
                child: const Center(
                  child: Text(
                    'Kết quả đua top',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                color: ColorApp.main,
              ),
              Container(
                child: const Center(
                  child: Text(
                    'Thông báo',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                color: ColorApp.main,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
