import 'package:app_q_n_a/item/load_image.dart';
import 'package:app_q_n_a/path/image_path.dart';
import 'package:flutter/material.dart';

Widget getProfileView() {
  return Stack(
    children: [
      Container(
        width: 60,
        height: 60,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LoadImage(
            url:
                ImagesPath.defultAvatar,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
      ),
      Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            height: 20,
            width: 20,
            child: const Icon(
              Icons.edit,
              color: Colors.white,
              size: 15,
            ),
            decoration: const BoxDecoration(
              color: Colors.lightGreen,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
          ))
    ],
  );
}
