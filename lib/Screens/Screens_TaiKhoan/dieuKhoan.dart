import 'dart:io';

import 'package:app_q_n_a/styles/colors.dart';
import 'package:flutter/material.dart';

import '../../styles/styles.dart';

class DieuKhoan extends StatelessWidget {
  const DieuKhoan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.whiteF0,
      appBar: AppBar(
        backgroundColor: ColorApp.whiteF0,
        centerTitle: true,
        title: Text(
          'Điều khoản',
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
      body: SingleChildScrollView(
        child: Card(
          color: Colors.white,
          child: Container(
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Điều khoản sử dụng',
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
                                "1: Tại Hoidap, chúng tôi có một số những điều khoản sử dụng dành cho người dùng. Trước khi bắt đầu, bạn nên dành một chút thời gian tìm hiểu để có những trải nghiệm tốt nhất.",
                                style: TextStyle(
                                    color: ColorApp.black,
                                    fontSize: 15), // default is .clip
                                maxLines: 4,
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
                                "2: Toàn bộ các thành viên của Hoidap đều phải tuân thủ những điều khoản này. Bằng việc chọn “Tôi đồng ý với các Điều khoản sử dụng và Chính sách cá nhân của Hoidap” khi đăng ký Tài khoản, bạn đồng ý rằng bạn đã đọc, hiểu và đồng ý với những điều khoản được nêu tại đây.",
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
                                "3. Hoidap được xây dựng để phục vụ cho mục đích giáo dục và học tập của học sinh phổ thông từ lớp 1 cho đến lớp 12. Tuy nhiên, việc sử dụng Hoidap của đối tượng trẻ em dưới 12 tuổi phải có sự đồng ý và giám sát của cha mẹ, gia đình hoặc người giám hộ. ",
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
                                "4. Tôi cho phép Hoidap.com và đơn vị chủ quản Công ty cổ phần công nghệ giáo dục Thành Phát sử dụng thông tin đăng ký để gọi điện, gửi tin nhắn, gửi email bất cứ thời điểm nào để tư vấn khóa học hoặc các thông tin khác.",
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
                                "5. Việc sử dụng các dịch vụ, tính năng và công cụ mà Hoidap cung cấp không đồng nghĩa với việc Hoidap chia sẻ cho bạn bản quyền, quyền tác giả, quyền sở hữu trí tuệ đối với Hoidap và các dịch vụ, tính năng và công cụ được cung cấp.",
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
                                "6. Hoidap hoạt động với mô hình cộng đồng. Hoidap hoàn toàn không thu bất cứ khoản phí nào từ việc sử dụng các dịch vụ, tính năng, tiện ích cơ bản mà Hoidap cung cấp.",
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
                                "7. Không đặt tên tài khoản, avatar gây hiểu nhầm là thành viên ban quản trị Hoidap hoặc có chứa từ ngữ nhạy cảm.",
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
                                "8. Hoidap được quyền thu thập toàn bộ các thông tin mà người dùng cung cấp để sử dụng cho những mục đích cụ thể. Hoidap có quyền nhưng không có nghĩa vụ phải giám sát, theo dõi và lưu trữ các nội dung, hoạt động của người dùng để bảo vệ sự an toàn của bạn và sự an toàn của những người khác. Bằng việc đăng ký tài khoản tại Hoidap, bạn đồng ý với việc giám sát, theo dõi và lưu trữ nội dung này của chúng tôi.",
                                style: TextStyle(
                                    color: ColorApp.black,
                                    fontSize: 15), // default is .clip
                                maxLines: 10,
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
                                "9. Người dùng sẽ không thể chỉnh sửa nội dung câu hỏi của mình khi đã có ít nhất một câu trả lời, cũng như không thể chỉnh sửa nội dung câu trả lời của mình khi câu trả lời được chọn là hay nhất hoặc câu trả lời đã được xác thực bởi Hoidap. Trong lúc đang được kiểm duyệt bởi Hoidap, người dùng cũng sẽ không thể chỉnh sửa các nội dung bao gồm câu hỏi, câu trả lời và bình luận của mình.",
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
      ),
    );
  }
}
