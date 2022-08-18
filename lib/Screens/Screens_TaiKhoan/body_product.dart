import 'package:app_q_n_a/Screens/Screens_Pays/ScreensViPays.dart';
import 'package:app_q_n_a/Screens/Screens_Pays/Screens_Pays.dart';
import 'package:app_q_n_a/Screens/Screens_TaiKhoan/dieuKhoan.dart';
import 'package:app_q_n_a/Screens/Screens_TaiKhoan/lienHe.dart';
import 'package:app_q_n_a/Screens/Screens_TaiKhoan/question2_saved.dart';
import 'package:app_q_n_a/Screens/Screens_TaiKhoan/question_saved.dart';
import 'package:app_q_n_a/Screens/Screens_TaiKhoan/rules.dart';
import 'package:app_q_n_a/Screens/Screens_TaiKhoan/user_manual.dart';
import 'package:app_q_n_a/Screens/account/bank/screen_create_bank.dart';
import 'package:app_q_n_a/Screens/account/edit_account/edit_profile.dart';
import 'package:app_q_n_a/Screens/add_question.dart';
import 'package:app_q_n_a/Screens/login.dart';
import 'package:app_q_n_a/Screens/registration.dart';
import 'package:app_q_n_a/Screens/screen_home.dart';
import 'package:app_q_n_a/bloc/bloc/auth/bloc_get_user_local.dart';
import 'package:app_q_n_a/bloc/bloc/auth/bloc_remove_user.dart';
import 'package:app_q_n_a/bloc/event_bloc.dart';
import 'package:app_q_n_a/bloc/state_bloc.dart';
import 'package:app_q_n_a/config/next_page.dart';
import 'package:app_q_n_a/config/path/share_pref_path.dart';
import 'package:app_q_n_a/item/button.dart';
import 'package:app_q_n_a/main.dart';
import 'package:app_q_n_a/styles/init_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:toast/toast.dart';
import '../../Screens/account/item/bottom_sheet.dart';
import '../../bloc/bloc/auth/bloc_check_login.dart';
import '../../bloc/check_log_state.dart';
import '../../widget/items/dia_log_item.dart';
import '../../widget/widget_info/widgetText.dart' as user;
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';
import '../account/screen_profile.dart';
import 'ThongKe/ThongKe.dart';

import 'package:app_q_n_a/config/share_pref.dart';

int id = 0;
String name = '';
String email = '';
String phone = '';
String sex = '';
bool isLogin = false;

class BodyProduct extends StatefulWidget {
  @override
  State<BodyProduct> createState() => _BodyProductState();
}

class _BodyProductState extends State<BodyProduct> {
  int index = 0;

  List<TitleAccount> titleAccount = [];

  List<TitleAccount> titleApp = [];

  getProfile() async {
    id = await SharedPrefs.readString(SharePrefsKeys.user_id);
    name = await SharedPrefs.readString(SharePrefsKeys.name);
    email = await SharedPrefs.readString(SharePrefsKeys.email);
    phone = await SharedPrefs.readString(SharePrefsKeys.phone);
    isLogin = await SharedPrefs.readBool(SharePrefsKeys.login);
  }

  BlocRemoveUser bloc = BlocRemoveUser();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProfile();
    titleAccount.addAll([
      TitleAccount(
          iconData: CupertinoIcons.person,
          title: "Trang cá nhân",
          onTap: () async {
            PageNavigator.next(context: context, page: ScreenProfile());
          }),
      TitleAccount(
          iconData: Icons.edit_outlined,
          title: "Chỉnh sửa cá nhân",
          onTap: () {
            showModalBottomSheet(
                context: context, builder: (context) => BottomSheetAccount());
          }),
      TitleAccount(
          iconData: Icons.account_balance,
          title: "Ngân hàng",
          onTap: () {
            PageNavigator.next(context: context, page: ScreenCreateBank());
          }),
      TitleAccount(
        iconData: CupertinoIcons.bookmark_solid,
        title: "Câu hỏi đã lưu",
        onTap: () {
          PageNavigator.next(context: context, page: QuestionSavedSS());
        },
      ),
      TitleAccount(
          iconData: Icons.wallet,
          title: "Ví điện tử",
          onTap: () {
            showModalBottomSheet(
                context: context, builder: (context) => ScreensPays());
          }),
      TitleAccount(
        iconData: CupertinoIcons.chart_bar_alt_fill,
        title: "Thống kê",
        onTap: () {
          PageNavigator.next(context: context, page: ThongKe());
        },
      ),
    ]);
    titleApp.addAll([
      TitleAccount(
        iconData: CupertinoIcons.bubble_left,
        title: "Hướng dẫn sử dụng",
        onTap: () {
          PageNavigator.next(context: context, page: UserManual());
        },
      ),
      TitleAccount(
        iconData: CupertinoIcons.square_list,
        title: "Điều khoản",
        onTap: () {
          PageNavigator.next(context: context, page: DieuKhoan());
        },
      ),
      TitleAccount(
        iconData: Icons.checklist,
        title: "Nội quy",
        onTap: () {
          PageNavigator.next(context: context, page: Rules());
        },
      ),
      TitleAccount(
          iconData: CupertinoIcons.share,
          title: "Chia sẻ ứng dụng",
          onTap: () {
            Share.share('Chia sẻ ứng dụng  tại  https://hoidapHTHT.com/');
          }),
      TitleAccount(
        iconData: CupertinoIcons.chat_bubble,
        title: "Liên hệ và góp ý",
        onTap: () {
          PageNavigator.next(context: context, page: LienHe());
        },
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      backgroundColor: ColorApp.whiteF7,
      appBar: AppBar(
        backgroundColor: ColorApp.orangeF2,
        bottom: PreferredSize(
          child: user.ItemAccount(),
          preferredSize: const Size.fromHeight(45.0),
        ),
      ),
      body: BlocBuilder<BlocCheckLogin,StateBloc>(
        builder: (context,StateBloc state) {
          final isLogin = state is LoadSuccess ? state.data as bool : false;
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: ColorApp.main.withOpacity(0.2), width: 0.5),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: ListTileTheme(
                    tileColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                    dense: true,
                    child: ExpansionTile(
                      iconColor: ColorApp.black,
                      collapsedIconColor: ColorApp.black,
                      title: Text(
                        'Cá nhân',
                        style: StyleApp.textStyle700(
                            color: ColorApp.black, fontSize: 16),
                      ),
                      children: List.generate(
                        titleAccount.length,
                        (index) => _buildItem(
                          title: titleAccount[index].title,
                          iconData: titleAccount[index].iconData,
                          onTap: titleAccount[index].onTap,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  decoration: BoxDecoration(
                      // border: Border.all(color: ColorApp.black, width: 0.5),
                      border: Border.all(
                          color: ColorApp.main.withOpacity(0.2), width: 0.5),
                      borderRadius: BorderRadius.circular(5)),
                  child: ListTileTheme(
                    tileColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                    dense: true,
                    child: ExpansionTile(
                      iconColor: ColorApp.black,
                      collapsedIconColor: ColorApp.black,
                      title: Text(
                        'Về ứng dụng',
                        style: StyleApp.textStyle700(
                            color: ColorApp.black, fontSize: 16),
                      ),
                      children: List.generate(
                        titleApp.length,
                        (index) => _buildItem(
                          title: titleApp[index].title,
                          iconData: titleApp[index].iconData,
                          onTap: titleApp[index].onTap,
                        ),
                      ),
                    ),
                  ),
                ),
                !isLogin ? const SizedBox() : BlocListener(
                  bloc: bloc,
                  listener: (_, StateBloc state) {
                    CheckLogState.check(context,
                        state: state,
                        msg: "Xóa tài khoản thành công", success: () async {
                      await SharePrefsKeys.removeAllKey();
                      user.userID = 0;
                      user.iskyc = false;
                      context.read<BlocCheckLogin>().add(GetData());
                      Navigator.pop(context);
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Button1(
                      border: Border.all(color: ColorApp.orangeF2, width: 0.5),
                      colorButton: ColorApp.orangeF2,
                      textColor: Colors.white,
                      textButton: 'Xóa tài khoản',
                      radius: 5,
                      fontSize: 18,
                      style: false,
                      height: 40,
                      ontap: () {
                        DialogItem.showMsg(
                            context: context,
                            title: "Xóa tài khoản",
                            msg: "Bạn có muôn xóa tài khoản này không?",
                            onTap: () {
                              bloc.add(GetData());
                            });
                      },
                    ),
                  ),
                ),
                isLogin
                    ? Button1(
                        border: Border.all(color: ColorApp.orangeF2, width: 0.5),
                        colorButton: ColorApp.orangeF2,
                        textColor: Colors.white,
                        textButton: 'Đăng xuất',
                        radius: 5,
                        fontSize: 18,
                    height: 40,
                        style: false,
                        ontap: () {
                          DialogItem.showMsg(
                            context: context,
                            title: "Đăng xuất",
                            msg: "Bạn có muôn đăng xuất tài khoản này không?",
                            logout: true,
                            titleButton: "Đồng ý",
                          );
                        })
                    : Button1(
                        border: Border.all(color: ColorApp.orangeF2, width: 0.5),
                        colorButton: ColorApp.orangeF2,
                        textColor: Colors.white,
                        textButton: 'Đăng nhập',
                        radius: 5,
                        fontSize: 18,
                        style: false,
                        ontap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        })
              ],
            ),
          );
        }
      ),
    );
  }

  _buildItem(
      {required String title, required IconData iconData, Function()? onTap}) {
    return ListTile(
      onTap: onTap,
      title: Text(
        title,
        style: StyleApp.textStyle500(
          color: ColorApp.black,
        ),
      ),
      leading: Padding(
        padding: EdgeInsets.only(left: 12),
        child: Icon(
          iconData,
          color: ColorApp.black,
          size: 16,
        ),
      ),
    );
  }
}

class TitleAccount {
  String title;
  IconData iconData;
  Function()? onTap;

  TitleAccount({required this.iconData, required this.title, this.onTap});
}
