import 'dart:io';

import 'package:app_q_n_a/item/input/text_filed3.dart';
import 'package:app_q_n_a/styles/init_style.dart';
import 'package:flutter/material.dart';

import '../../item/button.dart';

class ScreensNganHang extends StatefulWidget {
  @override
  State<ScreensNganHang> createState() => _ScreensNganHangState();
}

class _ScreensNganHangState extends State<ScreensNganHang> {
  TextEditingController name = TextEditingController();
  TextEditingController name_nh = TextEditingController();
  TextEditingController stk = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorApp.whiteF0,
        centerTitle: true,
        title: Text(
          'Liên kết ngân hàng',
          style: StyleApp.textStyle700(fontSize: 16),
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
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tên tài khoản',
                style: TextStyle(color: ColorApp.black, fontSize: 16),
              ),
              const SizedBox(
                height: 10,
              ),
              InputText3(
                controller: name,
                hint: 'Nhập tên chủ tài khoản',
                radius: 5,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Tên ngân hàng',
                style: TextStyle(color: ColorApp.black, fontSize: 16),
              ),
              const SizedBox(
                height: 10,
              ),
              InputText3(
                controller: name_nh,
                hint: 'Nhập tên ngân hàng',
                radius: 5,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Số tài khoản',
                style: TextStyle(color: ColorApp.black, fontSize: 16),
              ),
              const SizedBox(
                height: 10,
              ),
              InputText3(
                keyboardType: TextInputType.number,
                controller: stk,
                hint: 'Nhập số tài khoản',
                radius: 5,
              ),
              const SizedBox(
                height: 10,
              ),
              Button1(
                border: Border.all(color: ColorApp.orangeF2, width: 0.5),
                colorButton: ColorApp.orangeF2,
                textColor: Colors.white,
                textButton: 'Xác nhận',
                radius: 5,
                fontSize: 18,
                style: false,
                ontap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
