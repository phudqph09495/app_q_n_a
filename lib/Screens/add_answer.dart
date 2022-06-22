import 'dart:io';

import 'package:app_q_n_a/styles/colors.dart';
import 'package:app_q_n_a/styles/init_style.dart';
import 'package:flutter/material.dart';
import 'package:app_q_n_a/item/input_text.dart';
import 'package:app_q_n_a/item/button.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
int maxline=1;
double height=40;

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
      backgroundColor: ColorApp.whiteF7,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorApp.whiteF0,
        title: Text(
          'Trả lời',
          style: StyleApp.textStyle500(fontSize: 18, color: ColorApp.black),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            setState((){
              maxline=1;
              height=40;
            });
          },
          icon: Icon(
            Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
            color: ColorApp.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: ColorApp.orangeF01, width: 1),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: InputText(
                  counter: true,
                  height: height,
                    hasPass: false,
deadline: (){ setState(() {height=110;maxline=4;});},
                    hint: 'Nhập câu trả lời của bạn',
                    controller: answer,
                    maxline: maxline,
                inputType: TextInputType.multiline,),
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
                  ? Expanded(
                      child: GridView.builder(
                          itemCount: _imageFileList!.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3),
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return Image.file(
                              File(_imageFileList![index].path),
                            );
                          }),
                    )
                  :const SizedBox(),
              Button1(
                  ontap: () {},
                  colorButton: ColorApp.orangeF0,
                  textColor: ColorApp.orangeF01,
                  radius: 10,
                  border: Border.all(color: ColorApp.orangeF01),
                  textButton: 'Đăng câu trả lời'),
            ],
          ),
        ),
      ),
    );
  }
}
