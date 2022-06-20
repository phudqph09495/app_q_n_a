import 'package:app_q_n_a/styles/init_style.dart';
import 'package:flutter/material.dart';

class UserManual extends StatelessWidget {
  const UserManual({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.orangeF0,
      appBar: AppBar(
        backgroundColor: ColorApp.orangeF0,
        centerTitle: false,
        title: Text(
          "Hướng dẫn sử dụng",
          style: StyleApp.textStyle700(fontSize: 18, color: ColorApp.orangeF01),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: ColorApp.orangeF01,
          ),
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'HƯỚNG DẪN THAM GIA CỘNG ĐỒNG HỎI ĐÁP 247',
                style: TextStyle(color: ColorApp.orangeF01),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: ColorApp.blue6D,
                      shape: BoxShape.circle,
                    ),
                    width: 40,
                    height: 40,
                    child: const Center(
                      child: Text(
                        '1',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:const [
                      Text('HƯỚNG DẪN TĂNG ĐIỂM'),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
