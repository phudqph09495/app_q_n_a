import 'dart:io';
import 'package:app_q_n_a/bloc/event_bloc.dart';
import 'package:app_q_n_a/config/path/share_pref_path.dart';
import 'package:app_q_n_a/item/load_image.dart';
import 'package:app_q_n_a/models/model_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../../bloc/bloc/auth/update_users.dart';
import '../../../bloc/provider/user_provider.dart';
import '../../../bloc/state_bloc.dart';
import '../../../config/const.dart';
import '../../../config/path/share_pref_path.dart';
import '../../../config/share_pref.dart';
import '../../../item/drop_item.dart';
import '../../../item/input/text_filed2.dart';
import '../../../models/model_local.dart';
import '../../../path/image_path.dart';
import '../../../styles/init_style.dart';
import '../../../widget/items/custom_toast.dart';
import '../../../widget/items/dia_log_item.dart';
import '../../../widget/items/item_input.dart';
import '../../../widget/items/itemdrop.dart';

class EditProfile extends StatefulWidget {
  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController birthday = TextEditingController();
  String? sex;
  String? address;
  Map req = new Map();
  BlocUpdateUser blocUpdateUser = BlocUpdateUser()..add(UpdateProfile());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  bool update = false;
  getDataReq(ModelUser user) {
    req['sex'] = user.sex ?? "";
    req['address'] = user.address ?? "";
    req['birthday'] = user.birthday ?? "";

    SharedPrefs.saveString(SharePrefsKeys.email, user.email);
    SharedPrefs.saveString(SharePrefsKeys.phone, user.phone);
    SharedPrefs.saveString(SharePrefsKeys.avatar, user.avatarName);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BlocListener(
        bloc: blocUpdateUser,
        listener: (_, state) {
          if (state is Loading) {
            DialogItem.showLoading(context: context);
          }
          if (state is LoadFail) {
            DialogItem.hideLoading(context: context);
            DialogItem.showMsg(
              context: context,
              title: "Lỗi",
              msg: state.error,
            );
          }
          if (state is LoadSuccess) {
            update = true;
            DialogItem.hideLoading(context: context);
            CustomToast.showToast(
                context: context,
                msg: state.data["message"] ?? "Cập nhật thông tin thành công");
          }
        },
        child: Padding(
          padding: EdgeInsets.all(15),
          child: ElevatedButton(
            onPressed: () {
              if (req['sex'] != "" &&
                  req['address'] != "" &&
                  req['birthday'] != "") {
                blocUpdateUser.add(UpdateProfile(
                    sex: req['sex'],
                    district_id: req['address'],
                    birthday: req['birthday']));
              } else {
                DialogItem.showMsg(
                  context: context,
                  title: "Lỗi",
                  msg: "Vui lòng nhập đầy đủ thông tin",
                );
              }
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(10, 50),
              primary: ColorApp.orangeF2,
            ),
            child: Text(
              "Lưu",
              style: StyleApp.textStyle700(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
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
      body: BlocBuilder(
          bloc: blocUpdateUser,
          builder: (_, state) {
            if (state is LoadSuccess) {
              print(state.data);
              final user = state.data as ModelUser;
              getDataReq(user);
              return SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                            color: ColorApp.orangeF0.withOpacity(0.5),
                            width: 2),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: LoadImage(
                            url: ImagesPath.defultAvatar.toString(),
                            width: 100,
                            height: 100),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        itemDrop(
                          title: "Giới tính",
                          hint: Const.checkStringNull(user.sex),
                          items: [
                            ModelLocal(id: "1", name: "Nam"),
                            ModelLocal(id: "2", name: "Nữ"),
                          ],
                          onChanged: (val) {
                            req['sex'] = val.name;
                          },
                          value: sex,
                        ),
                        itemInput(
                            title: "Ngày sinh",
                            // hint: Const.checkStringNull(user.birthday),
                            controller: birthday,
                            readOnly: true,
                            onChanged: (val) {
                              req['birthday'] = val;
                            },
                            onTap: () {
                              showDatePicker(
                                context: context,
                                locale: const Locale('vi'),
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1970),
                                lastDate: DateTime(2100),
                              ).then((value) {
                                if (value != null) {
                                  birthday.text =
                                      "${value.day}/${value.month}/${value.year}";
                                  req['birthday'] = birthday.text;
                                }
                              });
                            }),
                        const SizedBox(height: 10),
                        itemDrop(
                          title: "Tỉnh thành",
                          hint: Const.checkStringNull(user.address),
                          items: [
                            ModelLocal(id: "Hà Nội", name: "Hà Nội"),
                            ModelLocal(
                                id: "Tp Hồ Chí Minh", name: "Tp Hồ Chí Minh"),
                          ],
                          onChanged: (val) {
                            req['address'] = val.name;
                          },
                          value: address,
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }
            return Container();
          }),
    );
  }
}
