import 'dart:io';
import 'package:app_q_n_a/Screens/screen_home.dart';
import 'package:app_q_n_a/bloc/bloc/auth/bloc_get_wallet.dart';
import 'package:app_q_n_a/bloc/bloc/auth/bloc_waller_history.dart';
import 'package:app_q_n_a/bloc/bloc/wallet/bloc_treo.dart';
import 'package:app_q_n_a/config/const.dart';
import 'package:app_q_n_a/item/load_image.dart';
import 'package:app_q_n_a/models/model_wallet.dart';
import 'package:app_q_n_a/path/image_path.dart';
import 'package:app_q_n_a/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../bloc/event_bloc.dart';
import '../../config/path/share_pref_path.dart';
import '../../config/share_pref.dart';
import '../../item/button.dart';
import '../../models/ModelTreo.dart';
import '../../styles/colors.dart';
import 'package:app_q_n_a/bloc/state_bloc.dart';

import '../Screens_TaiKhoan/ThongKe/tab/answer_screen_tab.dart';

class ViTien extends StatefulWidget {
  @override
  State<ViTien> createState() => _ViTienState();
}

class _ViTienState extends State<ViTien> {
  BlocWalletHistory blocWalletHistory = BlocWalletHistory()..add(getHistory());
  BlocTreo blocTreo = BlocTreo()..add(getHistory());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<BlocGetWallet>().add(GetData());
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
        backgroundColor: Colors.white,
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
        body: NestedScrollView(
          headerSliverBuilder: (context, isMax) {
            return [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      const Text(
                        'Số dư tài khoản',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      BlocBuilder<BlocGetWallet, StateBloc>(
                          builder: (_, state) {
                        final coin =
                            state is LoadSuccess ? state.data as int : 0;
                        return Button1(
                          sao: true,
                          width: 250,
                          height: 60,
                          radius: 10,
                          fontSize: 20,
                          colorButton: ColorApp.orangeF2,
                          textColor: Colors.white,
                          textButton: '${Const.convertPrice(coin)} ',
                          style: false,
                        );
                      }),
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.grey.shade100)),
                        ),
                        child: TabBar(
                          indicatorColor: ColorApp.orangeF2,
                          unselectedLabelStyle: StyleApp.textStyle500(
                              color: ColorApp.grey82, fontSize: 16),
                          labelColor: ColorApp.orangeF2,
                          unselectedLabelColor: ColorApp.grey82,
                          tabs: const [
                            Tab(text: 'Lịch sử giao dịch'),
                            Tab(text: 'Sao đang treo'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ];
          },
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TabBarView(
              children: [
                _buildItem(),
                _buildItem2(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildItem() {
    return BlocBuilder(
        bloc: blocWalletHistory,
        builder: (_, state) {
          if (state is LoadSuccess) {
            final history = state.data as ModelHistory;
            history.data ??= [];
            return history.data!.isEmpty
                ? Center(
                    child: Text(
                      "Danh sách trống",
                      style: StyleApp.textStyle400(),
                    ),
                  )
                : ListView(
                    children: List.generate(history.data!.length, (index) {
                      DataHistory model = history.data![index];
                      return itemHistory(model);
                    }),
                  );
          }
          if (state is Loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container();
        });
  }

  _buildItem2() {
    return BlocBuilder(
        bloc: blocTreo,
        builder: (_, state) {
          if (state is LoadSuccess) {
            final listTreo = state.data as List<ModelTreo>;
            return listTreo.isEmpty
                ? Center(
                    child: Text(
                      "Danh sách trống",
                      style: StyleApp.textStyle400(),
                    ),
                  )
                : ListView(
                    children: List.generate(listTreo.length, (index) {
                      return itemTreo(listTreo[index]);
                    }),
                  );
          }
          if (state is Loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container();
        });
  }

  itemHistory(DataHistory model) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            ImagesPath.withdraw,
            width: 50,
            height: 50,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.typeText ?? "Đang cập nhật",
                    style: StyleApp.textStyle700(),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        Const.formatTime(
                            Const.convertNumber(model.createdAt).round() * 1000,
                            format: "HH:mm dd/MM/yyyy"),
                        style: StyleApp.textStyle400(),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Text(
                              '${model.moneyText} ',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.right,
                              style: StyleApp.textStyle400(
                                  color: ColorApp.orangeF01),
                            ),
                            ShaderMask(
                              blendMode: BlendMode.srcIn,
                              shaderCallback: (Rect bounds) =>
                                  const RadialGradient(
                                center: Alignment.topCenter,
                                stops: [0.7, 1],
                                colors: [
                                  ColorApp.whiteF0,
                                  Colors.yellow,
                                ],
                              ).createShader(bounds),
                              child: const Icon(
                                Icons.star,
                                size: 17,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Text(
                    "Số dư trước: ${Const.convertPrice(model.userBuyMoneyBefore)}",
                    style: StyleApp.textStyle400(),
                  ),
                  Text(
                    "Số dư sau: ${Const.convertPrice(model.userBuyMoneyAfter)}",
                    style: StyleApp.textStyle400(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  itemTreo(ModelTreo model) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            ImagesPath.withdraw,
            width: 70,
            height: 70,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AnswerScreenTab(
                                quesID: int.parse(model.questionId ?? '0'),
                              )));
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.note ?? "Đang cập nhật",
                      style: StyleApp.textStyle700(),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          Const.formatTime(
                              Const.convertNumber(model.createdAt).round() *
                                  1000,
                              format: "HH:mm dd/MM/yyyy"),
                          style: StyleApp.textStyle400(),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Text(
                                '${model.money} ',
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.right,
                                style: StyleApp.textStyle400(
                                    color: ColorApp.orangeF01),
                              ),
                              ShaderMask(
                                blendMode: BlendMode.srcIn,
                                shaderCallback: (Rect bounds) => RadialGradient(
                                  center: Alignment.topCenter,
                                  stops: [0.7, 1],
                                  colors: [
                                    ColorApp.whiteF0,
                                    Colors.yellow,
                                  ],
                                ).createShader(bounds),
                                child: Icon(
                                  Icons.star,
                                  size: 17,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
