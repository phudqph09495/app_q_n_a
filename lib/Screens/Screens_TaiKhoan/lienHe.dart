import 'dart:io';

import 'package:app_q_n_a/styles/colors.dart';
import 'package:flutter/material.dart';

import '../../styles/styles.dart';

class LienHe extends StatelessWidget {
  const LienHe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.whiteF0,
      appBar: AppBar(
        backgroundColor: ColorApp.whiteF0,
        centerTitle: true,
        title: Text(
          'Liên hệ và góp ý',
          style: StyleApp.textStyle700(color: ColorApp.black, fontSize: 18),
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
      body: Card(
        color: Colors.white,
        child: Container(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Góp ý 247',
                  style: TextStyle(
                      color: ColorApp.orangeF01,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                const SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Expanded(
                            child: Text(
                              "1. Trong quá trình tham gia vào cộng đồng giải đáp bài tập Hoidap247, bạn thấy những điểm nào chưa hài lòng hoặc muốn cải tiến, thay đổi điểm nào cho hoàn thiện hơn hãy để lại vài lời góp ý kèm hình ảnh ở đây nhé. Với mỗi ý kiến đóng góp được Hoidap247 áp dụng, bạn sẽ nhận được một phần quà bí mật được gửi miễn phí đến tận bàn học, cảm ơn bạn nhiều nha!",
                              style: TextStyle(
                                  color: ColorApp.black,
                                  fontSize: 15), // default is .clip
                              maxLines: 6,
                            ), // default is 1
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Expanded(
                            child: Text(
                              "2. Facebook Platform, Facebook Page, Facebook Messenger thuộc bản quyền của Facebook. Hoidap247 không có liên hệ nào khác ngoài việc là một đơn vị sử dụng các dịch vụ mà nền tảng này cung cấp.",
                              style: TextStyle(
                                  color: ColorApp.black,
                                  fontSize: 15), // default is .clip
                              maxLines: 6,
                            ), // default is 1
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Expanded(
                            child: Text(
                              "3. Vui lòng liên hệ theo số hotline 18006947 để được hướng dẫn nếu bạn muốn xóa tài khoản cũng như các thông tin cá nhân khác.",
                              style: TextStyle(
                                  color: ColorApp.black,
                                  fontSize: 15), // default is .clip
                              maxLines: 5,
                            ), // default is 1
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Expanded(
                            child: Text(
                              "4. Trong trường hợp có bất cứ vấn đề gì phát sinh trong quá trình sử dụng (ngoại trừ các vấn đề liên quan câu hỏi, câu trả lời, bình luận và thời gian phản hồi), vui lòng liên hệ với Hoidap247 thông qua email: hotro.hoidap247@gmail.com hoặc Tổng đài: 024.7300.7989",
                              style: TextStyle(
                                  color: ColorApp.black,
                                  fontSize: 15), // default is .clip
                              maxLines: 10,
                            ), // default is 1
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
