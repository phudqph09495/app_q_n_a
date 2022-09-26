import 'dart:io';

import 'package:app_q_n_a/Screens/Screens_TaiKhoan/body_product.dart';
import 'package:app_q_n_a/bloc/bloc/wallet/bloc_bank_user.dart';
import 'package:app_q_n_a/bloc/bloc/wallet/bloc_create_bank.dart';
import 'package:app_q_n_a/bloc/check_log_state.dart';
import 'package:app_q_n_a/bloc/event_bloc.dart';
import 'package:app_q_n_a/item/button.dart';
import 'package:app_q_n_a/models/model_bank.dart';
import 'package:app_q_n_a/widget/items/dia_log_item.dart';
import 'package:app_q_n_a/widget/items/item_load_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/state_bloc.dart';
import '../../../styles/init_style.dart';
import '../../../widget/items/item_input.dart';

class ScreenCreateBank extends StatelessWidget {
  TextEditingController userName = TextEditingController();
  TextEditingController bankName = TextEditingController();
  TextEditingController bankNumber = TextEditingController();

  bool isInput = false;
  BlocBankUser blocBank = BlocBankUser()..add(GetData());
  BlocCreateBank blocCreateBank = BlocCreateBank();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorApp.whiteF0,
        centerTitle: true,
        title: Text(
          "Ngân hàng",
          style: StyleApp.textStyle700(fontSize: 18, color: ColorApp.black),
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
      body: BlocConsumer(
          bloc: blocBank,
          listener: (_, StateBloc state) {
            if (state is LoadSuccess) {
              final bank = state.data as ModelBank ;
              userName.text = bank.name ?? "";
              bankName.text = bank.bankName ?? "";
              bankNumber.text = bank.number ?? "";
            }
          },
          builder: (context, StateBloc state) {
            final bank =
                state is LoadSuccess ? state.data as ModelBank : ModelBank();
            return ItemLoadPage(
                state: state,
                onTapErr: () {
                  blocBank.add(GetData());
                },
                success: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      itemInput(
                        title: "Tên chủ tài khoản",
                        hint: "Viết hoa và không có dấu",
                        readOnly: isInput,
                        controller: userName,
                      ),
                      itemInput(
                        title: "Tên ngân hàng",
                        hint: "Nhập tên ngân hàng",
                        readOnly: isInput,
                        controller: bankName,
                      ),
                      itemInput(
                        title: "Số tài khoản",
                        hint: "Nhập số tài khoản",
                        readOnly: isInput,
                        controller: bankNumber,
                      ),
                    ],
                  ),
                ));
          }),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: BlocListener(
          bloc: blocCreateBank,
          listener: (_, StateBloc state) {
            CheckLogState.check(context, state: state, success: () {
              blocBank.add(GetData());
            });
          },
          child: ElevatedButton(
            onPressed: () {
              if (bankName.text.isNotEmpty &&
                  bankNumber.text.isNotEmpty &&
                  userName.text.isNotEmpty) {
                blocCreateBank.add(GetData(
                  bankName: bankName.text,
                  name: userName.text,
                  number: bankNumber.text,
                ));
              } else {
                DialogItem.showMsg(
                    context: context,
                    title: "Lỗi",
                    msg: "Vui lòng nhập đầy đủ thông tin");
              }
            },
            style: ElevatedButton.styleFrom(primary: ColorApp.orangeF2,minimumSize: Size(80, 50)),
            child: Text(
              "Xác nhận",
              style: StyleApp.textStyle400(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
