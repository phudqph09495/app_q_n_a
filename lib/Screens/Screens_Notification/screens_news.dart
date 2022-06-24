import 'dart:io';

import 'package:app_q_n_a/styles/colors.dart';
import 'package:app_q_n_a/styles/styles.dart';
import 'package:flutter/material.dart';

class ScreensNew extends StatelessWidget {
  const ScreensNew({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorApp.whiteF0,
        title: Text(
          'Tin tức',
          style: StyleApp.textStyle700(color: ColorApp.black, fontSize: 16),
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
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Đáp án cuộc thi ',
                  style: TextStyle(
                      color: ColorApp.orangeF01,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                const SizedBox(
                  height: 15,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: Color(0xff87CEFA),
                            shape: BoxShape.circle,
                          ),
                          width: 40,
                          height: 40,
                          child: const Center(
                            child: Text(
                              '1',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              child: Text(
                                'khi Người về thăm Thanh Hóa ?',
                                style: TextStyle(
                                    color: Color(0xff87CEFA), fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            'A. Lần thứ ba, năm 1960',
                            style: TextStyle(
                                color:  ColorApp.black00, fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            'B. Lần thứ hai, năm 1957',
                            style: TextStyle(
                                color: Colors.black, fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            'C. Lần thứ nhất, năm 1947 ',
                            style: TextStyle(
                                color: ColorApp.black00, fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: Color(0xff87CEFA),
                            shape: BoxShape.circle,
                          ),
                          width: 40,
                          height: 40,
                          child: const Center(
                            child: Text(
                              '2',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              child: Text(
                                'khi Người về thăm Thanh Hóa ?',
                                style: TextStyle(
                                    color: Color(0xff87CEFA), fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            'A. Lần thứ ba, năm 1960',
                            style: TextStyle(
                                color:  ColorApp.black00, fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            'B. Lần thứ hai, năm 1957',
                            style: TextStyle(
                                color: Colors.black, fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            'C. Lần thứ nhất, năm 1947 ',
                            style: TextStyle(
                                color: ColorApp.black00, fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: Color(0xff87CEFA),
                            shape: BoxShape.circle,
                          ),
                          width: 40,
                          height: 40,
                          child: const Center(
                            child: Text(
                              '3',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              child: Text(
                                'khi Người về thăm Thanh Hóa ?',
                                style: TextStyle(
                                    color: Color(0xff87CEFA), fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            'A. Lần thứ ba, năm 1960',
                            style: TextStyle(
                                color:  ColorApp.black00, fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            'B. Lần thứ hai, năm 1957',
                            style: TextStyle(
                                color: Colors.black, fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            'C. Lần thứ nhất, năm 1947 ',
                            style: TextStyle(
                                color: ColorApp.black00, fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: Color(0xff87CEFA),
                            shape: BoxShape.circle,
                          ),
                          width: 40,
                          height: 40,
                          child: const Center(
                            child: Text(
                              '4',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              child: Text(
                                'khi Người về thăm Thanh Hóa ?',
                                style: TextStyle(
                                    color: Color(0xff87CEFA), fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            'A. Lần thứ ba, năm 1960',
                            style: TextStyle(
                                color:  ColorApp.black00, fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            'B. Lần thứ hai, năm 1957',
                            style: TextStyle(
                                color: Colors.black, fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            'C. Lần thứ nhất, năm 1947 ',
                            style: TextStyle(
                                color: ColorApp.black00, fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
