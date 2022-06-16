import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../item/drop_item.dart';
import '../../../item/input/text_filed2.dart';
import '../../../models/model_local.dart';
import '../../../styles/init_style.dart';

class EditProfile extends StatelessWidget {
  TextEditingController birthday = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Text(
          "Chỉnh sửa thông tin",
          style: StyleApp.textStyle700(fontSize: 18),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Platform.isAndroid ? Icons.back_hand : Icons.arrow_back_ios,
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
            _buildTitleDrop(
              title: "Lớp",
              listItem: [
                ModelLocal(id: "nam", name: "Nam"),
                ModelLocal(id: "nu", name: "Nữ"),
              ],
            ),
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
                  style:  ElevatedButton.styleFrom(
                    primary: ColorApp.main,
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
                  style:  ElevatedButton.styleFrom(
                    primary: ColorApp.grey4F,
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
                      borderColor: ColorApp.black,
                      radius: 5,
                      readOnly: true,
                      onTap: onTap,
                      keyboardType: TextInputType.datetime,
                    )
                  : DropItem(
                      listItem: listItem,
                      filled: false,
                      colorBorder: ColorApp.black,
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
