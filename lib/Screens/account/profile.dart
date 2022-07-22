import 'dart:io';
import 'package:app_q_n_a/item/load_image.dart';
import 'package:app_q_n_a/styles/init_style.dart';
import 'package:flutter/material.dart';
import '../../path/image_path.dart';

// class ProfileScreen extends StatelessWidget {
//   @override
Widget ProfileScreen({required BuildContext context, String? name}) {
  return DefaultTabController(
    length: 3,
    child: Scaffold(
      backgroundColor: ColorApp.whiteF0,
      appBar: AppBar(
        backgroundColor: ColorApp.whiteF0,
        centerTitle: true,
        title: Text(
          "Trang Cá Nhân",
          style: StyleApp.textStyle700(fontSize: 18, color: ColorApp.black),
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
                    color: ColorApp.whiteF7.withOpacity(0.1),
                    border: Border.all(color: ColorApp.black00, width: 0.5)),
                height: 50,
                margin: const EdgeInsets.only(left: 40, right: 10),
                padding: const EdgeInsets.only(
                    left: 35, right: 10, bottom: 5, top: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Họ và tên:",
                      style: StyleApp.textStyle700(color: ColorApp.black),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      '$name',
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
                    border: Border.all(color: ColorApp.black00, width: 0.5)),
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
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
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Thông tin',
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          const SizedBox(
            height: 10,
          ),
          _buidRow(title: "Giới thiệu:", content: "Nam"),
          _buidRow(title: "Ngày sinh:", content: "01/01/2004"),
          _buidRow(title: "Tỉnh thành:", content: "Hà Nội"),
          Padding(
            padding: EdgeInsets.all(17),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Danh hiệu của bạn".toUpperCase(),
                  style: StyleApp.textStyle700(
                      fontSize: 16, color: ColorApp.black),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 10),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      ImagesPath.imageRank1,
                      width: 40,
                      height: 40,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Lính mới",
                      style: StyleApp.textStyle400(color: ColorApp.black),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

_buidRow({required String title, required String content}) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      vertical: 5,
      horizontal: 15,
    ),
    child: Row(
      children: [
        Expanded(
            flex: 2,
            child: Text(
              title,
              style: StyleApp.textStyle700(
                color: ColorApp.black,
              ),
            )),
        const SizedBox(width: 10),
        Expanded(
            flex: 5,
            child: Text(
              content,
              style: StyleApp.textStyle400(color: ColorApp.black),
            )),
      ],
    ),
  );
}
