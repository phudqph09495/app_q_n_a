import 'dart:async';
import 'dart:io';

import 'package:app_q_n_a/Screens/screen_home.dart';
import 'package:app_q_n_a/bloc/bloc/auth/bloc_add_answer.dart';
import 'package:app_q_n_a/bloc/check_log_state.dart';
import 'package:app_q_n_a/bloc/event_bloc.dart';
import 'package:app_q_n_a/bloc/state_bloc.dart';
import 'package:app_q_n_a/item/gridView/grid_view_custom.dart';
import 'package:app_q_n_a/item/input/text_filed2.dart';
import 'package:app_q_n_a/styles/colors.dart';
import 'package:app_q_n_a/styles/init_style.dart';
import 'package:app_q_n_a/validator.dart';
import 'package:flutter/material.dart';
import 'package:app_q_n_a/item/input_text.dart';
import 'package:app_q_n_a/item/button.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toast/toast.dart';

class Add_Answer_Screen extends StatefulWidget {
  int? user_id;
  int? question_id;

  Add_Answer_Screen({this.question_id, this.user_id});

  @override
  State<Add_Answer_Screen> createState() => _Add_Answer_ScreenState();
}

class _Add_Answer_ScreenState extends State<Add_Answer_Screen> {
  TextEditingController answer = TextEditingController();

  List<XFile> imageFiles = [];
  StreamController imagesController = StreamController.broadcast();
  final ImagePicker _picker = ImagePicker();

  Stream get imageStream => imagesController.stream;
  final keyForm = GlobalKey<FormState>();
  BlocAddAnswer bloc = BlocAddAnswer();

  AddAnswerVoid() async {
    if ((answer.text != '') || imageFiles.isNotEmpty) {
      bloc.add(addAnsForm(
          user_id: widget.user_id ?? 0,
          question_id: widget.question_id ?? 0,
          answer: answer.text,
          images: imageFiles));
    }
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
        child: BlocListener(
          bloc: bloc,
          listener: (_, StateBloc state) {
            CheckLogState.check(context,
                state: state,
                msg: "Thêm câu trả lời thành công",
                isShowMsg: true, success: () {
              Navigator.pop(context);
            });
          },
          child: Button1(
            colorButton: ColorApp.orangeF2,
            textColor: ColorApp.whiteF0,
            radius: 30,
            height: 40,
            fontSize: 18,
            style: false,
            border: Border.all(color: ColorApp.orangeF2, width: 0.5),
            textButton: 'Viết câu trả lời',
            ontap: AddAnswerVoid,
          ),
        ),
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
          child: Form(
            key: keyForm,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
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
                StreamBuilder(
                  stream: imageStream,
                  initialData: imageFiles,
                  builder: (context, snapshot) {
                    return buildImage();
                  },
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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
