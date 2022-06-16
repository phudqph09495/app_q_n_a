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
        appBar: AppBar(
          title: Text(
            'Lọc tìm kiếm',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.black.withOpacity(0.01),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(2.0),
            child: SingleChildScrollView(
                child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  FilterList(
                      column: 2, list: status, title: 'Trạng thái câu hỏi'),
                  SizedBox(
                    height: 40,
                  ),
                  FilterList(
                    title: 'Lớp',
                    column: 3,
                    list: lop,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  FilterList(
                    title: 'Môn học',
                    column: 3,
                    list: monList,
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Button1(
                      ontap: () {},
                      colorButton: Colors.blue,
                      textColor: Colors.white,
                      textButton: 'Lọc tìm kiếm')
                ],
              ),
            )),
          ),
        ),
      ),
    );
  }
}
