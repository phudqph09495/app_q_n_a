import 'package:flutter/material.dart';
import '../navigation/screenNavigation.dart';
import '../../screens_y/product/widget/widgetText.dart';

class BodyProduct extends StatefulWidget {
  const BodyProduct({Key? key}) : super(key: key);

  @override
  State<BodyProduct> createState() => _BodyProductState();
}

class _BodyProductState extends State<BodyProduct> {
  bool _expanded = false;
  var _test = "Full Screen";
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(1),
          ),
        ),
        bottom: PreferredSize(
          child: getAppBottomView(),
          preferredSize: const Size.fromHeight(50.0),
        ),
      ),
      body: Column(
        children: const [
          ExpansionTile(
            iconColor: Colors.white,
            title: Text(
              'Cá Nhân',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            children: [
              ListTile(
                title: Text(
                  'Trang cá nhân',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
                leading: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
              ListTile(
                title: Text(
                  'Chỉnh sửa cá nhân',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
                leading: Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
              ),
              ListTile(
                title: Text(
                  'Câu hỏi đã lưu',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
                leading: Icon(
                  Icons.bookmark,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          ExpansionTile(
            iconColor: Colors.white,
            title: Text(
              'Về Ứng dụng',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            children: [
              ListTile(
                title: Text(
                  'Hướng dẫn sử dụng',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
                leading: Icon(
                  Icons.menu_book,
                  color: Colors.white,
                ),
              ),
              ListTile(
                title: Text(
                  'Nội quy',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
                leading: Icon(
                  Icons.animation,
                  color: Colors.white,
                ),
              ),
              ListTile(
                title: Text(
                  'Phiên bản ứng dụng',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
                leading: Icon(
                  Icons.alternate_email_rounded,
                  color: Colors.white,
                ),
              ),
            ],
          ),

        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Trang chủ",
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: "Thông báo",
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Tài khoản",
              backgroundColor: Colors.red),
        ],
        currentIndex: 2,
      ),
      // child: SizedBox(
      //   width: 450,
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     children: [
      //       DropdownButton(
      //         // Initial Value
      //         value: dropdownvalue,
      //         // Down Arrow Icon
      //         icon: const Icon(Icons.keyboard_arrow_down),
      //
      //         // Array list of items
      //         items: items.map((String items) {
      //           return DropdownMenuItem(
      //             value: items,
      //             child: Text(items),
      //           );
      //         }).toList(),
      //         // After selecting the desired option,it will
      //         // change button value to selected value
      //         onChanged: (String? newValue) {
      //           setState(() {
      //             dropdownvalue = newValue!;
      //           });
      //         },
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
