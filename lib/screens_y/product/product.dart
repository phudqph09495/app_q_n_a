import 'package:flutter/material.dart';
import '../../screens_y/product/body_product.dart';
import '../../screens_y/product/widget/widgetText.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  // // Initial Selected Value
  // String dropdownvalue = "Trang cá nhân";
  // // List of items in our dropdown menu
  // var items = [
  //   'Trang cá nhân',
  //   'Chỉnh sửa trang cá nhân',
  //   'Câu hỏi câu trả lời',
  // ];
  // bool _expanded = false;
  // var _test = "Full Screen";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodyProduct(),
    );
  }
}
