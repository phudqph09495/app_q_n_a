import 'dart:io';

import 'package:app_q_n_a/styles/init_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../item/dropdown_button.dart';
import 'package:google_fonts/google_fonts.dart';
import '../item/input_text.dart';
import '../item/button.dart';
import 'package:toast/toast.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

DateTime? _chosenDateTime;

double height=50;

class AddQuestion extends StatefulWidget {
  @override
  State<AddQuestion> createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  void _showDatePicker(ctx) {
    showCupertinoModalPopup(
        context: ctx,
        builder: (_) => Container(
              height: 500,
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Column(
                children: [
                  SizedBox(
                    height: 400,
                    child: CupertinoDatePicker(
                        minuteInterval: 1,
                        minimumDate: DateTime.now(),
                        use24hFormat: true,
                        initialDateTime: DateTime.now(),
                        onDateTimeChanged: (val) {
                          setState(() {
                            _chosenDateTime = val;
                            deadline.text =
                                '${_chosenDateTime?.hour}:${_chosenDateTime?.minute}\'  ${_chosenDateTime?.day}/${_chosenDateTime?.month}/${_chosenDateTime?.year}';
                          });
                        }),
                  ),
                ],
              ),
            ));
  }

  TextEditingController money = TextEditingController();

  TextEditingController ques = TextEditingController();
  TextEditingController deadline = TextEditingController();
  String mon = 'Toán học';
  List<String> monList = [
    'Toán học',
    'Vật lý',
    'Hoá học',
    'Ngữ Văn',
    'Sinh học',
    'Sử học',
    'Địa lý',
    'Tiếng Anh',
    'Tin học',
    'GDCD',
    'Công nghệ',
    'Âm nhạc',
    'Mỹ thuật'
  ];
  String lop = 'Lớp 1';
  List<String> lopList = [
    'Lớp 1',
    'Lớp 2',
    'Lớp 3',
    'Lớp 4',
    'Lớp 5',
    'Lớp 6',
    'Lớp 7',
    'Lớp 8',
    'Lớp 9',
    'Lớp 10',
    'Lớp 11',
    'Lớp 12',
  ];
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
      bottomSheet:  Button1(
          colorButton: ColorApp.orangeF0,
          textColor: ColorApp.orangeF01,
          radius: 30,
          border: Border.all(color: ColorApp.orangeF0),
          textButton: 'Đăng câu hỏi',
          ontap: () {

          }),

      backgroundColor: ColorApp.whiteF7,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorApp.whiteF0,
        title: Text(
          'Đăng câu hỏi',
          style: StyleApp.textStyle700(fontSize: 18),
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
          padding: EdgeInsets.all(8.0),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Môn học',
                  style: StyleApp.textStyle700(fontSize: 16),
                ),
                Dropdown1(

                  val: mon,
                  monList: monList,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Lớp',
                  style: StyleApp.textStyle700(fontSize: 16),
                ),
                Dropdown1(

                  val: lop,
                  monList: lopList,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Deadline',
                  style: StyleApp.textStyle700(fontSize: 16),
                ),
                InputText(


                    hint: 'Ngày kết thúc câu hỏi',
                    controller: deadline,
                    readOnly: true,
                    deadline: () {
                      _showDatePicker(context);

                      // showTimePicker(
                      //         context: context, initialTime: TimeOfDay.now())
                      //     .then((val) {
                      //   if (val != null) {
                      //     showDatePicker(
                      //             context: context,
                      //             initialDate: DateTime.now(),
                      //             firstDate: DateTime(1970),
                      //             lastDate: DateTime(2100))
                      //         .then((value) {
                      //       if (value != null) {
                      //         deadline.text =
                      //             "${val.hour}:${val.minute} ngày ${value.day}/${value.month}/${value.year}";
                      //       }
                      //     });
                      //   }
                      // });
                    }),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Phần thưởng',
                  style: StyleApp.textStyle700(fontSize: 16),
                ),
                InputText(

                  inputType: TextInputType.number,

                  hint: 'Phần thưởng cho người trả lời',
                  controller: money,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Câu hỏi',
                  style: StyleApp.textStyle700(fontSize: 16),
                ),
                InputText(
                    inputType: TextInputType.multiline,
                    maxline: 6,
counter: true,



                    hint: 'Nhập câu hỏi của bạn',
                    controller: ques,
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

                SizedBox(
                  height: 100,
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
