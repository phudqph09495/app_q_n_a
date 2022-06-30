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
import 'package:app_q_n_a/config/next_page.dart';
import 'package:app_q_n_a/item/button.dart';
import 'package:app_q_n_a/styles/init_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import '../../Screens/account/item/bottom_sheet.dart';
import '../../widget/widget_info/widgetText.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';
import '../account/profile.dart';

class BodyProduct extends StatefulWidget {
  @override
  State<BodyProduct> createState() => _BodyProductState();
}

class _BodyProductState extends State<BodyProduct> {
  int index = 0;

  List<TitleAccount> titleAccount = [];

  List<TitleAccount> titleApp = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    titleAccount.addAll([
      TitleAccount(
          iconData: CupertinoIcons.person,
          title: "Trang cá nhân",
          onTap: () {
            Toast.show("Bạn phải đăng nhập mới sử dụng được chức năng này",
                duration: 2, gravity: Toast.bottom);
            PageNavigator.next(context: context, page: ProfileScreen());
          }),
      TitleAccount(
          iconData: Icons.edit_outlined,
          title: "Chỉnh sửa cá nhân",
          onTap: () {
            Toast.show("Bạn phải đăng nhập mới sử dụng được chức năng này",
                duration: 2, gravity: Toast.bottom);
            showModalBottomSheet(
                context: context, builder: (context) => BottomSheetAccount());
          }),
      TitleAccount(
        iconData: CupertinoIcons.bookmark_solid,
        title: "Câu hỏi đã lưu",
        onTap: () {
          Toast.show("Bạn phải đăng nhập mới sử dụng được chức năng này",
              duration: 2, gravity: Toast.bottom);
          PageNavigator.next(context: context, page: QuestionSavedSS());
        },
      ),
      TitleAccount(
          iconData: Icons.wallet,
          title: "Ví điện tử",
          onTap: () {
            Toast.show("Bạn phải đăng nhập mới sử dụng được chức năng này",
                duration: 2, gravity: Toast.bottom);
            PageNavigator.next(context: context, page: ViTien());
          }),
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
            Toast.show("Bạn phải đăng nhập mới sử dụng được chức năng này",
                duration: 2, gravity: Toast.bottom);
            Share.share('Chia sẻ ứng dụng với bạn bè tại  https://hoidap.com/');
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
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                dense: true,
                child: ExpansionTile(
                  iconColor: ColorApp.orangeF01,
                  collapsedIconColor: ColorApp.orangeF01,
                  trailing: const SizedBox(),
                  leading: const Padding(
                    padding: EdgeInsets.only(left: 14),
                    child: Icon(
                      Icons.logout,
                      color: ColorApp.black,
                      size: 16,
                    ),
                  ),
                  title: Text(
                    'Đăng xuất',
                    style: StyleApp.textStyle500(
                        color: ColorApp.black, fontSize: 16),
                  ),
                ),
              ),
            ),
            // const SizedBox(
            //   height: 20,
            // ),
            // Button1(
            //     colorButton: ColorApp.whiteF0,
            //     textColor: ColorApp.black,
            //     textButton: 'Đăng ký',
            //     border: Border.all(color: ColorApp.black00),
            //     radius: 10,
            //     ontap: () {
            //       Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //               builder: (context) => RegistrationScreen()));
            //     }),
            const SizedBox(
              height: 12,
            ),
            Button1(
                border: Border.all(color: ColorApp.orangeF2, width: 0.5),
                colorButton: ColorApp.orangeF2,
                textColor: Colors.white,
                textButton: 'Đăng nhập',
                radius: 5,
                fontSize: 18,
                style: false,
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
