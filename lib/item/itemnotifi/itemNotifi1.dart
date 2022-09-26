import 'package:app_q_n_a/bloc/bloc/notification/bloc_read_notifi.dart';
import 'package:app_q_n_a/config/const.dart';
import 'package:app_q_n_a/config/next_page.dart';
import 'package:app_q_n_a/item/load_image.dart';
import 'package:flutter/material.dart';
import 'package:app_q_n_a/styles/init_style.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Screens/Screens_Notification/screens_news.dart';
import '../../bloc/event_bloc.dart';
import '../../bloc/state_bloc.dart';
import '../../models/model_news.dart';

class ItemNotifi1 extends StatelessWidget {
  ModelNews modelNews;

  ItemNotifi1({required this.modelNews});


  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4,
      child: InkWell(
        onTap: () {

          PageNavigator.next(context: context, page: ScreensNew(
            title: modelNews.title ?? "Thông báo",
            des: modelNews.description ?? "Đang cập nhật",
          ));
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: LoadImage(
                    url: Const.image_host +
                        modelNews.avatarPath.toString() +
                        modelNews.avatarName.toString(),
                    height: 120,
                    width: 90,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        modelNews.title ?? "",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: StyleApp.textStyle700(
                            fontSize: 16, color: ColorApp.black),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        Const.checkTime(
                            Const.convertNumber(modelNews.createdAt).round()),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: StyleApp.textStyle400(
                            fontSize: 12, color: ColorApp.grey82),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        modelNews.shortDescription ?? "",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: StyleApp.textStyle400(
                            fontSize: 12, color: ColorApp.black),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
