import 'package:app_q_n_a/item/load_image.dart';
import 'package:flutter/material.dart';
import 'package:app_q_n_a/styles/init_style.dart';

class NguoiTraLoi extends StatelessWidget {
  Function()? onTap;
  String avatar;
  String name;
  String time;
  String title;
  String titleMoney;
  String content;

  NguoiTraLoi(
      {required this.avatar,
      required this.name,
      required this.time,
      required this.content,
      required this.titleMoney,
      this.onTap,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.all(7),
          child: InkWell(
            onTap: onTap,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 4),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: LoadImage(
                            url: avatar,
                            height: 90,
                            width: 65,
                            fit: BoxFit.cover),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: StyleApp.textStyle700(
                                fontSize: 16, color: ColorApp.black),
                          ),
                          Row(
                            children: [
                              Text(
                                'Đã chuyển:',
                                overflow: TextOverflow.ellipsis,
                                style: StyleApp.textStyle400(
                                    fontSize: 12, color: ColorApp.grey82),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                title,
                                overflow: TextOverflow.ellipsis,
                                style: StyleApp.textStyle400(
                                    fontSize: 12, color: Colors.black),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Vào tài khoản: ',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: StyleApp.textStyle400(
                                    fontSize: 12, color: ColorApp.grey82),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                titleMoney,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: StyleApp.textStyle700(
                                    fontSize: 12, color: ColorApp.black),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Nội dung: ',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: StyleApp.textStyle400(
                                    fontSize: 12, color: ColorApp.grey82),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                content,
                                overflow: TextOverflow.ellipsis,
                                style: StyleApp.textStyle400(
                                    fontSize: 12, color: Colors.black),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Thời gian: ',
                                overflow: TextOverflow.ellipsis,
                                style: StyleApp.textStyle400(
                                    fontSize: 12, color: ColorApp.grey82),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                time,
                                overflow: TextOverflow.ellipsis,
                                style: StyleApp.textStyle400(
                                    fontSize: 12, color: Colors.black),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // const Divider(color: ColorApp.greyBD),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
