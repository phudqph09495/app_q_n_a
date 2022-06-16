import 'package:app_q_n_a/item/top_member_list.dart';
import 'package:app_q_n_a/styles/colors.dart';
import 'package:flutter/material.dart';

class TopMemberScreen extends StatefulWidget {
  @override
  State<TopMemberScreen> createState() => _TopMemberScreenState();
}

class _TopMemberScreenState extends State<TopMemberScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 7,
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
                      "Tháng trước",
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Tuần trước",
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Ngày hôm qua",
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Trong ngày",
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Trong tuần",
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Trong tháng",
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Tất cả",
                    ),
                  ),
                ],
                indicatorColor: Colors.yellowAccent,
                unselectedLabelColor: Colors.white70,
              ),
            ),
            body: TabBarView(
              children: [
                topMemList(
                    avt: 'https://tinypng.com/images/social/website.jpg',
                    name: 'Đây là tên',
                    score: 1500,
                    ontap: () {}),
                topMemList(
                    avt: 'https://tinypng.com/images/social/website.jpg',
                    name: 'Đây là tên',
                    score: 1500,
                    ontap: () {}),
                topMemList(
                    avt: 'https://tinypng.com/images/social/website.jpg',
                    name: 'Đây là tên',
                    score: 1500,
                    ontap: () {}),
                topMemList(
                    avt: 'https://tinypng.com/images/social/website.jpg',
                    name: 'Đây là tên',
                    score: 1500,
                    ontap: () {}),
                topMemList(
                    avt: 'https://tinypng.com/images/social/website.jpg',
                    name: 'Đây là tên',
                    score: 1500,
                    ontap: () {}),
                topMemList(
                    avt: 'https://tinypng.com/images/social/website.jpg',
                    name: 'Đây là tên',
                    score: 1500,
                    ontap: () {}),
                topMemList(
                    avt: 'https://tinypng.com/images/social/website.jpg',
                    name: 'Đây là tên',
                    score: 1500,
                    ontap: () {}),
              ],
            ),
          ),
        ));
  }
}
