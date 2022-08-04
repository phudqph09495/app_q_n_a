import 'package:app_q_n_a/item/itemnotifi/listNotifi1.dart';
import 'package:app_q_n_a/item/itemnotifi/listNotifi2.dart';
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
    return  DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          bottom: PreferredSize(
            child: TabBar(
              labelColor: ColorApp.black,
              unselectedLabelStyle:
              StyleApp.textStyle500(color: ColorApp.grey82, fontSize: 16),
              labelStyle: StyleApp.textStyle700(fontSize: 16),
              indicatorColor: ColorApp.orangeF01,
              unselectedLabelColor: ColorApp.grey82,
              tabs: const [
                Tab(text: "Sự kiện nóng"),
                Tab(text: "Thông báo"),
              ],
            ),
            preferredSize: Size.zero,
          ),
        ),
        body: TabBarView(
          children: [
            SuKienNong(),
            ThongBao(),
          ],
        ),
      ),
    );
  }
}
