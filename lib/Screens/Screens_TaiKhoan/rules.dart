import 'dart:io';

import 'package:app_q_n_a/styles/colors.dart';
import 'package:flutter/material.dart';

import '../../styles/styles.dart';

class Rules extends StatelessWidget {
  const Rules({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.whiteF0,
      appBar: AppBar(
        backgroundColor: ColorApp.whiteF0,
        centerTitle: true,
        title: Text(
          'Nội quy',
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
                  'Nội Quy Hỏi Đáp 247',
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
                              "1. Luôn giải thích đầy đủ các bước giải, chỉ có đáp án là không đủ.",
                              style: TextStyle(
                                  color: ColorApp.black,
                                  fontSize: 15), // default is .clip
                              maxLines: 3,
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
                              "2. Không spam, trả lời linh tinh để tăng điểm, vi phạm sẽ bị khoá tài khoản.",
                              style: TextStyle(
                                  color: ColorApp.black,
                                  fontSize: 15), // default is .clip
                              maxLines: 3,
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
                              "3. Không sao chép mạng vì người hỏi cần câu trả lời của riêng bạn.",
                              style: TextStyle(
                                  color: ColorApp.black,
                                  fontSize: 15), // default is .clip
                              maxLines: 3,
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
                              "4. Không tạo nhiều tài khoản để tăng điểm gian lận, vi phạm sẽ bị khóa tài khoản từ 7 ngày đến vĩnh viễn.",
                              style: TextStyle(
                                  color: ColorApp.black,
                                  fontSize: 15), // default is .clip
                              maxLines: 3,
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
                              "5. Không chia sẻ thông tin cá nhân tránh bị làm phiền hoặc làm phiền người khác.",
                              style: TextStyle(
                                  color: ColorApp.black,
                                  fontSize: 15), // default is .clip
                              maxLines: 3,
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
                              "6. Hãy sử dụng tiếng Việt có dấu để mọi thứ được suôn sẻ và mọi người hiểu nhau hơn.",
                              style: TextStyle(
                                  color: ColorApp.black,
                                  fontSize: 15), // default is .clip
                              maxLines: 3,
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
                              "7. Không đặt tên tài khoản, avatar gây hiểu nhầm là thành viên ban quản trị Hoidap247 hoặc có chứa từ ngữ nhạy cảm.",
                              style: TextStyle(
                                  color: ColorApp.black,
                                  fontSize: 15), // default is .clip
                              maxLines: 3,
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
                              "8. Không đăng tải nội dung nhạy cảm, thiếu chính xác, gây mâu thuẫn và hiềm khích, vi phạm sẽ bị khoá tài khoản từ 7 ngày đến vĩnh viễn.",
                              style: TextStyle(
                                  color: ColorApp.black,
                                  fontSize: 15), // default is .clip
                              maxLines: 3,
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
                              "9. Tôn trọng thành viên khác, không sử dụng từ ngữ thô tục, phản cảm, xúc phạm thành viên, luôn tuân thủ quy định luật pháp Việt Nam trên môi trường mạng.",
                              style: TextStyle(
                                  color: ColorApp.black,
                                  fontSize: 15), // default is .clip
                              maxLines: 4,
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
