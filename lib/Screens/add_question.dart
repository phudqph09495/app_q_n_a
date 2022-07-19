import 'dart:io';

import 'package:app_q_n_a/bloc/bloc/auth/bloc_question.dart';
import 'package:app_q_n_a/config/const.dart';
import 'package:app_q_n_a/item/input/text_filed.dart';
import 'package:app_q_n_a/item/input/text_filed2.dart';
import 'package:app_q_n_a/styles/init_style.dart';
import 'package:app_q_n_a/validator.dart';
import 'package:app_q_n_a/widget/items/custom_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:image_picker/image_picker.dart';
import '../bloc/event_bloc.dart';
import '../item/dropdown_button.dart';
import 'package:google_fonts/google_fonts.dart';
import '../item/input_text.dart';
import '../item/button.dart';
import 'package:toast/toast.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

DateTime? _chosenDateTime;

String _getNumberAddZero(int number) {
  if (number < 10) {
    return "0" + number.toString();
  }
  return number.toString();
}

class AddQuestion extends StatefulWidget {
  @override
  State<AddQuestion> createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  void _showDatePicker(ctx) {
    showCupertinoModalPopup(
        context: ctx,
        builder: (_) =>
            Container(
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
                          _chosenDateTime = val;
                        }),
                  ),
                  CupertinoButton(
                      child: Text('OK'),
                      onPressed: () {
                        deadline.text =
                        '${_getNumberAddZero(
                            _chosenDateTime!.hour)}:${_getNumberAddZero(
                            _chosenDateTime!.minute)}\'  ${_getNumberAddZero(
                            _chosenDateTime!.day)}/${_getNumberAddZero(
                            _chosenDateTime!.month)}/${_chosenDateTime?.year}';
                        Navigator.of(ctx).pop();
                      })
                ],
              ),
            ));
  }

  TextEditingController money = TextEditingController();

  TextEditingController ques = TextEditingController();
  TextEditingController deadline = TextEditingController();
  DateTime dateTime = DateTime.now();

  final keyForm = GlobalKey<FormState>();

  AddQuesVoid() async {
    if (keyForm.currentState!.validate()) {
      bloc.add(addQuesForm(
          user_id: 1,
          cat_id: 1,
          class_id: 1,
          deadline: DateTime.now(),
          money: 123,
          question: "đa",
          images: _imageFileList));
    }
  }

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

  BlocQuestion bloc = BlocQuestion();

  showDatetime() {
    DatePicker.showDateTimePicker(
      context,
      showTitleActions: true,
      minTime: DateTime.now(),
      maxTime: DateTime(
          DateTime
              .now()
              .year + 2, DateTime
          .now()
          .month, DateTime
          .now()
          .day),
      theme: DatePickerTheme(
        itemStyle: StyleApp.textStyle500(fontSize: 16),
        doneStyle: StyleApp.textStyle700(fontSize: 18),
      ),
      onConfirm: (date) {
        if (date.millisecondsSinceEpoch > (DateTime.now().millisecondsSinceEpoch +( 60000 * 30))) {
          dateTime = date;
          deadline.text = Const.formatTime(
              date.millisecondsSinceEpoch, format: "HH:mm  dd/MM/yyyy");
        } else {
          CustomToast.showToast(context: context,
              msg: "Deadline phải lớn hơn thời gian tạo câu hỏi 30 phút");
        }
      },
      currentTime: dateTime,
      locale: LocaleType.vi,
    );
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
            style: false,
            fontSize: 18,
            border: Border.all(color: ColorApp.orangeF2, width: 0.5),
            textButton: 'Đăng câu hỏi',
            ontap: () {
              AddQuesVoid();
            }),
      ),
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
            key: keyForm,
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
                  onchange: (val) {
                    setState(() {
                      mon = val;
                    });
                  },
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
                  onchange: (val) {
                    setState(() {
                      lop = val;
                    });
                  },
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
                InputText2(
                  onTap: () {
                    showDatetime();
                  },
                  readOnly: true,
                  hint: 'Ngày kết thúc câu hỏi',
                  controller: deadline,
                  validator: (val) {
                    return ValidatorApp.checkNull(text: val, isTextFiled: true);
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Phần thưởng',
                  style: StyleApp.textStyle700(fontSize: 16),
                ),
                InputText2(
                  keyboardType: TextInputType.number,
                  hint: 'Phần thưởng cho người trả lời',
                  controller: money,
                  validator: (val) {
                    return ValidatorApp.checkNull(text: val, isTextFiled: true);
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Câu hỏi',
                  style: StyleApp.textStyle700(fontSize: 16),
                ),
                InputText2(
                  counter: true,
                  hint: 'Nhập câu hỏi của bạn',
                  keyboardType: TextInputType.multiline,
                  maxline: 6,
                  controller: ques,
                  validator: (val) {
                    return ValidatorApp.checkNull(text: val, isTextFiled: true);
                  },
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
