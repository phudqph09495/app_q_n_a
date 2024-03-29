import 'dart:io';

import 'package:app_q_n_a/bloc/bloc/auth/bloc_get_user.dart';
import 'package:app_q_n_a/bloc/event_bloc.dart';
import 'package:app_q_n_a/bloc/state_bloc.dart';
import 'package:app_q_n_a/config/const.dart';
import 'package:app_q_n_a/models/model_user.dart';
import 'package:app_q_n_a/widget/items/item_load_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../item/load_image.dart';
import '../../path/image_path.dart';
import '../../styles/init_style.dart';

class ScreenProfile extends StatelessWidget {
  BlocGetUser bloc = BlocGetUser()..add(GetData());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
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
      body: BlocBuilder(
          bloc: bloc,
          builder: (context, StateBloc state) {
            final user =
                state is LoadSuccess ? state.data as ModelUser : ModelUser();
            return ItemLoadPage(
                state: state,
                onTapErr: () {
                  bloc.add(GetData());
                },
                success: Column(
                  children: [
                    Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: ColorApp.orangeF8.withOpacity(0.1),
                              border: Border.all(
                                  color: ColorApp.orangeF8, width: 1)),
                          height: 50,
                          margin: const EdgeInsets.only(
                            left: 40,
                            right: 10,
                            top: 1,
                          ),
                          padding: const EdgeInsets.only(
                              left: 35, right: 10, bottom: 5, top: 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Họ và tên:",
                                style: StyleApp.textStyle700(
                                    color: ColorApp.black),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                Const.checkStringNull(user.username),
                                style: StyleApp.textStyle700(
                                    color: ColorApp.orangeF01),
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
                              border: Border.all(
                                  color: ColorApp.orangeF8, width: 1)),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 7),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: LoadImage(
                              url: Const.image_host +
                                  user.avatarPath.toString() +
                                  user.avatarName.toString(),
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
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
                    _buidRow(
                        title: "Email:",
                        content: Const.checkStringNull(user.email)),
                    _buidRow(
                        title: "Số điện thoại:",
                        content: Const.checkStringNull(user.phone)),
                    _buidRow(
                        title: "Giới tính:",
                        content: user.sex == null
                            ? "Chưa cập nhật"
                            : user.sex == 1
                                ? "Nam"
                                : "Nữ"),
                    _buidRow(
                        title: "Ngày sinh:",
                        content: Const.formatTime((user.birthday ?? 0) * 1000)),
                    _buidRow(
                        title: "Địa chỉ:",
                        content: Const.checkStringNull('${user.address} ${user.districtName} ${user.provinceName}')),
                    _buidRow(title: "Vai trò", content: user.isKyc==true?'Người trả lời':'Người hỏi'),
                    _buidRow(title: "Số CCCD:", content: user.cmt??'Chưa cập nhật')
                    // Padding(
                    //   padding: EdgeInsets.all(17),
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.stretch,
                    //     children: [
                    //       Text(
                    //         "Danh hiệu của bạn".toUpperCase(),
                    //         style: StyleApp.textStyle700(
                    //             fontSize: 16, color: ColorApp.black),
                    //         maxLines: 1,
                    //         overflow: TextOverflow.ellipsis,
                    //       ),
                    //       const SizedBox(height: 10),
                    //       Column(
                    //         mainAxisSize: MainAxisSize.min,
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           Image.asset(
                    //             ImagesPath.imageRank1,
                    //             width: 40,
                    //             height: 40,
                    //           ),
                    //           const SizedBox(height: 5),
                    //           Text(
                    //             "Lính mới",
                    //             style: StyleApp.textStyle400(color: ColorApp.black),
                    //           ),
                    //         ],
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ));
          }),
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
}
