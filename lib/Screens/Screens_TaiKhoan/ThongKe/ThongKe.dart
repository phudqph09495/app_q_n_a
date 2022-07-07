import 'dart:io';

import 'package:app_q_n_a/Screens/Screens_TaiKhoan/ThongKe/itemThongKe/listNguoiTraLoi.dart';
import 'package:flutter/material.dart';

import '../../../styles/colors.dart';
import '../../../styles/styles.dart';
import '../../account/tab_profile/tab_answer.dart';
import '../../account/tab_profile/tab_question.dart';
import 'itemThongKe/listNguoiHoi.dart';

class ThongKe extends StatelessWidget {
  const ThongKe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: ColorApp.whiteF0,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: ColorApp.whiteF0,
            title: Text(
              'Thống kê',
              style: StyleApp.textStyle700(fontSize: 18),
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
                color: ColorApp.black,
              ),
            ),
            bottom: PreferredSize(
              child: TabBar(
                labelColor: ColorApp.black,
                unselectedLabelStyle:
                    StyleApp.textStyle500(color: ColorApp.grey82, fontSize: 16),
                labelStyle: StyleApp.textStyle700(fontSize: 16),
                indicatorColor: ColorApp.orangeF01,
                unselectedLabelColor: ColorApp.grey82,
                isScrollable: true,
                tabs: [
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Câu hỏi',
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                        Text(
                          '(10)',
                          style: TextStyle(
                              fontSize: 15, color: ColorApp.orangeF01),
                        ),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Câu trả lời',
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                        Text(
                          '(20)',
                          style: TextStyle(
                              fontSize: 15, color: ColorApp.orangeF01),
                        ),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Nhận thưởng',
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                        Text(
                          '(10)',
                          style: TextStyle(
                              fontSize: 15, color: ColorApp.orangeF01),
                        ),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Trả thưởng',
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                        Text(
                          '(5)',
                          style: TextStyle(
                              fontSize: 15, color: ColorApp.orangeF01),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              preferredSize: Size.fromHeight(50),
            ),
          ),
          body: TabBarView(
            children: [
              Tabquestion(),
              TabAnswer(),
              NguoiHoiList(),
              NguoiTraLoiList(),
            ],
          ),
        ),
      ),
    );
  }
}
