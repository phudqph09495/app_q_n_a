import 'package:app_q_n_a/config/next_page.dart';
import 'package:app_q_n_a/styles/init_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Screens/account/item/bottom_sheet.dart';
import '../../Screens/account/profile.dart';
import '../../screens_y/product/widget/widgetText.dart';

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
    TitleAccount(iconData: CupertinoIcons.share, title: "Chia sẻ ứng dụng"),
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
            showModalBottomSheet(context: context, builder: (context)=>BottomSheetAccount());
          }),
      TitleAccount(iconData: Icons.bookmark_border, title: "Câu hỏi đã lưu"),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorApp.blue00,
        bottom: PreferredSize(
          child: getAppBottomView(),
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
                  border: Border.all(color: ColorApp.grey82, width: 1),
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
                  border: Border.all(color: ColorApp.grey82, width: 0.5),
                  borderRadius: BorderRadius.circular(10)),
              child: ListTileTheme(
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                dense: true,
                child: ExpansionTile(
                  iconColor: ColorApp.black,
                  collapsedIconColor: ColorApp.black,
                  trailing: const SizedBox(),
                  leading:
                      const Icon(Icons.logout, color: ColorApp.black, size: 16),
                  title: Text(
                    'Đăng xuất',
                    style: StyleApp.textStyle700(
                        color: ColorApp.black, fontSize: 16),
                  ),
                ),
              ),
            ),
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
