import 'dart:io';

import 'package:app_q_n_a/styles/init_style.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../item/dropdown_button.dart';
import 'package:google_fonts/google_fonts.dart';
import '../item/input_text.dart';
import '../item/button.dart';

bool check = false;

class AddQuestion extends StatefulWidget {
  @override
  State<AddQuestion> createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
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
    'Tin học','GDCD','Công nghệ','Âm nhạc','Mỹ thuật'
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
    setState((){});
    print(_imageFileList!.length.toString());
  }

  Future selectImageCamera()async{
    final image=await _picker.pickImage(source: ImageSource.camera);
    if (image==null) return;
    _imageFileList?.add(image);
    setState((){});
  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.orangeF8,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorApp.orangeF2,
        title: Text('Đăng câu hỏi',style: StyleApp.textStyle500(fontSize: 18),),
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
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Môn học',
                  style: StyleApp.textStyle700(fontSize: 16),
                ),
                Dropdown1(val: mon, monList: monList),
                Text(
                  'Lớp',
                  style: StyleApp.textStyle700(fontSize: 16),
                ),
                Dropdown1(val: lop, monList: lopList),

                Text(
                  'Deadline',
                  style: StyleApp.textStyle700(fontSize: 16),
                ),
                InputText(
                    hasPass: false,
                    hint: 'Ngày kết thúc câu hỏi',
                    controller: deadline,
                    readOnly: true,
                    deadline: () {
                      showTimePicker(
                              context: context, initialTime: TimeOfDay.now())
                          .then((val) {
                        if (val != null) {
                          showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1970),
                                  lastDate: DateTime(2100))
                              .then((value) {
                            if (value != null) {
                              deadline.text =
                                  "${val.hour}:${val.minute} ngày ${value.day}/${value.month}/${value.year}";
                            }
                          });
                        }
                      });
                    }),
                Text(
                  'Phần thưởng',
                  style: StyleApp.textStyle700(fontSize: 16),
                ),
                InputText(
                  inputType: TextInputType.number,
                  hasPass: false,
                  hint: 'Phần thưởng cho người trả lời',
                  controller: money,

                ),
                Text(
                  'Câu hỏi',
                  style: StyleApp.textStyle700(fontSize: 16),
                ),
                InputText(
                    hasPass: false,
                    hint: 'Nhập câu hỏi của bạn',
                    controller: ques,

                    maxline: null),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {selectImageCamera();},
                        icon: Icon(
                          Icons.camera_alt,
                          size: 30,
                        )),
                    IconButton(
                        onPressed: () {selectImageGallery();},
                        icon: Icon(
                          Icons.image,
                          size: 30,
                        )),
                  ],
                ),

                _imageFileList!.isNotEmpty
                    ? GridView.builder(itemCount: _imageFileList!.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Image.file(
                            File(_imageFileList![index].path),

                          );
                        })
                    : SizedBox(),
SizedBox(height: 30,),




                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Button1(ontap: (){

                    },
                        colorButton: ColorApp.orangeF2,
                        textColor: ColorApp.black,
                        textButton: 'Đăng câu hỏi',
                        width: 200,radius: 10,border: Border.all(color: Colors.black)),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
