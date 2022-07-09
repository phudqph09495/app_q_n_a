import 'dart:io';

import 'package:app_q_n_a/item/input/text_filed2.dart';
import 'package:app_q_n_a/styles/colors.dart';
import 'package:app_q_n_a/styles/init_style.dart';
import 'package:app_q_n_a/validator.dart';
import 'package:flutter/material.dart';
import 'package:app_q_n_a/item/input_text.dart';
import 'package:app_q_n_a/item/button.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toast/toast.dart';

class Add_Answer_Screen extends StatefulWidget {
  @override
  State<Add_Answer_Screen> createState() => _Add_Answer_ScreenState();
}

class _Add_Answer_ScreenState extends State<Add_Answer_Screen> {
  TextEditingController title = TextEditingController();
  TextEditingController answer = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  List<XFile>? _imageFileList = [];
  Future selectImageGallery() async {
    final List<XFile>? selectedImage = await _picker.pickMultiImage();
    if (selectedImage!.isNotEmpty) {
      _imageFileList!.addAll(selectedImage);
    }
    setState(() {});
    print(_imageFileList!.length.toString());
  }

  Future selectImageCamera() async {
    final image = await _picker.pickImage(source: ImageSource.camera);
    if (image == null) return;
    _imageFileList?.add(image);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Button1(
            colorButton: ColorApp.orangeF2,
            textColor: ColorApp.whiteF0,
            radius: 30,
            fontSize: 18,
            style: false,
            border: Border.all(color: ColorApp.orangeF2, width: 0.5),
            textButton: 'Viết câu trả lời',
            ontap: () {
              if ((answer.text == '') && (!_imageFileList!.isNotEmpty)) {
                Toast.show("Bạn chưa thêm câu trả lời",
                    duration: 1, gravity: Toast.bottom);
              } else {
                Toast.show("Thêm câu trả lời thành công",
                    duration: 1, gravity: Toast.bottom);
                Future.delayed(Duration(milliseconds: 1200), () {
                  Navigator.pop(context);
                });
              }
            }),
      ),
      backgroundColor: ColorApp.whiteF7,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorApp.whiteF0,
        title: Text(
          'Trả lời',
          style: StyleApp.textStyle700(
            fontSize: 18,
          ),
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
        reverse: true,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              // InputText(
              //   counter: true,
              //
              //
              //   hint: 'Nhập câu trả lời của bạn',
              //   controller: answer,
              //   maxline: 6,
              //   inputType: TextInputType.multiline,
              // ),
              InputText2(
                counter: true,
                hint: 'Nhập câu trả lời của bạn',
                keyboardType: TextInputType.multiline,
                maxline: 6,
                controller: answer,
                validator: (val) {
                  return ValidatorApp.checkNull(text: val, isTextFiled: true);
                },
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        selectImageCamera();
                      },
                      icon: const Icon(
                        Icons.camera_alt,
                        color: ColorApp.black,
                        size: 30,
                      )),
                  IconButton(
                      onPressed: () {
                        selectImageGallery();
                      },
                      icon: const Icon(
                        Icons.image,
                        color: ColorApp.black,
                        size: 30,
                      )),
                ],
              ),
              _imageFileList!.isNotEmpty
                  ? GridView.builder(
                      itemCount: _imageFileList!.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Image.file(
                          File(_imageFileList![index].path),
                        );
                      })
                  : SizedBox(),

              // Button1(
              //     ontap: () {},
              //     colorButton: ColorApp.orangeF0,
              //     textColor: ColorApp.orangeF01,
              //     radius: 10,
              //     border: Border.all(color: ColorApp.orangeF0),
              //     textButton: 'Đăng câu trả lời'),
            ],
          ),
        ),
      ),
    );
  }
}
