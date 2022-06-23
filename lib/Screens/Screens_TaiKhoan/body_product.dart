import 'package:app_q_n_a/Screens/Screens_Pays/Screens_Pays.dart';
import 'package:app_q_n_a/Screens/Screens_TaiKhoan/question_saved.dart';
import 'package:app_q_n_a/Screens/Screens_TaiKhoan/user_manual.dart';
import 'package:app_q_n_a/Screens/login.dart';
import 'package:app_q_n_a/Screens/registration.dart';
import 'package:app_q_n_a/config/next_page.dart';
import 'package:app_q_n_a/item/button.dart';
import 'package:app_q_n_a/styles/init_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import '../../Screens/account/item/bottom_sheet.dart';
import '../../Screens/account/profile.dart';
import '../../widget/widget_info/widgetText.dart';
import '../account/tab_profile/tab_answer.dart';
import 'package:url_launcher/url_launcher.dart';

class BodyProduct extends StatefulWidget {
  const BodyProduct({Key? key}) : super(key: key);

  @override
  State<BodyProduct> createState() => _BodyProductState();
}

class _BodyProductState extends State<BodyProduct> {
  int index = 0;

  List<TitleAccount> titleAccount = [];

  List<TitleAccount> titleApp = [
    // TitleAccount(
    //     iconData: CupertinoIcons.bubble_left, title: "Hướng dẫn sử dụng"),
    // TitleAccount(iconData: CupertinoIcons.square_list, title: "Điều khoản"),
    // TitleAccount(iconData: Icons.checklist, title: "Nội quy"),
    // TitleAccount(
    //   iconData: CupertinoIcons.share,
    //   title: "Chia sẻ ứng dụng",
    //   // onTap: () {
    //   //   Share.share("Chia sẽ ứng dụng");
    //   // },
    //   onTap: () => launch('https://hoidap247.com/'),
    // ),
    // TitleAccount(iconData: Icons.wallet, title: "Ví điện tử"),
    // TitleAccount(
    //     iconData: CupertinoIcons.chat_bubble, title: "Liên hệ và góp ý"),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    titleAccount.addAll([
      TitleAccount(
          iconData: CupertinoIcons.person,
          title: "Trang cá nhân",
          onTap: () {
            PageNavigator.next(context: context, page: ProfileScreen());
          }),
      TitleAccount(
          iconData: Icons.edit_outlined,
          title: "Chỉnh sửa cá nhân",
          onTap: () {
            showModalBottomSheet(
                context: context, builder: (context) => BottomSheetAccount());
          }),
      TitleAccount(
        iconData: CupertinoIcons.bookmark_solid,
        title: "Câu hỏi đã lưu",
        onTap: () {
          PageNavigator.next(context: context, page: Question_saved());
        },
        // onTap: () => launch('https://hoidap247.com/'),
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
        onTap: () =>
            launch('https://hoidap247.com/cac-dieu-khoan-tren-hoidap247'),
      ),
      TitleAccount(
        iconData: Icons.checklist,
        title: "Nội quy",
        onTap: () => launch('https://hoidap247.com/noi-quy'),
      ),
      TitleAccount(
        iconData: CupertinoIcons.share,
        title: "Chia sẻ ứng dụng",
        // onTap: () {
        //   Share.share("Chia sẽ ứng dụng");
        // },
        onTap: () => launch('https://hoidap247.com/'),
      ),
      TitleAccount(
          iconData: Icons.wallet,
          title: "Ví điện tử",
          onTap: () {
            showModalBottomSheet(
                context: context, builder: (context) => ScreensPays());
          }),
      TitleAccount(
        iconData: CupertinoIcons.chat_bubble,
        title: "Liên hệ và góp ý",
        onTap: () => launch('https://hoidap247.com/gop-y'),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.whiteF0,
      appBar: AppBar(
        backgroundColor: ColorApp.whiteF0,
        bottom: PreferredSize(
          child: getAppBottomView(context),
          preferredSize: const Size.fromHeight(45.0),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: ColorApp.black00, width: 1),
                  borderRadius: BorderRadius.circular(10)),
              child: ListTileTheme(
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
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
                  border: Border.all(color: ColorApp.black00, width: 1),
                  borderRadius: BorderRadius.circular(10)),
              child: ListTileTheme(
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
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
            const SizedBox(
              height: 12,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: ColorApp.black00, width: 1),
                  borderRadius: BorderRadius.circular(10)),
              child: ListTileTheme(
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                dense: true,
                child: ExpansionTile(
                  iconColor: ColorApp.orangeF01,
                  collapsedIconColor: ColorApp.orangeF01,
                  trailing: const SizedBox(),
                  leading: const Icon(Icons.logout,
                      color: ColorApp.black, size: 16),
                  title: Text(
                    'Đăng xuất',
                    style: StyleApp.textStyle700(
                        color: ColorApp.black, fontSize: 16),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Button1(
                colorButton: ColorApp.whiteF0,
                textColor: ColorApp.black,
                textButton: 'Đăng ký',
                border: Border.all(color: ColorApp.black00),
                radius: 10,
                ontap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegistrationScreen()));
                }),
            const SizedBox(
              height: 20,
            ),
            Button1(
                colorButton: ColorApp.whiteF0,
                textColor: ColorApp.black,
                textButton: 'Đăng nhập',
                border: Border.all(color: ColorApp.black00),
                radius: 10,
                ontap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
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
      leading: Icon(
        iconData,
        color: ColorApp.black,
        size: 16,
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
