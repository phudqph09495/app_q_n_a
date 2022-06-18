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

class BodyProduct extends StatefulWidget {
  const BodyProduct({Key? key}) : super(key: key);

  @override
  State<BodyProduct> createState() => _BodyProductState();
}

class _BodyProductState extends State<BodyProduct> {
  int index = 0;

  List<TitleAccount> titleAccount = [];

  List<TitleAccount> titleApp = [
    TitleAccount(
        iconData: CupertinoIcons.bubble_left, title: "Hướng dẫn sử dụng"),
    TitleAccount(iconData: CupertinoIcons.square_list, title: "Điều khoản"),
    TitleAccount(iconData: Icons.checklist, title: "Nội quy"),
    TitleAccount(
      iconData: CupertinoIcons.share,
      title: "Chia sẻ ứng dụng",
      onTap: () {
        Share.share("Chia sẽ ứng dụng");
      },
    ),
    TitleAccount(iconData: CupertinoIcons.star, title: "Bình chọn 5*"),
    TitleAccount(
        iconData: CupertinoIcons.chat_bubble, title: "Liên hệ và góp ý"),
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
            PageNavigator.next(context: context, page: ProfileScreen());
          }),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.orangeF0,
      appBar: AppBar(
        backgroundColor: ColorApp.orangeF0,
        bottom: PreferredSize(
          child: getAppBottomView(context),
          preferredSize: const Size.fromHeight(40.0),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: ColorApp.grey82, width: 1),
                  borderRadius: BorderRadius.circular(10)),
              child: ListTileTheme(
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                dense: true,
                child: ExpansionTile(
                  iconColor: ColorApp.orangeF01,
                  collapsedIconColor: ColorApp.orangeF01,
                  title: Text(
                    'Cá nhân',
                    style: StyleApp.textStyle700(
                        color: ColorApp.orangeF01, fontSize: 16),
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
                  border: Border.all(color: ColorApp.orangeF01, width: 1),
                  borderRadius: BorderRadius.circular(10)),
              child: ListTileTheme(
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                dense: true,
                child: ExpansionTile(
                  iconColor: ColorApp.orangeF01,
                  collapsedIconColor: ColorApp.orangeF01,
                  title: Text(
                    'Về ứng dụng',
                    style: StyleApp.textStyle700(
                        color: ColorApp.orangeF01, fontSize: 16),
                  ),
                  children: List.generate(
                    titleApp.length,
                    (index) => _buildItem(
                      title: titleApp[index].title,
                      iconData: titleApp[index].iconData,
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
                  border: Border.all(color: ColorApp.orangeF01, width: 1),
                  borderRadius: BorderRadius.circular(10)),
              child: ListTileTheme(
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                dense: true,
                child: ExpansionTile(
                  iconColor: ColorApp.orangeF01,
                  collapsedIconColor: ColorApp.orangeF01,
                  trailing: const SizedBox(),
                  leading: const Icon(Icons.logout,
                      color: ColorApp.orangeF01, size: 16),
                  title: Text(
                    'Đăng xuất',
                    style: StyleApp.textStyle700(
                        color: ColorApp.orangeF01, fontSize: 16),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Button1(
                colorButton: ColorApp.orangeF0,
                textColor: ColorApp.orangeF01,
                textButton: 'Đăng ký',
                border: Border.all(color: ColorApp.orangeF01),
                radius: 10,
                ontap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegistrationScreen()));
                }),
            SizedBox(
              height: 20,
            ),
            Button1(
                colorButton: ColorApp.orangeF0,
                textColor: ColorApp.orangeF01,
                textButton: 'Đăng nhập',
                border: Border.all(color: ColorApp.orangeF01),
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
          color: ColorApp.orangeF01,
        ),
      ),
      leading: Icon(
        iconData,
        color: ColorApp.orangeF01,
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
