import 'package:flutter/material.dart';
import 'package:app_q_n_a/item/input_text.dart';
import 'package:app_q_n_a/item/button.dart';
class Add_Answer_Screen extends StatefulWidget {
  @override
  State<Add_Answer_Screen> createState() => _Add_Answer_ScreenState();
}

class _Add_Answer_ScreenState extends State<Add_Answer_Screen> {
  TextEditingController title=TextEditingController();
  TextEditingController answer=TextEditingController();
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
            }, icon: Icon(Icons.arrow_back_ios_new_rounded)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            InputText(hasPass: false, hint: 'Title', controller: title),
            SizedBox(height: 30,),
            InputText(
                hasPass: false,
                hint: 'Nhập câu trả lời của bạn',
                controller: answer,
                height:150,
                maxline: null
            ),
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
           Button1(colorButton: Colors.orangeAccent, textColor: Colors.white, textButton: 'Đăng câu trả lời')
          ],
        ),
      ),
    );
  }
}
