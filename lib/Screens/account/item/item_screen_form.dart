import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import '../../../config/path/image_path.dart';

class ItemScreenForm extends StatelessWidget {
  Widget? child;

  ItemScreenForm({this.child});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, contains) {
      return KeyboardDismisser(
        child: Scaffold(
          body: Container(
            height: Get.height,
            width: Get.width,
            alignment: Alignment.center,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  child: Image.asset(
                    ImagePath.logo,
                    width: Get.width,
                    height: 92,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                    right: 0,
                    bottom: 0,
                    child: Image.asset(ImagePath.logo_lending)),
                Container(
                  height: Get.height,
                  width: Get.width,
                  alignment: Alignment.center,
                  child: child,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
