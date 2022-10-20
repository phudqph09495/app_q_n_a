import 'dart:io';
import 'package:app_q_n_a/Screens/login.dart';
import 'package:app_q_n_a/bloc/bloc/wallet/bloc_add_money.dart';
import 'package:app_q_n_a/bloc/bloc/wallet/bloc_site_info.dart';
import 'package:app_q_n_a/bloc/bloc/wallet/price_by_coin.dart';
import 'package:app_q_n_a/bloc/check_log_state.dart';
import 'package:app_q_n_a/item/input/text_filed3.dart';

import 'package:app_q_n_a/styles/init_style.dart';
import 'package:app_q_n_a/widget/items/dia_log_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../bloc/event_bloc.dart';
import '../../bloc/state_bloc.dart';
import '../../config/const.dart';
import '../../item/button.dart';
import '../../models/model_site_info.dart';
import '../../models/model_taonganhang.dart';
import 'package:app_q_n_a/widget/widget_info/widgetText.dart' as user;



class NapTien extends StatefulWidget {
  const NapTien({Key? key}) : super(key: key);

  @override
  State<NapTien> createState() => _NapTienState();
}

class _NapTienState extends State<NapTien> {
  TextEditingController Money = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  XFile? image;
  PriceByCoin priceByCoin = PriceByCoin();
  BlocSiteInfo blocSiteInfo = BlocSiteInfo()..add(GetData());
  BlocAddMoney blocAddMoney = BlocAddMoney();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.whiteF0,
      appBar: AppBar(
        backgroundColor: ColorApp.whiteF0,
        centerTitle: true,
        title: Text(
          'Nạp sao',
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: BlocListener(
          bloc: blocAddMoney,
          listener: (_, StateBloc state) {
            CheckLogState.check(context, state: state, success: () {
              image = null;
              Money.clear();
              setState(() {});
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
              if (Money.text.isNotEmpty && image != null) {
                blocAddMoney.add(GetData(
                  image: image,
                  money: Money.text,
                ));
              } else {
                DialogItem.showMsg(
                  context: context,
                  title: "Lỗi",
                  msg:
                      "Vui lòng nhập số tiền nạp và ảnh xác thực giao dịch thành công từ ngân hàng",
                );
              }
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Số sao nạp',
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),
            InputText3(
              keyboardType: TextInputType.number,
              controller: Money,
              hint: 'Nhập số sao cần nạp',
              radius: 5,
              onChanged: (val) {
                priceByCoin.getPrice(val.isEmpty ? 0 : int.parse(val));
              },
            ),
            const SizedBox(
              height: 10,
            ),
            BlocBuilder(
                bloc: priceByCoin,
                builder: (context, snapshot) {
                  return Row(
                    children: [
                      Text(
                        'Số tiền cần thanh toán:  ',
                        style: StyleApp.textStyle400(fontSize: 16),
                      ),
                      Expanded(
                        child: Text(
                          '${Const.convertPrice(int.parse(snapshot.toString())*1000)} đ',
                          style: StyleApp.textStyle700(
                              fontSize: 16, color: Colors.red),
                        ),
                      ),
                    ],
                  );
                }),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
             "Nội dung thanh toán: HD${user.userID}",
              style: StyleApp.textStyle400(fontSize: 16),
            ),
          ),
        ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Thông tin thanh toán',
              style: StyleApp.textStyle400(fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),
            BlocBuilder(
              bloc: blocSiteInfo,
              builder: (_, StateBloc state) {
                if (state is LoadSuccess) {
                  final model = state.data as ModelSiteInfo;
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        model.bankAdmin ?? "",
                        style: StyleApp.textStyle400(fontSize: 16),
                      ),
                    ),
                  );
                }
                return const SizedBox();
              },
            ),
            const SizedBox(
              height: 10,
            ),
            image != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.file(
                      File(image!.path),
                    ),
                  )
                : const SizedBox(),
            const SizedBox(
              height: 10,
            ),
            Card(
              margin: EdgeInsets.zero,
              child: _Cammera(),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  _Cammera() {
    return InkWell(
      onTap: () async {
        await _picker
            .pickImage(source: ImageSource.gallery)
            .then((value) => image = value);
        setState(() {});
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            const Icon(
              Icons.image,
              size: 30,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                children: const [
                  Text(
                    'Ảnh giao dịch thàng công trên mobile , hoặc nạp tiền từ ngân hàng',
                    style: TextStyle(color: ColorApp.black, fontSize: 14),
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
