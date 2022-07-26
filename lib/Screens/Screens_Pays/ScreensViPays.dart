import 'dart:io';
import 'package:app_q_n_a/Screens/screen_home.dart';
import 'package:app_q_n_a/bloc/bloc/auth/bloc_get_wallet.dart';
import 'package:app_q_n_a/bloc/bloc/auth/bloc_waller_history.dart';
import 'package:app_q_n_a/models/model_wallet.dart';
import 'package:app_q_n_a/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../bloc/event_bloc.dart';
import '../../config/path/share_pref_path.dart';
import '../../config/share_pref.dart';
import '../../item/button.dart';
import '../../styles/colors.dart';
import 'package:app_q_n_a/bloc/state_bloc.dart';

class ViTien extends StatefulWidget {
  @override
  State<ViTien> createState() => _ViTienState();
}

class _ViTienState extends State<ViTien> {
  BlocGetWallet blocGetWallet = BlocGetWallet();
  BlocWalletHistory blocWalletHistory = BlocWalletHistory();
  DateTime start_time = DateTime.now();
  DateTime end_time = DateTime.now();

  getVi() async {
    int id = await SharedPrefs.readString(SharePrefsKeys.user_id);
    blocGetWallet.add(getViTien(user_id: id, cat_id: 1));
  }

  BlocWalletHistory blochistory = BlocWalletHistory();
  Future<void> History() async {
    blocWalletHistory.add(GetData());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getVi();
    History();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15),
        child: Button1(
            colorButton: ColorApp.orangeF2,
            textColor: ColorApp.whiteF0,
            radius: 10,
            fontSize: 18,
            style: false,
            border: Border.all(color: ColorApp.orangeF2),
            textButton: 'Trang chủ',
            ontap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ScreenHome()));
            }),
      ),
      backgroundColor: ColorApp.whiteF0,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorApp.whiteF0,
        title: Text(
          'Ví điện tử',
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
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  const Text(
                    'Số dư tài khoản',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  BlocBuilder(
                      bloc: blocGetWallet,
                      builder: (_, state) {
                        final coin =
                            state is LoadSuccess ? state.data as int : 0;
                        return Button1(
                          width: 190,
                          height: 60,
                          radius: 10,
                          fontSize: 20,
                          colorButton: ColorApp.orangeF2,
                          textColor: Colors.white,
                          textButton: '$coin Đ',
                          style: false,
                        );
                      }),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Card(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ExpansionTile(
                    title: const Text(
                      'Lịch sử giao dịch',
                      style: TextStyle(color: Colors.black),
                    ),
                    iconColor: ColorApp.orangeF2,
                    collapsedIconColor: Colors.black,
                    children: List.generate(5, (index) => _buildItem()),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildItem() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5))),
      child: BlocBuilder(
          bloc: blocGetWallet,
          builder: (_, state) {
            final history = state is LoadSuccess ? state.data as int : 0;
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.network(
                  'https://i.pinimg.com/564x/eb/ff/a9/ebffa9af01173721c66e8090c35bb4cf.jpg',
                  width: 70,
                  height: 70,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Chuyển tiền thành công',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        const Text(
                          'Ngân hàng Techcombank',
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '',
                              style: TextStyle(color: ColorApp.black),
                            ),
                            Text(
                              '',
                              style: TextStyle(color: ColorApp.orangeF01),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
