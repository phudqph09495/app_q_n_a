import 'package:flutter/material.dart';

class PageNavigator {
  static next({required BuildContext context, required Widget page}) async {
    var res = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => page));
    return res;
  }

  static nextNoBack({required BuildContext context, required Widget page}) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => page),
      (Route<dynamic> route) => false,
    );
  }
}
