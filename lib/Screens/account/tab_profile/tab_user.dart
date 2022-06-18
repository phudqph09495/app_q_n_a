import 'package:app_q_n_a/item/load_image.dart';
import 'package:app_q_n_a/path/image_path.dart';
import 'package:app_q_n_a/styles/init_style.dart';
import 'package:flutter/material.dart';

class TabUser extends StatelessWidget {
  const TabUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Text(
          //   "THông tin chung".toUpperCase(),
          //   style: StyleApp.textStyle700(fontSize: 16,color: ColorApp.orangeF01),
          //   maxLines: 1,
          //   overflow: TextOverflow.ellipsis,
          // ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: ColorApp.orangeF01, width: 0.5),
                boxShadow: [
                  BoxShadow(
                    color: ColorApp.orangeF01.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(0, 1), // changes position of shadow
                  ),
                ]),
            // child: Column(
            //   children: [
            //     Padding(
            //       padding:
            //           const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Expanded(
            //             child: _buildItem(
            //                 title: "Điểm số",
            //                 point: 50,
            //                 path: ImagesPath.imageLogo),
            //           ),
            //           Expanded(
            //             child: _buildItem(
            //                 title: "5 sao",
            //                 point: 50,
            //                 path: ImagesPath.imageStar),
            //           ),
            //         ],
            //       ),
            //     ),
            //     const SizedBox(
            //       height: 5,
            //     ),
            //     Container(
            //       color: ColorApp.greyF6,
            //       padding:
            //           const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Expanded(
            //             child: _buildItem(
            //                 title: "Cám ơn",
            //                 point: 50,
            //                 path: ImagesPath.imageLove),
            //           ),
            //           Expanded(
            //             child: _buildItem(
            //                 title: "Hay nhất",
            //                 point: 5,
            //                 path: ImagesPath.imageHuyChuong),
            //           ),
            //           Expanded(
            //             child: _buildItem(
            //                 title: "Xác thực",
            //                 point: 5,
            //                 path: ImagesPath.imageCheck),
            //           ),
            //           Expanded(
            //             child: _buildItem(
            //                 title: "Đã giúp",
            //                 point: 5,
            //                 path: ImagesPath.imageUser),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ],
            // ),
          ),
          _buidRow(title: "Thành viên từ:", content: "10/06/2020"),
          _buidRow(title: "Số câu trả lời:", content: "20"),
          _buidRow(title: "Cảnh báo:", content: "1"),
          const SizedBox(height: 10),
          Text(
            "Danh hiệu của bạn".toUpperCase(),
            style: StyleApp.textStyle700(fontSize: 16,color: ColorApp.orangeF01),
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
                style: StyleApp.textStyle400(color: ColorApp.orangeF01),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _buildItem({
    required String title,
    required String path,
    required int point,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          Text(
            title,
            style: StyleApp.textStyle700(color: ColorApp.orangeF01),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                path,
                width: 20,
                height: 20,
              ),
              const SizedBox(width: 5),
              Text(
                point.toString(),
                style: StyleApp.textStyle700(color: ColorApp.orangeF01),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _buidRow({required String title, required String content}) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Text(
                title,
                style: StyleApp.textStyle700(color: ColorApp.orangeF01),
              )),
          const SizedBox(width: 10),
          Expanded(
              flex: 5,
              child: Text(
                content,
                style: StyleApp.textStyle400(color: ColorApp.orangeF01),
              )),
        ],
      ),
    );
  }
}
