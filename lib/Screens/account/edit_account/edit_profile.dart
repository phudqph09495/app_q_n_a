import 'dart:io';
import 'package:app_q_n_a/bloc/bloc/auth/bloc_get_user.dart';
import 'package:app_q_n_a/bloc/bloc/auth/bloc_get_user_local.dart';
import 'package:app_q_n_a/bloc/bloc/auth/choose_image_bloc.dart';
import 'package:app_q_n_a/bloc/event_bloc.dart';
import 'package:app_q_n_a/config/path/share_pref_path.dart';
import 'package:app_q_n_a/item/load_image.dart';
import 'package:app_q_n_a/models/model_user.dart';
import 'package:app_q_n_a/validator.dart';
import 'package:app_q_n_a/widget/items/item_load_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
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
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController cmt = TextEditingController();
  TextEditingController phone = TextEditingController();
  String? sex;
  String? address;
  Map<String, dynamic> req = new Map();
  BlocUpdateUser blocUpdateUser = BlocUpdateUser();
  BlocGetUser getUser = BlocGetUser()..add(GetData());
  ChooseImageBloc chooseImageBloc = ChooseImageBloc();
  final keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BlocListener(
        bloc: blocUpdateUser,
        listener: (_, state) async {
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
            DialogItem.hideLoading(context: context);
            await SharePrefsKeys.seveUserKey(state.data as ModelUser);
            context.read<BLocLocalUser>().getUser();
            CustomToast.showToast(
                context: context, msg: "Cập nhật thông tin thành công");
          }
        },
        child: Padding(
          padding: EdgeInsets.all(15),
          child: ElevatedButton(
            onPressed: () {
              print(req);
              blocUpdateUser.add(UpdateProfile(req: req));
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
          bloc: getUser,
          builder: (_, StateBloc state) {
            final user =
                state is LoadSuccess ? state.data as ModelUser : ModelUser();
            return ItemLoadPage(
              state: state,
              onTapErr: () {
                getUser.add(GetData());
              },
              success: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Column(
                  children: [
                    BlocBuilder(
                        bloc: chooseImageBloc,
                        builder: (context, XFile? snapshot) {
                          return Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                      color: ColorApp.orangeF0.withOpacity(0.5),
                                      width: 2),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    ImagePicker _picker = ImagePicker();
                                    _picker
                                        .pickImage(source: ImageSource.gallery)
                                        .then((value) {
                                      if (value != null) {
                                        req["avatar"] = value;
                                      }
                                      chooseImageBloc.getImage(image: value);
                                    });
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: snapshot != null
                                        ? Image.file(
                                            File(snapshot.path),
                                            width: 100,
                                            height: 100,
                                            fit: BoxFit.cover,
                                          )
                                        : LoadImage(
                                            url: Const.image_host +
                                                user.avatarPath.toString() +
                                                user.avatarName.toString(),
                                            width: 100,
                                            height: 100,
                                            fit: BoxFit.cover,
                                          ),
                                  ),
                                ),
                              ),
                              // ignore: prefer_const_constructors
                              Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              color: ColorApp.orangeF0),
                                          shape: BoxShape.circle),
                                      child: const Icon(
                                        Icons.edit,
                                        size: 18,
                                      ))),
                            ],
                          );
                        }),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        itemInput(
                          title: "Họ và tên",
                          hint: Const.checkStringNull(user.username),
                          controller: name,
                          onChanged: (val) {
                            req['username'] = val;
                          },
                        ),
                        itemInput(
                          title: "Phone",
                          hint: Const.checkStringNull(user.phone),
                          readOnly: true,
                          keyboardType: TextInputType.number,
                          controller: phone,
                        ),
                        itemInput(
                          title: "Email",
                          hint: Const.checkStringNull(user.email),
                          controller: email,
                          onChanged: (val) {
                            req['email'] = val;
                          },
                        ),
                        itemDrop(
                          title: "Giới tính",
                          hint: user.sex == null
                              ? "Chưa cập nhật"
                              : user.sex == 1
                                  ? "Nam"
                                  : "Nữ",
                          items: [
                            ModelLocal(id: "1", name: "Nam"),
                            ModelLocal(id: "0", name: "Nữ"),
                          ],
                          onChanged: (val) {
                            req['sex'] = val.id;
                          },
                          value: sex,
                        ),
                        itemInput(
                            title: "Ngày sinh",
                            hint: Const.formatTime((user.birthday ?? 0) * 1000),
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
                                  birthday.text = Const.formatTime(
                                      value.millisecondsSinceEpoch,
                                      format: "dd-MM-yyyy");
                                  req['birthday'] = birthday.text;
                                }
                              });
                            }),
                        itemInput(
                          title: "CMT/CCCD",
                          hint: Const.checkStringNull(user.cmt),
                          controller: cmt,
                          keyboardType: TextInputType.number,
                          onChanged: (val) {
                            req['cmt'] = val;
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
