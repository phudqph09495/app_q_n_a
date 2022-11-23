import 'package:app_q_n_a/bloc/bloc/notification/bloc_register_notify.dart';
import 'package:app_q_n_a/bloc/check_log_state.dart';
import 'package:app_q_n_a/item/dropdown/Dropdown1.dart';
import 'package:app_q_n_a/item/itemnotifi/listNotifi1.dart';
import 'package:app_q_n_a/item/itemnotifi/listNotifi2.dart';
import 'package:app_q_n_a/styles/colors.dart';
import 'package:app_q_n_a/widget/items/dia_log_item.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import '../../bloc/bloc/question/get_sub_bloc.dart';
import '../../bloc/event_bloc.dart';
import '../../bloc/state_bloc.dart';
import '../../config/path/share_pref_path.dart';
import '../../config/share_pref.dart';
import '../../models/model_local.dart';
import '../../styles/init_style.dart';
import 'package:app_q_n_a/widget/widget_info/widgetText.dart' as user;

import '../../validator.dart';
import '../../widget/items/custom_toast.dart';

class Notificationbar extends StatefulWidget {
  const Notificationbar({Key? key}) : super(key: key);

  @override
  State<Notificationbar> createState() => _NotificationbarState();
}

class _NotificationbarState extends State<Notificationbar> {
  BlocGetSub blocGetSub = BlocGetSub();
  BlocRegisNotify blocRegisNotify = BlocRegisNotify();
  String listId = "";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: BlocListener(
        bloc: blocRegisNotify,
        listener: (_, StateBloc state) {
          CheckLogState.check(
            context,
            state: state,
            success: () async {
              await SharedPrefs.saveString(SharePrefsKeys.notifiSub, listId);
            }
          );
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            bottom: PreferredSize(
              child: TabBar(
                labelColor: ColorApp.black,
                unselectedLabelStyle:
                    StyleApp.textStyle500(color: ColorApp.grey82, fontSize: 16),
                labelStyle: StyleApp.textStyle700(fontSize: 16),
                indicatorColor: ColorApp.orangeF01,
                unselectedLabelColor: ColorApp.grey82,
                tabs: const [
                  Tab(text: "Sự kiện nóng"),
                  Tab(text: "Thông báo"),
                ],
              ),
              preferredSize: Size.zero,
            ),
          ),
          floatingActionButton: BlocListener(
            bloc: blocGetSub,
            listener: (context, state) {
              if (state is LoadSuccess) {
                final list = state.data as List<ModelLocal>;
                final listSub = state.dataSub as List<ModelLocal>;
                regisNotify(
                  list: list,
                  listSub: listSub,
                );
              }
              if (state is LoadFail) {
                DialogItem.hideLoading(context: context);
                DialogItem.showMsg(
                  context: context,
                  title: "Lỗi",
                  msg: state.error,
                );
              }
              if (state is Loading) {
                DialogItem.showLoading(context: context);
              }
            },
            child: FloatingActionButton(
              onPressed: () {
                blocGetSub.add(GetData());
              },
              backgroundColor: ColorApp.orangeF2,
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
          body: TabBarView(
            children: [
              SuKienNong(),
              ThongBao(),
            ],
          ),
        ),
      ),
    );
  }

  regisNotify({
    List<ModelLocal> list = const [],
    List<ModelLocal> listSub = const [],
  }) {
    DialogItem.hideLoading(context: context);
    print(listSub);
    showDialog(
      context: context,
      builder: (context) => MultiSelectDialog(
        items: List.generate(
          list.length,
          (index) => MultiSelectItem(
            list[index],
            list[index].name ?? "",
          ),
        ),
        initialValue: listSub,
        title: Text(
          "Đăng ký nhận thông báo",
          textAlign: TextAlign.center,
          style: StyleApp.textStyle600(fontSize: 18),
        ),
        itemsTextStyle: StyleApp.textStyle400(),
        selectedItemsTextStyle: StyleApp.textStyle400(color: ColorApp.orangeF8),
        selectedColor: ColorApp.orangeF8,
        height: MediaQuery.of(context).size.width * 0.7,
        cancelText: Text(
          "Đóng",
          style: StyleApp.textStyle400(color: Colors.red),
        ),
        confirmText: Text(
          "Xác nhận",
          style: StyleApp.textStyle400(color: ColorApp.orangeF8),
        ),
        onConfirm: (val) async {
          final checkLogin = await SharedPrefs.readBool(SharePrefsKeys.login);
          if (val.isNotEmpty && checkLogin == true) {
            listId = "";
            for (var item in val) {
              ModelLocal data = item as ModelLocal;
              listId = listId + "${data.id ?? ""} ";
            }
            blocRegisNotify.add(
              RegisNotify(
                subject_id: listId,
              ),
            );
          } else if (user.iskyc == false) {
            CustomToast.showToast(
                context: context,
                msg: "Bạn cần xác thực thông tin để thực hiện thao tác này");
          } else if (val.isEmpty) {
            CustomToast.showToast(
                context: context, msg: "Chọn một môn để đăng ký");
          }
        },
      ),
    );
  }
}
