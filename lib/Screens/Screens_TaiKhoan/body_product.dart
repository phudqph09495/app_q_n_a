import 'package:app_q_n_a/Screens/Screens_Pays/ScreensViPays.dart';
import 'package:app_q_n_a/Screens/Screens_Pays/Screens_Pays.dart';
import 'package:app_q_n_a/Screens/Screens_TaiKhoan/dieuKhoan.dart';
import 'package:app_q_n_a/Screens/Screens_TaiKhoan/lienHe.dart';
import 'package:app_q_n_a/Screens/Screens_TaiKhoan/question2_saved.dart';
import 'package:app_q_n_a/Screens/Screens_TaiKhoan/question_saved.dart';
import 'package:app_q_n_a/Screens/Screens_TaiKhoan/rules.dart';
import 'package:app_q_n_a/Screens/Screens_TaiKhoan/user_manual.dart';
import 'package:app_q_n_a/Screens/account/edit_account/edit_profile.dart';
import 'package:app_q_n_a/Screens/add_question.dart';
import 'package:app_q_n_a/Screens/login.dart';
import 'package:app_q_n_a/Screens/registration.dart';
import 'package:app_q_n_a/Screens/screen_home.dart';
import 'package:app_q_n_a/config/next_page.dart';
import 'package:app_q_n_a/config/path/share_pref_path.dart';
import 'package:app_q_n_a/item/button.dart';
import 'package:app_q_n_a/main.dart';
import 'package:app_q_n_a/styles/init_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:toast/toast.dart';
import '../../Screens/account/item/bottom_sheet.dart';
import '../../widget/items/dia_log_item.dart';
import '../../widget/widget_info/widgetText.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';
import '../account/profile.dart';
import 'ThongKe/ThongKe.dart';

import 'package:app_q_n_a/config/share_pref.dart';

int id = 0;
String name = '';
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
    isLogin = await SharedPrefs.readBool(SharePrefsKeys.login);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProfile();
    titleAccount.addAll([
      TitleAccount(
          iconData: CupertinoIcons.person,
          title: "Trang c?? nh??n",
          onTap: () async {
            PageNavigator.next(
                context: context,
                page: ProfileScreen(context: context, name: name));
          }),
      TitleAccount(
          iconData: Icons.edit_outlined,
          title: "Ch???nh s???a c?? nh??n",
          onTap: () {
            showModalBottomSheet(
                context: context, builder: (context) => BottomSheetAccount());
          }),
      TitleAccount(
        iconData: CupertinoIcons.bookmark_solid,
        title: "C??u h???i ???? l??u",
        onTap: () {
          PageNavigator.next(context: context, page: QuestionSavedSS());
        },
      ),
      TitleAccount(
          iconData: Icons.wallet,
          title: "V?? ??i???n t???",
          onTap: () {
            showModalBottomSheet(
                context: context, builder: (context) => ScreensPays());
          }),
      TitleAccount(
        iconData: CupertinoIcons.chart_bar_alt_fill,
        title: "Th???ng k??",
        onTap: () {
          PageNavigator.next(context: context, page: ThongKe());
        },
      ),
    ]);
    titleApp.addAll([
      TitleAccount(
        iconData: CupertinoIcons.bubble_left,
        title: "H?????ng d???n s??? d???ng",
        onTap: () {
          PageNavigator.next(context: context, page: UserManual());
        },
      ),
      TitleAccount(
        iconData: CupertinoIcons.square_list,
        title: "??i???u kho???n",
        onTap: () {
          PageNavigator.next(context: context, page: DieuKhoan());
        },
      ),
      TitleAccount(
        iconData: Icons.checklist,
        title: "N???i quy",
        onTap: () {
          PageNavigator.next(context: context, page: Rules());
        },
      ),
      TitleAccount(
          iconData: CupertinoIcons.share,
          title: "Chia s??? ???ng d???ng",
          onTap: () {
            Share.share('Chia s??? ???ng d???ng  t???i  https://hoidapHTHT.com/');
          }),
      TitleAccount(
        iconData: CupertinoIcons.chat_bubble,
        title: "Li??n h??? v?? g??p ??",
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
          child: getAppBottomView(
              context: context, id: (id != 0) ? id.toString() : '', name: name),
          preferredSize: const Size.fromHeight(45.0),
        ),
      ),
      body: SingleChildScrollView(
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
                    'C?? nh??n',
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
                    'V??? ???ng d???ng',
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
            const SizedBox(
              height: 12,
            ),
            isLogin
                ? Button1(
                    border: Border.all(color: ColorApp.orangeF2, width: 0.5),
                    colorButton: ColorApp.orangeF2,
                    textColor: Colors.white,
                    textButton: '????ng xu???t',
                    radius: 5,
                    fontSize: 18,
                    style: false,
                    ontap: () {
                      id=0;
                      DialogItem.showMsg(
                        context: context,
                        title: "????ng xu???t",
                        msg: "B???n c?? mu??n ????ng xu???t t??i kho???n n??y kh??ng?",
                        logout: true,
                        titleButton: "?????ng ??",
                      );
                    })
                : Button1(
                    border: Border.all(color: ColorApp.orangeF2, width: 0.5),
                    colorButton: ColorApp.orangeF2,
                    textColor: Colors.white,
                    textButton: '????ng nh???p',
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
