import 'package:flutter/material.dart';

Widget getProfileView() {
  return Stack(
    children: [
      const CircleAvatar(
        radius: 32,
        backgroundColor: Colors.white,
        child: Icon(Icons.person_outline_rounded),
      ),
      Positioned(
          bottom: 1,
          right: 1,
          child: Container(
            height: 30,
            width: 30,
            child: Icon(
              Icons.edit,
              color: Colors.white,
              size: 20,
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
