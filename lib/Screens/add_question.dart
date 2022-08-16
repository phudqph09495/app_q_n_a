import 'dart:async';
import 'dart:io';

import 'package:app_q_n_a/Screens/home.dart';
import 'package:app_q_n_a/Screens/screen_home.dart';
import 'package:app_q_n_a/bloc/bloc/auth/bloc_add_question.dart';
import 'package:app_q_n_a/bloc/bloc/question/get_class_bloc.dart';
import 'package:app_q_n_a/bloc/bloc/question/get_price_bloc.dart';
import 'package:app_q_n_a/bloc/bloc/question/get_sub_bloc.dart';
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
import 'package:app_q_n_a/widget/items/dia_log_item.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
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
  TextEditingController description = TextEditingController();
  DateTime dateTime = DateTime.now();

  final keyForm = GlobalKey<FormState>();
  BlocGetClass blocGetClass = BlocGetClass()..add(GetData());
  BlocGetSub blocGetSub = BlocGetSub()..add(GetData());
BlocGetPrice blocGetPrice=BlocGetPrice()..add(GetData());
  int? lopval;
  int? monval;
  String? lop;
  String? mon;

  AddQuesVoid() async {
    if (keyForm.currentState!.validate() &&
        ((description.text != '') || imageFiles.isNotEmpty)) {
      var user_id = await (SharedPrefs.readString(SharePrefsKeys.user_id));

      bloc.add(addQuesForm(
        user_id: user_id ?? -1,
        subject_id: monval,
        class_id: lopval,
        deadline: dateTime,
        money:(double.parse(money.text).round()*1000).toString(),
        description: description.text,
        question: ques.text,
        images: imageFiles,
      ));
    } else {
      DialogItem.showMsg(
          context: context, title: "Lỗi", msg: "Bạn chưa nhập đủ thông tin");
    }
  }

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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: BlocListener(
          bloc: bloc,
          listener: (_, StateBloc state) {
            CheckLogState.check(context,
                state: state,
                msg: "Thêm câu hỏi thành công",
                isShowDlg: true, ontap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ScreenHome()));
            });
          },
          child: Button1(
              colorButton: ColorApp.orangeF2,
              textColor: ColorApp.whiteF0,
              radius: 30,
              style: false,
              fontSize: 18,
              height: 40,
              border: Border.all(color: ColorApp.orangeF2, width: 0.5),
              textButton: 'Đăng câu hỏi',
              ontap: AddQuesVoid),
        ),
      ),
      backgroundColor: ColorApp.whiteF7,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorApp.whiteF0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          'Đăng câu hỏi',
          style: StyleApp.textStyle700(fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: keyForm,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 5,
              ),
              Text(
                'Môn học',
                style: StyleApp.textStyle700(fontSize: 16),
              ),
              BlocBuilder(
                bloc: blocGetSub,
                builder: (context, state) {
                  final list = state is LoadSuccess
                      ? state.data as List<ModelLocal>
                      : <ModelLocal>[];
                  return DropDown2(
                    listItem: list,
                    hint: 'Chọn môn học',
                    onChanged: (val) {
                      monval = int.parse(val.id);
                    },
                    value: mon,
                    validator: (val) {
                      return ValidatorApp.checkNull(
                          text: val, isTextFiled: true);
                    },
                  );
                },
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Lớp',
                style: StyleApp.textStyle700(fontSize: 16),
              ),
              BlocBuilder(
                bloc: blocGetClass,
                builder: (context, state) {
                  final list = state is LoadSuccess
                      ? state.data as List<ModelLocal>
                      : <ModelLocal>[];
                  return DropDown2(
                    listItem: list,
                    hint: 'Chọn lớp học',
                    onChanged: (val) {
                      lopval = int.parse(val.id);
                    },
                    value: lop,
                    validator: (val) {
                      return ValidatorApp.checkNull(
                          text: val, isTextFiled: true);
                    },
                  );
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
              BlocBuilder(bloc: blocGetPrice,builder: (context,state){
                print(state);
                final list=state is LoadSuccess? state.data as List<ModelLocal2>:<ModelLocal2>[];
                return GridViewCustom(
                  itemCount: list.length,
                  showFull: true,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisExtent: 45,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  maxWight: 120,
                  itemBuilder: (_, index) => OutlinedButton(
                    onPressed: () {
                      // money.text=Const.convertPrice(10000 * (index + 1));
                      money.text=list[index].name.toString();

                    },
                    style: OutlinedButton.styleFrom(
                        primary: Colors.green.shade200,
                        side: BorderSide(
                          color: Colors.green.shade200,
                        )
                    ),
                    child: Text(
                        list[index].name.toString(),
                      style: StyleApp.textStyle500(color: Colors.green),
                    ),
                  ),
                );
              }),
              const SizedBox(height: 10),
              InputText2(
                textInputFormatter: [
                  CurrencyTextInputFormatter(
                    // locale: 'ko',
                    decimalDigits: 0,
                    symbol: '',
                  ),
                ],
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
                  onTap: _show,
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

  _show() {
    showModalBottomSheet(
        context: context,
        builder: (context) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  onTap: () {
                    selectImageGallery();
                    Navigator.pop(context);
                  },
                  leading: const Icon(
                    Icons.image_outlined,
                  ),
                  title: Text(
                    "Thư viện",
                    style: StyleApp.textStyle400(),
                  ),
                ),
                ListTile(
                  onTap: () {
                    selectImageCamera();
                    Navigator.pop(context);
                  },
                  leading: const Icon(
                    Icons.camera_alt_outlined,
                  ),
                  title: Text(
                    "Máy ảnh",
                    style: StyleApp.textStyle400(),
                  ),
                ),
              ],
            ));
  }
}
