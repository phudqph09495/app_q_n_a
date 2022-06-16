
import 'package:app_q_n_a/styles/colors.dart';
import 'package:flutter/material.dart';
import '../styles/init_style.dart';
import '../widget/sk_list.dart';

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
          title:  TabBar(
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
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Container(
              child: const Center(
                child: Text(
                  'Người Dùng',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              color: Colors.white,
            ),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    skListQuestion( ontap: () {  }),
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
              color: Colors.white,
            ),
            Container(
              child: const Center(
                child: Text(
                  'Thông báo',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
