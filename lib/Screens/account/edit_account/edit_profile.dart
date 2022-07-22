import 'dart:io';
import 'package:app_q_n_a/bloc/bloc/auth/bloc_get_profile.dart';
import 'package:app_q_n_a/bloc/event_bloc.dart';
import 'package:app_q_n_a/config/path/share_pref_path.dart';
import 'package:app_q_n_a/models/model_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../bloc/bloc/auth/update_users.dart';
import '../../../bloc/provider/user_provider.dart';
import '../../../config/path/share_pref_path.dart';
import '../../../config/path/share_pref_path.dart';
import '../../../config/share_pref.dart';
import '../../../item/drop_item.dart';
import '../../../item/input/text_filed2.dart';
import '../../../models/model_local.dart';
import '../../../styles/init_style.dart';

class EditProfile extends StatelessWidget {
  TextEditingController birthday = TextEditingController();
  String? sex;
  Map req = new Map();
  getDataReq(ModelUser user) {
    req['sex'] = user.sex ?? "";
    req['birthday'] = user.birthday ?? "";
    req['address'] = user.address ?? "";
  }

  BlocGetProfile blocGetProfile = BlocGetProfile()..add(GetData());
  BlocUpdateUser blocUpdateUser = BlocUpdateUser();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.whiteF0,
      appBar: AppBar(
        backgroundColor: ColorApp.whiteF0,
        centerTitle: true,
        title: Text(
          "Chỉnh sửa thông tin",
          style: StyleApp.textStyle700(fontSize: 18),
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
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Thông tin chung của tài khoản",
              style: StyleApp.textStyle700(color: Colors.black),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 10),
            _buildTitleDrop(
              title: "Giới thiệu",
              listItem: [
                ModelLocal(id: "Nam", name: "Nam"),
                ModelLocal(id: "Nữ", name: "Nữ"),
              ],
            ),
            _buildTitleDrop(
              title: "Ngày sinh",
              isTextFiled: true,
              textEditingController: birthday,
              onTap: () {
                choieDate(context);
              },
              listItem: [],
            ),
            // _buildTitleDrop(
            //   title: "Lớp",
            //   listItem: [
            //     ModelLocal(id: "lop-1", name: "Lớp 1"),
            //     ModelLocal(id: "lop-2", name: "Lớp 2"),
            //     ModelLocal(id: "lop-3", name: "Lớp 3"),
            //     ModelLocal(id: "lop-4", name: "Lớp 4"),
            //     ModelLocal(id: "lop-5", name: "Lớp 5"),
            //     ModelLocal(id: "lop-6", name: "Lớp 6"),
            //     ModelLocal(id: "lop-7", name: "Lớp 7"),
            //     ModelLocal(id: "lop-8", name: "Lớp 8"),
            //     ModelLocal(id: "lop-9", name: "Lớp 9"),
            //     ModelLocal(id: "lop-10", name: "Lớp 10"),
            //     ModelLocal(id: "lop-11", name: "Lớp 11"),
            //     ModelLocal(id: "lop-12", name: "Lớp 12"),
            //   ],
            // ),
            Text(
              "Thông tin khác",
              style: StyleApp.textStyle700(color: Colors.black),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 10),
            _buildTitleDrop(
              title: "Tỉnh thành",
              listItem: [
                ModelLocal(id: "ha-noi", name: "Hà Nội"),
                ModelLocal(id: "tp-ho-chi-minh", name: "TP. Hồ Chí Minh"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: ColorApp.orangeF2,
                  ),
                  child: Text(
                    "Đồng ý",
                    style: StyleApp.textStyle700(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: ColorApp.orangeF01,
                  ),
                  child: Text(
                    "Hủy",
                    style: StyleApp.textStyle700(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  choieDate(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1970, 1, 1),
      lastDate: DateTime(2222, 1, 1),
      locale: const Locale("vi"),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: ColorApp.main, // <-- SEE HERE
              onPrimary: Colors.white, // <-- SEE HERE
              onSurface: Colors.black, // <-- SEE HERE
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: ColorApp.main, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    ).then((value) {
      if (value != null) {
        birthday.text = DateFormat.yMd().format(value);
      }
    });
  }

  _buildTitleDrop({
    required List<ModelLocal> listItem,
    required String title,
    bool isTextFiled = false,
    Function()? onTap,
    TextEditingController? textEditingController,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              title,
              style: StyleApp.textStyle500(color: Colors.black),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 5,
            child: SizedBox(
              height: 40,
              child: isTextFiled
                  ? InputText2(
                      hint: "--/--/----",
                      onChanged: (val) {},
                      controller: textEditingController,
                      radius: 5,
                      readOnly: true,
                      onTap: onTap,
                      keyboardType: TextInputType.datetime,
                    )
                  : DropItem(
                      listItem: listItem,
                      filled: false,
                      colorBorder: ColorApp.black00,
                      hint: "--Chọn--",
                      onChanged: (val) {},
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
