import 'dart:io';

import 'package:app_q_n_a/Screens/Screens_TaiKhoan/body_product.dart';
import 'package:app_q_n_a/item/input/text_filed2.dart';
import 'package:app_q_n_a/item/input_text.dart';
import 'package:app_q_n_a/styles/init_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

import '../../item/button.dart';

class NapTien extends StatefulWidget {
  const NapTien({Key? key}) : super(key: key);

  @override
  State<NapTien> createState() => _NapTienState();
}

class _NapTienState extends State<NapTien> {
  TextEditingController Money = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  List<XFile>? _imageFileList = [];

  Future selectImageCamera() async {
    final image = await _picker.pickImage(source: ImageSource.camera);
    if (image == null) return;
    _imageFileList?.add(image);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.whiteF0,
      appBar: AppBar(
        backgroundColor: ColorApp.whiteF0,
        centerTitle: true,
        title: Text(
          'Nạp tiền',
          style: StyleApp.textStyle700(fontSize: 16),
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Tỷ lệ chuyển đổi',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InputText2(
                    keyboardType: TextInputType.number,
                    controller: Money,
                    hint: 'Nhập số tiền cần nạp',
                    radius: 5,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: const [
                      Text(
                        'Số tiền cần thanh toán:  ',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      Text(
                        '10.000đ',
                        style:
                            TextStyle(color: ColorApp.orangeF01, fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Thông tin thanh toán',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Card(
                    child: _Cardnganhang(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  _imageFileList!.isNotEmpty
                      ? GridView.builder(
                          itemCount: _imageFileList!.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3),
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return Image.file(
                              File(_imageFileList![index].path),
                            );
                          })
                      : SizedBox(),
                  const SizedBox(
                    height: 10,
                  ),
                  Card(
                    child: _Cammera(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Button1(
                      border: Border.all(color: ColorApp.orangeF2, width: 0.5),
                      colorButton: ColorApp.orangeF2,
                      textColor: Colors.white,
                      textButton: 'Xác nhận',
                      radius: 5,
                      fontSize: 18,
                      style: false,
                      ontap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => BodyProduct()));
                      })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding _Cammera() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              selectImageCamera();
            },
            icon: const Icon(
              Icons.camera_alt,
              size: 30,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              children: const [
                Text(
                  'Ảnh giao dịch thàng công trên moble , hoặc nạp tiền từ ngân hàng',
                  style: TextStyle(color: ColorApp.black, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Cardnganhang extends StatelessWidget {
  const _Cardnganhang({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                'Ngân hàng: ',
                style: TextStyle(color: ColorApp.black, fontSize: 14),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text(
                        'Thương Mại Cổ Phần Á Châu (ACB)',
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const Divider(
            color: ColorApp.grey82,
          ),
          Row(
            children: [
              const Text(
                'Số tài khoản: ',
                style: TextStyle(color: ColorApp.black, fontSize: 14),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text(
                        '973266666',
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const Divider(
            color: ColorApp.grey82,
          ),
          Row(
            children: [
              const Text(
                'Chủ tài khoản: ',
                style: TextStyle(color: ColorApp.black, fontSize: 14),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text(
                        'Công ty TNHH Hỏi và Đáp',
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const Divider(
            color: ColorApp.grey82,
          ),
          Row(
            children: [
              const Text(
                'Chi nhánh: ',
                style: TextStyle(color: ColorApp.black, fontSize: 14),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text(
                        'CN Hà Thành - Hà Nội',
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
