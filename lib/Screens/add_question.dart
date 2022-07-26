import 'dart:async';
import 'dart:io';

import 'package:app_q_n_a/bloc/bloc/auth/bloc_add_question.dart';
import 'package:app_q_n_a/bloc/check_log_state.dart';
import 'package:app_q_n_a/bloc/state_bloc.dart';
import 'package:app_q_n_a/config/const.dart';
import 'package:app_q_n_a/config/path/share_pref_path.dart';
import 'package:app_q_n_a/config/share_pref.dart';
import 'package:app_q_n_a/item/dropdown/Dropdown1.dart';
import 'package:app_q_n_a/item/gridView/grid_view_custom.dart';
import 'package:app_q_n_a/item/input/text_filed.dart';
import 'package:app_q_n_a/item/input/text_filed2.dart';
import 'package:app_q_n_a/models/model_local.dart';
import 'package:app_q_n_a/styles/init_style.dart';
import 'package:app_q_n_a/validator.dart';
import 'package:app_q_n_a/widget/items/custom_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:image_picker/image_picker.dart';
import '../bloc/event_bloc.dart';
import '../item/dropdown_button.dart';
import 'package:google_fonts/google_fonts.dart';
import '../item/input_text.dart';
import '../item/button.dart';
import 'package:toast/toast.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
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
                          _chosenDateTime = val;
                        }),
                  ),
                  CupertinoButton(
                      child: Text('OK'),
                      onPressed: () {
                        deadline.text =
                            '${_getNumberAddZero(_chosenDateTime!.hour)}:${_getNumberAddZero(_chosenDateTime!.minute)}\'  ${_getNumberAddZero(_chosenDateTime!.day)}/${_getNumberAddZero(_chosenDateTime!.month)}/${_chosenDateTime?.year}';
                        Navigator.of(ctx).pop();
                      })
                ],
              ),
            ));
  }

  TextEditingController money = TextEditingController();

  TextEditingController ques = TextEditingController();
  TextEditingController deadline = TextEditingController();
  TextEditingController description=TextEditingController();
  DateTime dateTime = DateTime.now();

  final keyForm = GlobalKey<FormState>();

  Map req = new Map();
  String? lop;
  String? mon;
String? cat;
  AddQuesVoid() async {

    if (keyForm.currentState!.validate()) {
      var user_id = await (SharedPrefs.readString(SharePrefsKeys.user_id));

      bloc.add(addQuesForm(
          user_id: user_id ?? -1,
          subject_id: int.parse(req['mon']),
          class_id: int.parse(req['lop']),
          deadline: dateTime,
          money: money.text,
          description: description.text,
          question: ques.text,
          images: imageFiles,
          cat_id: int.parse(req['cat'])));
    }
  }

  // String mon = 'Toán học';
  // List<String> monList = [
  //   'Toán học',
  //   'Vật lý',
  //   'Hoá học',
  //   'Ngữ Văn',
  //   'Sinh học',
  //   'Sử học',
  //   'Địa lý',
  //   'Tiếng Anh',
  //   'Tin học',
  //   'GDCD',
  //   'Công nghệ',
  //   'Âm nhạc',
  //   'Mỹ thuật'
  // ];
  // String lop = 'Lớp 1';
  // List<String> lopList = [
  //   'Lớp 1',
  //   'Lớp 2',
  //   'Lớp 3',
  //   'Lớp 4',
  //   'Lớp 5',
  //   'Lớp 6',
  //   'Lớp 7',
  //   'Lớp 8',
  //   'Lớp 9',
  //   'Lớp 10',
  //   'Lớp 11',
  //   'Lớp 12',
  // ];

  // final ImagePicker _picker = ImagePicker();
  // List<XFile>? _imageFileList = [];
  //
  //
  //
  // Future selectImageGallery() async {
  //   final List<XFile>? selectedImage = await _picker.pickMultiImage();
  //   if (selectedImage!.isNotEmpty) {
  //     _imageFileList!.addAll(selectedImage);
  //   }
  //   setState(() {});
  //   print(_imageFileList!.length.toString());
  // }
  //
  // Future selectImageCamera() async {
  //   final image = await _picker.pickImage(source: ImageSource.camera);
  //   if (image == null) return;
  //   _imageFileList?.add(image);
  //
  // }

  List<XFile> imageFiles = [];
  StreamController imagesController = StreamController.broadcast();
  final ImagePicker _picker = ImagePicker();
  Stream get imageStream => imagesController.stream;

  selectImageGallery() {
    _picker.pickImage(source: ImageSource.gallery).then((value) {
      if (value != null) {
        imageFiles.add(value);
        imagesController.sink.add(imageFiles);
      }
    });
  }

  selectImageCamera() {
    _picker.pickImage(source: ImageSource.camera).then((value) {
      if (value != null) {
        imageFiles.add(value);
        imagesController.sink.add(imageFiles);
      }
    });
  }

  BlocQuestion bloc = BlocQuestion();

  showDatetime() {
    DatePicker.showDateTimePicker(
      context,
      showTitleActions: true,
      minTime: DateTime.now(),
      maxTime: DateTime(
          DateTime.now().year + 2, DateTime.now().month, DateTime.now().day),
      theme: DatePickerTheme(
        itemStyle: StyleApp.textStyle500(fontSize: 16),
        doneStyle: StyleApp.textStyle700(fontSize: 18),
      ),
      onConfirm: (date) {
        if (date.millisecondsSinceEpoch >
            (DateTime.now().millisecondsSinceEpoch + (60000 * 10))) {
          dateTime = date;

          deadline.text = Const.formatTime(date.millisecondsSinceEpoch,
              format: "HH:mm  dd/MM/yyyy");
        } else {
          CustomToast.showToast(
              context: context,
              msg: "Deadline phải lớn hơn thời gian tạo câu hỏi 10 phút");
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
        child: BlocListener(
          bloc: bloc,
          listener: (_, StateBloc state) {
            CheckLogState.check(context,
                state: state, msg: "Thêm câu hỏi thành công", success: () {
             money.clear();
             ques.clear();
             deadline.clear();
             description.clear();
            });
          },
          child: Button1(
              colorButton: ColorApp.orangeF2,
              textColor: ColorApp.whiteF0,
              radius: 30,
              style: false,
              fontSize: 18,
              border: Border.all(color: ColorApp.orangeF2, width: 0.5),
              textButton: 'Đăng câu hỏi',
              ontap: AddQuesVoid),
        ),
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
        // reverse: true,
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
                  'Loại câu hỏi',
                  style: StyleApp.textStyle700(fontSize: 16),
                ),
                DropDown2(
                  listItem: [
                    ModelLocal(id: "7", name: "Ngẫu hứng"),
                    ModelLocal(id: "8", name: "Chiến lược"),

                  ],
                  hint: 'Chọn thể loại',
                  onChanged: (val) {
                    req['cat'] = val.id;
                  },
                  value: cat,
                  validator: (val) {
                    return ValidatorApp.checkNull(text: val, isTextFiled: true);
                  },
                ),
                Text(
                  'Môn học',
                  style: StyleApp.textStyle700(fontSize: 16),
                ),
                DropDown2(
                  listItem: [
                    ModelLocal(id: "16", name: "Toán học"),
                    ModelLocal(id: "19", name: "Vật lý"),
                    ModelLocal(id: "20", name: "Hoá học"),
                    ModelLocal(id: "17", name: "Văn học"),
                    ModelLocal(id: "21", name: "Sinh học"),
                    ModelLocal(id: "15", name: "Lịch sử"),
                    ModelLocal(id: "22", name: "Địa lý"),
                    ModelLocal(id: "18", name: "Tiếng Anh"),
                    ModelLocal(id: "23", name: "Tin học"),
                    ModelLocal(id: "24",name: "GDCD"),
                    ModelLocal(id: "25",name: "Công nghệ"),
                    ModelLocal(id: "26",name: "Âm nhạc"),
                    ModelLocal(id: "27",name: "Mỹ thuật"),
                  ],
                  hint: 'Chọn môn học',
                  onChanged: (val) {
                    req['mon'] = val.id;
                  },
                  value: mon,
                  validator: (val) {
                    return ValidatorApp.checkNull(text: val, isTextFiled: true);
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Lớp',
                  style: StyleApp.textStyle700(fontSize: 16),
                ),
                DropDown2(
                  listItem: [
                    ModelLocal(id: "3", name: "Lớp 1"),
                    ModelLocal(id: "4", name: "Lớp 2"),
                    ModelLocal(id: "5", name: "Lớp 3"),
                    ModelLocal(id: "6", name: "Lớp 4"),
                    ModelLocal(id: "7", name: "Lớp 5"),
                    ModelLocal(id: "8", name: "Lớp 6"),
                    ModelLocal(id: "9", name: "Lớp 7"),
                    ModelLocal(id: "10", name: "Lớp 8"),
                    ModelLocal(id: "11", name: "Lớp 9"),
                    ModelLocal(id: "12", name: "Lớp 10"),
                    ModelLocal(id: "13", name: "Lớp 11"),
                    ModelLocal(id: "14", name: "Lớp 12"),
                  ],
                  hint: 'Chọn lớp học',
                  onChanged: (val) {
                    req['lop'] = val.id;
                  },
                  value: lop,
                  validator: (val) {
                    return ValidatorApp.checkNull(text: val, isTextFiled: true);
                  },
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
                  'Tiêu đề câu hỏi',
                  style: StyleApp.textStyle700(fontSize: 16),
                ),
                InputText2(
                  hint: 'Tiêu đề câu hỏi',
                  controller: ques,
                  validator: (val) {
                    return ValidatorApp.checkNull(text: val, isTextFiled: true);
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Nội dung câu hỏi',
                  style: StyleApp.textStyle700(fontSize: 16),
                ),
                InputText2(
                  counter: true,
                  hint: 'Nhập câu hỏi của bạn',
                  keyboardType: TextInputType.multiline,
                  maxline: 6,
                  controller: description,
                  validator: (val) {
                    return ValidatorApp.checkNull(text: val, isTextFiled: true);
                  },
                ),

                StreamBuilder(
                  stream: imageStream,
                  initialData: imageFiles,
                  builder: (context, snapshot) {
                    return buildImage();
                  },
                ),
                SizedBox(
                  height: 70,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildImage() {
    return GridViewCustom(
        itemCount: imageFiles.length + 1,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        showFull: true,
        maxWight: 100,
        mainAxisExtent: 100,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        itemBuilder: (_, index) {
          return index == 0
              ? InkWell(
                  onTap: () {
                    showPlatformDialog(
                        context: context,
                        builder: (context) => BasicDialogAlert(
                              title: Text("Thêm hình ảnh"),
                              content: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [

                                    IconButton(
                                        onPressed: () {
                                          selectImageGallery();
                                          Navigator.pop(context);
                                        },
                                        icon: Icon(
                                          Icons.image,
                                          size: 50,
                                        )),
                                    IconButton(
                                        onPressed: () {
                                          selectImageCamera();
                                          Navigator.pop(context);
                                        },
                                        icon: Icon(
                                          Icons.camera_alt,
                                          size: 50,
                                        ))

                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                BasicDialogAction(
                                  title: Text(
                                    "Trở lại",
                                    style: StyleApp.textStyle500(
                                        color: Colors.red),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ));
                  },
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: ColorApp.grey82,
                        width: 1,
                      ),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.add,
                        size: 32,
                        color: ColorApp.grey82,
                      ),
                    ),
                  ),
                )
              : SizedBox(
                  width: double.infinity,
                  height: 100,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: SizedBox(
                          width: double.infinity,
                          height: 100,
                          child: Image.file(
                            File(imageFiles[index - 1].path),
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 100,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 3,
                        right: 3,
                        child: InkWell(
                          onTap: () {
                            imageFiles.removeAt(index - 1);
                            imagesController.sink.add(imageFiles);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade400,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.close,
                              size: 10,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
        });
  }
}
