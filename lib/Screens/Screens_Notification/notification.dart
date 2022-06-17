import 'package:app_q_n_a/Screens/Screens_Notification/Screens_tabBarView/tab_account.dart';
import 'package:app_q_n_a/styles/colors.dart';
import 'package:app_q_n_a/widget/item_notifi.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
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
        body: TabBarView(
          children: List.generate(
            4,
                (index) => ListView(
                  padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              children: List.generate(
                5,
                    (index) => ItemNotifi(
                  onTap: () => launch('https://hoidap247.com/'),
                  avatar:
                  "https://i.pinimg.com/236x/63/eb/99/63eb997f009a82e5e3d3ca00e10002ba.jpg",
                  sub:
                  "Ủa j zợ? Nhanh tay vào xem tên mình có trong danh sách nhận quà tháng 5 không nhé!",
                  time: "8 ngày trước",
                  title: "Ủa em ? Kết quả đua top tháng 5/2022 nè!",
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}