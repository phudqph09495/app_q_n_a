import 'package:app_q_n_a/provider/image_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../../styles/init_style.dart';

class BottomSheetAvatar extends StatefulWidget {
  @override
  State<BottomSheetAvatar> createState() => _BottomSheetAvatarState();
}

class _BottomSheetAvatarState extends State<BottomSheetAvatar> {
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
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListTile(
            title: Text(
              "Thay đổi ảnh đại diện",
              textAlign: TextAlign.center,
              style: StyleApp.textStyle500(color: ColorApp.black),
            ),
          ),
          ListTile(
            onTap: () async {
              final XFile? image =
                  await _picker.pickImage(source: ImageSource.gallery);
              if (image != null) {
                cropImage(image, context);
              }
              //Navigator.pop(context);
            },
            title: Text(
              "Chọn ảnh có sẳn",
              textAlign: TextAlign.center,
              style: StyleApp.textStyle700(color: ColorApp.black, fontSize: 16),
            ),
          ),
          ListTile(
            title: TextButton(
              onPressed: () {
                selectImageCamera();
              },
              child: const Text(
                "Chụp ảnh mới",
                style: TextStyle(
                    color: ColorApp.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              height: 5,
              color: ColorApp.black00),
          ListTile(
            onTap: () {
              Navigator.pop(context);
            },
            title: Text(
              "Hủy",
              textAlign: TextAlign.center,
              style: StyleApp.textStyle700(color: ColorApp.black, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  cropImage(XFile image, BuildContext context) async {
    if (image != null) {
      final croppedFile = await ImageCropper().cropImage(
          sourcePath: image.path,
          compressFormat: ImageCompressFormat.png,
          compressQuality: 100,
          maxHeight: 100,
          maxWidth: 100,
          uiSettings: [
            AndroidUiSettings(
              toolbarTitle: 'Vui lòng chọn ảnh đại diện',
              toolbarColor: Colors.white,
              toolbarWidgetColor: Colors.black,
              initAspectRatio: CropAspectRatioPreset.ratio3x2,
              lockAspectRatio: false,
            ),
            IOSUiSettings(
              title: 'Vui lòng chọn ảnh đại diện',
              cancelButtonTitle: "Đóng",
              doneButtonTitle: "Đồng ý",
            ),
          ]);
      if (croppedFile != null) {
        context.read<ImageAppProvider>().setImage(path: croppedFile.path);
      }
    }
    Navigator.pop(context);
  }
}
