import 'package:app_q_n_a/Screens/login.dart';
import 'package:app_q_n_a/Screens/registration.dart';
import 'package:app_q_n_a/item/button.dart';
import 'package:app_q_n_a/styles/init_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../widget/widget_info/widgetText.dart';

class BodyProduct extends StatefulWidget {
  const BodyProduct({Key? key}) : super(key: key);

  @override
  State<BodyProduct> createState() => _BodyProductState();
}

class _BodyProductState extends State<BodyProduct> {
  int index = 0;

  List<TitleAccount> titleAccount = [
    TitleAccount(iconData: CupertinoIcons.person, title: "Trang cá nhân"),
    TitleAccount(iconData: Icons.edit_outlined, title: "Chỉnh sửa cá nhân"),
    TitleAccount(iconData: Icons.bookmark_border, title: "Câu hỏi đã lưu"),
  ];

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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.main,
      appBar: AppBar(
        backgroundColor: ColorApp.blue00,
        bottom: PreferredSize(
          child: getAppBottomView(),
          preferredSize: const Size.fromHeight(50.0),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 1),
                  borderRadius: BorderRadius.circular(10)),
              child: ListTileTheme(
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                dense: true,
                child: ExpansionTile(
                  iconColor: Colors.white,
                  collapsedIconColor: Colors.white,
                  title: Text(
                    'Cá Nhân',
                    style: StyleApp.textStyle700(
                        color: Colors.white, fontSize: 16),
                  ),
                  children: List.generate(
                    titleAccount.length,
                    (index) => _buildItem(
                      title: titleAccount[index].title,
                      iconData: titleAccount[index].iconData,
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
                  border: Border.all(color: Colors.white, width: 1),
                  borderRadius: BorderRadius.circular(10)),
              child: ListTileTheme(
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                dense: true,
                child: ExpansionTile(
                  iconColor: Colors.white,
                  collapsedIconColor: Colors.white,
                  title: Text(
                    'Về ứng dụng',
                    style: StyleApp.textStyle700(
                        color: Colors.white, fontSize: 16),
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
                  border: Border.all(color: Colors.white, width: 1),
                  borderRadius: BorderRadius.circular(10)),
              child: ListTileTheme(
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                dense: true,
                child: ExpansionTile(
                  iconColor: Colors.white,
                  collapsedIconColor: Colors.white,
                  trailing: const SizedBox(),
                  leading:
                      const Icon(Icons.logout, color: Colors.white, size: 16),
                  title: Text(
                    'Đăng xuất',
                    style: StyleApp.textStyle700(
                        color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Button1(
                colorButton: Colors.red,
                textColor: Colors.white,
                textButton: 'Đăng nhập',
                ontap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                }),
            SizedBox(
              height: 30,
            ),
            Button1(
                colorButton: Colors.blue,
                textColor: Colors.white,
                textButton: 'Đăng ký',
                ontap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegistrationScreen()));
                }),
          ],
        ),
      ),
    );
  }

  _buildItem({required String title, required IconData iconData}) {
    return ListTile(
      title: Text(
        title,
        style: StyleApp.textStyle500(
          color: Colors.white,
        ),
      ),
      leading: Icon(
        iconData,
        color: Colors.white,
        size: 16,
      ),
    );
  }
}

class TitleAccount {
  String title;
  IconData iconData;

  TitleAccount({required this.iconData, required this.title});
}
