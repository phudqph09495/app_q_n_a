import 'dart:io';

import 'package:app_q_n_a/styles/init_style.dart';
import 'package:flutter/material.dart';
import 'package:app_q_n_a/item/radio_list_tile.dart';
import 'package:app_q_n_a/item/grid_view.dart';
import 'package:app_q_n_a/item/button.dart';

class Filter extends StatefulWidget {
  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  List<String> status = ['Tất cả', 'Đã trả lời', 'Chưa trả lời', 'Lần đầu hỏi'];
  List<String> lop = [
    'Tất cả',
    'Lớp 1',
    'Lớp 2',
    'Lớp 3',
    'Lớp 4',
    'Lớp 5',
    'Lớp 6',
    'Lớp 7',
    'Lớp 8',
    'Lớp 9',
    'Lớp 10',
    'Lớp 11',
    'Lớp 12'
  ];
  List<String> monList = [
    'Toán học',
    'Vật lý',
    'Hoá học',
    'Ngữ Văn',
    'Sinh học',
    'Sử học',
    'Địa lý',
    'Tiếng Anh',
    'Tin học',
    'GDCD',
    'Công nghệ',
    'Âm nhạc',
    'Mỹ thuật'
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorApp.orangeF0,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
              color: ColorApp.orangeF01,
            ),
          ),
          title: Text(
            'Lọc tìm kiếm',
            style:
                StyleApp.textStyle700(fontSize: 16, color: ColorApp.orangeF01),
          ),
          backgroundColor: ColorApp.orangeF0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  FilterList(
                      column: 2, list: status, title: 'Trạng thái câu hỏi'),
                  const SizedBox(
                    height: 40,
                  ),
                  FilterList(
                    title: 'Lớp',
                    column: 3,
                    list: lop,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  FilterList(
                    title: 'Môn học',
                    column: 3,
                    list: monList,
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Button1(
                      ontap: () {},
                      colorButton: ColorApp.orangeF0,
                      textColor: ColorApp.orangeF01,
                      border: Border.all(color: ColorApp.orangeF01),
                      textButton: 'Lọc tìm kiếm'),
                ],
              ),
            )),
          ),
        ),
      ),
    );
  }
}
