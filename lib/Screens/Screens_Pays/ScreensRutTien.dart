import 'dart:io';
import 'package:app_q_n_a/bloc/bloc/auth/bloc_get_wallet.dart';
import 'package:app_q_n_a/bloc/bloc/wallet/bloc_withdraw.dart';
import 'package:app_q_n_a/bloc/check_log_state.dart';
import 'package:app_q_n_a/bloc/event_bloc.dart';
import 'package:app_q_n_a/item/input/text_filed3.dart';
import 'package:app_q_n_a/styles/init_style.dart';
import 'package:app_q_n_a/widget/items/dia_log_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/state_bloc.dart';
import '../../config/const.dart';
import '../../item/button.dart';

class RutTien extends StatefulWidget {
  @override
  State<RutTien> createState() => _RutTienState();
}

class _RutTienState extends State<RutTien> {
  TextEditingController Money = TextEditingController();
  BlocGetWallet blocGetWallet = BlocGetWallet()..add(GetData());
  BlocWithDraw blocWithDraw = BlocWithDraw();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Padding(
        padding: const EdgeInsets.all(15),
        child: BlocListener(
          bloc: blocWithDraw,
          listener: (_, StateBloc state) {
            CheckLogState.check(context,
                state: state,
                duration: 5,
                msg: "Tạo phiếu rút thành công. Vui lòng chờ admin xác thực",
                success: () {
              Money.clear();
              blocGetWallet.add(GetData());
            });
          },
          child: Button1(
            border: Border.all(color: ColorApp.orangeF2, width: 0.5),
            colorButton: ColorApp.orangeF2,
            textColor: Colors.white,
            textButton: 'Xác nhận',
            radius: 5,
            fontSize: 18,
            style: false,
            ontap: () {
              if (Money.text.isNotEmpty) {
                blocWithDraw.add(GetData(keyword: Money.text));
              } else {
                DialogItem.showMsg(
                    context: context,
                    title: "Lỗi",
                    msg: "Vui lòng nhập sô tiền cần rút");
              }
            },
          ),
        ),
      ),
      backgroundColor: ColorApp.whiteF0,
      appBar: AppBar(
        backgroundColor: ColorApp.whiteF0,
        centerTitle: true,
        title: Text(
          'Rút sao',
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
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                  final coin = state is LoadSuccess ? state.data as int : 0;
                  return Button1(
                    width: 190,sao: true,
                    height: 60,
                    radius: 10,
                    fontSize: 20,
                    colorButton: ColorApp.orangeF2,
                    textColor: Colors.white,
                    textButton: '${Const.convertPrice(coin)} ',
                    style: false,
                  );
                }),
            const SizedBox(height: 15),
            const Text(
              'Số sao rút',
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),
            InputText3(
              keyboardType: TextInputType.number,
              controller: Money,
              hint: 'Nhập số sao cần rút cần rút',
              radius: 5,
            ),
          ],
        ),
      ),
    );
  }
}
