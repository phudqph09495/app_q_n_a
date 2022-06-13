import 'package:flutter/material.dart';
import 'dropdown_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'input_text.dart';
import 'button.dart';

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
    'Tin học'
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.orangeAccent.shade100,
        title: Text('Đăng câu hỏi'),
        leading: IconButton(
            onPressed: () {}, icon: Icon(Icons.arrow_back_ios_new_rounded)),
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
                  style: GoogleFonts.nunito(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                ),
                Dropdown1(val: mon, monList: monList),
                Text(
                  'Lớp',
                  style: GoogleFonts.nunito(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                ),
                Dropdown1(val: lop, monList: lopList),

                Text(
                  'Deadline',
                  style: GoogleFonts.nunito(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
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
                  style: GoogleFonts.nunito(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                ),
                InputText(
                  inputType: TextInputType.number,
                  hasPass: false,
                  hint: 'Phần thưởng cho người trả lời',
                  controller: money,

                ),
                Text(
                  'Câu hỏi',
                  style: GoogleFonts.nunito(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                ),
                InputText(
                    hasPass: false,
                    hint: 'Nhập câu hỏi của bạn',
                    controller: ques,
                    height: 130,
                    maxline: 5),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.camera_alt,
                          size: 30,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.image,
                          size: 30,
                        )),
                  ],
                ),




                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Button1(
                        colorButton: Colors.orangeAccent,
                        textColor: Colors.white,
                        textButton: 'Đăng câu hỏi',
                        width: 200),
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
