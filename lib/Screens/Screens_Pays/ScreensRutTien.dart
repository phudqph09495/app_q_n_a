import 'dart:io';
import 'package:app_q_n_a/bloc/bloc/auth/bloc_nganHang.dart';
import 'package:app_q_n_a/bloc/event_bloc.dart';
import 'package:app_q_n_a/item/input/text_filed3.dart';
import 'package:app_q_n_a/styles/init_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../item/button.dart';

class RutTien extends StatefulWidget {
  @override
  State<RutTien> createState() => _RutTienState();
}

class _RutTienState extends State<RutTien> {
  TextEditingController Money = TextEditingController();
  BlocNganHang blocNganHang = BlocNganHang()..add(getTaoNganHang());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Padding(
        padding: const EdgeInsets.all(15),
        child: Button1(
          border: Border.all(color: ColorApp.orangeF2, width: 0.5),
          colorButton: ColorApp.orangeF2,
          textColor: Colors.white,
          textButton: 'Xác nhận',
          radius: 5,
          fontSize: 18,
          style: false,
          ontap: () {},
        ),
      ),
      backgroundColor: ColorApp.whiteF0,
      appBar: AppBar(
        backgroundColor: ColorApp.whiteF0,
        centerTitle: true,
        title: Text(
          'Rút tiền',
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Tỷ lệ chuyển đổi',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InputText3(
                    keyboardType: TextInputType.number,
                    controller: Money,
                    hint: 'Nhập số tiền cần rút',
                    radius: 5,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
