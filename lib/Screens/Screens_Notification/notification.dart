import 'package:app_q_n_a/Screens/Screens_Notification/Screens_tabBarView/tabBarView.dart';
import 'package:app_q_n_a/styles/colors.dart';
import 'package:app_q_n_a/widget/DuaTopList.dart';
import 'package:app_q_n_a/widget/ThongBaoList.dart';
import 'package:app_q_n_a/widget/inFo_list.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../styles/init_style.dart';
import '../../widget/sk_list.dart';

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
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: false,
          elevation: 0,
          title: TabBar(
            isScrollable: true,
            labelColor: ColorApp.black,
            unselectedLabelStyle: StyleApp.textStyle500(color: ColorApp.grey82),
            labelStyle: StyleApp.textStyle500(),
            indicatorColor: ColorApp.main,
            unselectedLabelColor: ColorApp.grey82,
            tabs: const [
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
          ),
        ),
        body: const tabBar(),
      ),
    );
  }
}
