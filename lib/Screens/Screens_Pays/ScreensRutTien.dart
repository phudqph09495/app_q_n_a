import 'dart:io';
import 'package:app_q_n_a/Screens/login.dart';
import 'package:app_q_n_a/bloc/bloc/auth/bloc_nganHang.dart';
import 'package:app_q_n_a/bloc/event_bloc.dart';
import 'package:app_q_n_a/item/input/text_filed3.dart';
import 'package:app_q_n_a/models/model_taonganhang.dart';
import 'package:app_q_n_a/styles/init_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../bloc/state_bloc.dart';
import '../../config/path/share_pref_path.dart';
import '../../config/share_pref.dart';
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
                    hint: 'Nhập số tiền cần nạp',
                    radius: 5,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: const [
                      Text(
                        'Số tiền cần thanh toán:  ',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      Text(
                        '10.000đ',
                        style:
                            TextStyle(color: ColorApp.orangeF01, fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Thông tin thanh toán',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: BlocBuilder(
                          bloc: blocNganHang,
                          builder: (_, state) {
                            if(state is LoadSuccess) {
                              final bankk = state.data as ModelNganHang;
                              return Column(
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        'Ngân hàng: ',
                                        style: TextStyle(
                                            color: ColorApp.black,
                                            fontSize: 14),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 25),
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                            children:  [
                                              Text(
                                                '${bankk.bankName}',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Divider(
                                    color: ColorApp.grey82,
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        'Số tài khoản: ',
                                        style: TextStyle(
                                            color: ColorApp.black,
                                            fontSize: 14),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                            children:  [
                                              Text(
                                                '${bankk.number}',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Divider(
                                    color: ColorApp.grey82,
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        'Chủ tài khoản: ',
                                        style: TextStyle(
                                            color: ColorApp.black,
                                            fontSize: 14),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 25),
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                            children:  [
                                              Text(
                                                '${bankk.name}',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Divider(
                                    color: ColorApp.grey82,
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        'Chi nhánh: ',
                                        style: TextStyle(
                                            color: ColorApp.black,
                                            fontSize: 14),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 25),
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                            children: const [
                                              Text(
                                                '',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            }
                            return SizedBox();
                          }),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
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

