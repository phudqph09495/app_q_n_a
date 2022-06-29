import 'package:app_q_n_a/Screens/Screens_Notification/Screens_tabBarView/tab_account.dart';
import 'package:app_q_n_a/Screens/Screens_Notification/screens_news.dart';
import 'package:app_q_n_a/styles/colors.dart';
import 'package:app_q_n_a/widget/item_lits_notifi1.dart';
import 'package:app_q_n_a/widget/item_lits_notifi2.dart';
import 'package:app_q_n_a/widget/item_notifi.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../config/next_page.dart';
import '../../styles/init_style.dart';
import '../account/tab_profile/tab_question.dart';
import '../account/tab_profile/tab_user.dart';

class Notificationbar extends StatefulWidget {
  const Notificationbar({Key? key}) : super(key: key);

  @override
  State<Notificationbar> createState() => _NotificationbarState();
}

class _NotificationbarState extends State<Notificationbar> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: ColorApp.whiteF0,
            title: TabBar(
              labelColor: ColorApp.black,
              unselectedLabelStyle:
                  StyleApp.textStyle500(color: ColorApp.grey82),
              labelStyle: StyleApp.textStyle500(),
              indicatorColor: ColorApp.orangeF01,
              unselectedLabelColor: ColorApp.grey82,
              tabs: [
                Row(children: const [
                  Icon(null),
                  SizedBox(width: 5),
                  Text(
                    "Sự kiện nóng",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  )
                ]),
                Row(children: const [
                  Icon(null),
                  SizedBox(width: 5),
                  Text(
                    "Thông báo",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  )
                ]),

                // Tab(
                //   child: Text(
                //     "Sự kiện nóng",
                //     style: TextStyle(color: ColorApp.black,fontSize: 16),
                //   ),
                // ),
                // Tab(
                //   child: Text(
                //     "Thông báo",
                //     style: TextStyle(color: ColorApp.black,fontSize: 16),
                //   ),
                // ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              SuKienNong(),
              ThongBao(),
            ],
            // children: List.generate(
            //   2,
            //   (index) => ListView(
            //     padding:
            //         const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            //     children: List.generate(
            //       10,
            //       (index) => ItemNotifi(
            //         onTap: () {
            //           PageNavigator.next(context: context, page: ScreensNew());
            //         },
            //         avatar:
            //             "https://i.pinimg.com/564x/15/17/cf/1517cfa3e1a7d3fb243c85c0eb471791.jpg",
            //         sub:
            //             'Click để xem ngay đáp án chính xác nhất cuộc thi Bác Hồ Với Thanh Hóa , Thanh Hóa Làm Theo Lời Bác!',
            //         time: "8 ngày trước",
            //         title:
            //             "Đáp án cuộc thi Bác Hồ Với Thanh Hóa Làm Theo Lời Bác!",
            //       ),
            //     ),
            //   ),
            // ),
          ),
        ),
      ),
    );
  }
}
