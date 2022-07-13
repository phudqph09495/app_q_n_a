
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../styles/init_style.dart';


class CustomToast {
  static showToast({required BuildContext context, required String msg ,IconData? iconData, bool hasIcon = false, ToastGravity gravity = ToastGravity.BOTTOM}) {
    FToast fToast = FToast();
    fToast.init(context);

    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.black.withOpacity(0.7),
      ),
      child: hasIcon? Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            iconData,
            color: Colors.white,
            size: 30,
          ) ,
          const SizedBox(
            height: 5,
          ),
          Text(
            msg,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            maxLines: 2,
            style: StyleApp.textStyle400(
              color: Colors.white,
            ),
          ),
        ],
      ) : Text(
        msg,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        maxLines: 2,
        style: StyleApp.textStyle400(
          color: Colors.white,
        ),
      ),
    );

    fToast.showToast(
      child: toast,
      gravity:gravity,
      toastDuration: Duration(seconds: 2),
    );
  }
}
