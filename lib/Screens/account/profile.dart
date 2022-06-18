import 'dart:io';

import 'package:app_q_n_a/Screens/account/tab_profile/tab_answer.dart';
import 'package:app_q_n_a/Screens/account/tab_profile/tab_question.dart';
import 'package:app_q_n_a/Screens/account/tab_profile/tab_user.dart';
import 'package:app_q_n_a/config/next_page.dart';
import 'package:app_q_n_a/item/load_image.dart';
import 'package:app_q_n_a/styles/init_style.dart';
import 'package:flutter/material.dart';

import '../../path/image_path.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: ColorApp.orangeF0,
        appBar: AppBar(
          backgroundColor: ColorApp.orangeF0,
          centerTitle: false,
          title: Text(
            "Trang Cá Nhân",
            style: StyleApp.textStyle700(fontSize: 18,color: ColorApp.orangeF01),
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
        ),
        body: Column(
          children: [
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorApp.orangeF8.withOpacity(0.1),
                      border: Border.all(color: ColorApp.orangeF8, width: 0.7)),
                  height: 50,
                  margin: const EdgeInsets.only(left: 40, right: 10),
                  padding: const EdgeInsets.only(
                      left: 35, right: 10, bottom: 5, top: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Họ và tên",
                        style: StyleApp.textStyle700(color: ColorApp.orangeF01),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "........",
                        style: StyleApp.textStyle700(color: ColorApp.orangeF01),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(color: ColorApp.orangeF8, width: 0.7)),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: LoadImage(
                      url: ImagesPath.defultAvatar,
                      width: 50,
                      height: 50,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(),
            TabBar(
                indicatorColor: ColorApp.orangeF01,
                labelColor: ColorApp.orangeF01,
                unselectedLabelColor: ColorApp.orangeF01,
                labelStyle: StyleApp.textStyle500(color: ColorApp.orangeF01),
                unselectedLabelStyle:
                    StyleApp.textStyle500(color: ColorApp.orangeF01),
                indicatorSize: TabBarIndicatorSize.label,
                tabs: const [
                  Tab(
                    text: "Thông tin",
                  ),
                  Tab(
                    text: "Câu hỏi",
                  ),
                  Tab(
                    text: "Câu trả lời",
                  ),
                ]),
            const Expanded(
              child: TabBarView(
                children:[
                  TabUser(),
                  Tabquestion(),
                  TabAnswer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
