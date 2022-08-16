import 'package:app_q_n_a/bloc/bloc/notification/bloc_register_notify.dart';
import 'package:app_q_n_a/bloc/check_log_state.dart';
import 'package:app_q_n_a/item/dropdown/Dropdown1.dart';
import 'package:app_q_n_a/item/itemnotifi/listNotifi1.dart';
import 'package:app_q_n_a/item/itemnotifi/listNotifi2.dart';
import 'package:app_q_n_a/styles/colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import '../../bloc/bloc/question/get_sub_bloc.dart';
import '../../bloc/event_bloc.dart';
import '../../bloc/state_bloc.dart';
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
  BlocGetSub blocGetSub = BlocGetSub()..add(GetData());
  BlocRegisNotify blocRegisNotify = BlocRegisNotify();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
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
              tabs: [
                Tab(text: "Sự kiện nóng"),
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text("Thông báo"),
                      SizedBox(
                        width: 5,
                      ),
                      IconButton(
                          onPressed: () {
                            regisNotify();
                          },
                          icon: Icon(Icons.more_vert))
                    ],
                  ),
                ),
              ],
            ),
            preferredSize: Size.zero,
          ),
        ),
        body: TabBarView(
          children: [
            SuKienNong(),
            ThongBao(),
          ],
        ),
      ),
    );
  }

  regisNotify() {
    int? monval;
    String? mon;
    showPlatformDialog(
        context: context,
        builder: (context) => BasicDialogAlert(
              title: Text("Nhận thông báo"),
              content: BlocBuilder(
                bloc: blocGetSub,
                builder: (context, state) {
                  final list = state is LoadSuccess
                      ? state.data as List<ModelLocal>
                      : <ModelLocal>[];
                  return DropDown2(
                    listItem: list,
                    hint: 'Chọn môn học',
                    onChanged: (val) {
                      monval = int.parse(val.id);
                    },
                    value: mon,
                  );
                },
              ),
              actions: <Widget>[
                BlocListener(
                  bloc: blocRegisNotify,
                  listener: (_, StateBloc state) {
                    print(state);
                    CheckLogState.check(context,
                        state: state,
                        msg: "Đăng ký nhận thông báo thành công", success: () {

                    });
                  },
                  child: BasicDialogAction(
                    title: Text(
                      "Xác nhận",
                      style: StyleApp.textStyle500(color: Colors.blue),
                    ),
                    onPressed: () {
                      print(monval);
                      if ((monval != null) && (user.iskyc)) {
                        blocRegisNotify.add(RegisNotify(subject_id: monval));
                      } else if (user.iskyc == false) {
                        CustomToast.showToast(
                            context: context,
                            msg:
                                "Bạn cần xác thực thông tin để thực hiện thao tác này");
                      }
                      else if (monval == null) {
                        CustomToast.showToast(
                            context: context, msg: "Chọn một môn để đăng ký");
                      }
                    },
                  ),
                ),
                BasicDialogAction(
                  title: Text(
                    "Trở lại",
                    style: StyleApp.textStyle500(color: Colors.red),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ));
  }
}
