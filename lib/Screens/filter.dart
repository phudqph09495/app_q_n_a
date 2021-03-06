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
        bottomSheet:  Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Button1(
            style: false,
            fontSize: 18,
            radius: 30,
              ontap: () {},
              colorButton: ColorApp.orangeF2,
              textColor: Colors.white,
              border: Border.all(color: ColorApp.orangeF2,width: 0.5),
              textButton: 'Tìm kiếm'),
        ),
        backgroundColor: ColorApp.whiteF0,
        appBar: AppBar(
centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
              color: ColorApp.black,
            ),
          ),
          title: Text(
            'Lọc câu hỏi',
            style:
                StyleApp.textStyle700(fontSize: 18, ),
          ),
          backgroundColor: ColorApp.whiteF0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
          children: [
            FilterList(
                column: 1, list: status, title: '  Trạng thái câu hỏi',space: 10,),
SizedBox(height: 8,),
            FilterList(
              title: '  Lớp',
              column: 3,
              list: lop,
            ),
            SizedBox(height: 8,),
            FilterList(
              title: '  Môn học',
              column: 3,
              list: monList,
            ),
            SizedBox(height: 8,),

          ],
            ),
          ),
        ),
      ),
    );
  }
}
