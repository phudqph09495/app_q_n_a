import 'dart:io';

import 'package:flutter/material.dart';
import 'package:app_q_n_a/item/input_text.dart';
import 'package:app_q_n_a/item/button.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

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
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.orangeAccent.shade100,
        title: Text('Trả lời'),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new_rounded)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            InputText(
                hasPass: false,
                hint: 'Nhập câu trả lời của bạn',
                controller: answer,
                maxline: null),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      selectImageCamera();
                    },
                    icon: Icon(
                      Icons.camera_alt,
                      size: 30,
                    )),
                IconButton(
                    onPressed: () {
                      selectImageGallery();
                    },
                    icon: Icon(
                      Icons.image,
                      size: 30,
                    )),
              ],
            ),
            _imageFileList!.isNotEmpty
                ? Expanded(
                    child: GridView.builder(
                        itemCount: _imageFileList!.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return Image.file(
                            File(_imageFileList![index].path),
                            height: 10,
                            width: 10,
                          );
                        }),
                  )
                : Text(''),
            Button1(
                colorButton: Colors.orangeAccent,
                textColor: Colors.white,
                textButton: 'Đăng câu trả lời')
          ],
        ),
      ),
    );
  }
}
