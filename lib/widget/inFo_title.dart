import 'package:flutter/material.dart';

import '../styles/colors.dart';
import '../styles/styles.dart';

Widget InfoTitle({
  required String NguoiDung,
  required String Id,
  required String Diem,
  required String Avatar,
  Function()? ontap,
}) {
  return Container(
    child: Card(
      color: ColorApp.black00,
      shadowColor: Colors.white,
      shape: Border.all(width: 1,color: Colors.white),
      child: InkWell(
        onTap: ontap,
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image(
                image: NetworkImage(Avatar),
                height: 80,
                width: 80,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Người Dùng: $NguoiDung',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: StyleApp.textStyle700(
                            fontSize: 14, color: ColorApp.whiteF0),
                      ),
                      Text(
                        'Id Người Dùng: $Id',
                        overflow: TextOverflow.ellipsis,
                        style: StyleApp.textStyle700(
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'Điểm: $Diem',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: StyleApp.textStyle700(
                            fontSize: 14, color: ColorApp.whiteF0),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
