import 'package:app_q_n_a/item/itemnotifi/itemNotifi2.dart';
import 'package:flutter/material.dart';

import '../../Screens/comment.dart';

class ThongBao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      children: List.generate(
        1,
        (index) => Column(
          children: [
            Notification2(
              avatar:
                  'https://scontent.xx.fbcdn.net/v/t1.15752-9/283941161_537305418091091_8650752695389883231_n.png?stp=dst-png_p206x206&_nc_cat=104&ccb=1-7&_nc_sid=aee45a&_nc_ohc=A8FMj9-28L8AX_TrNC4&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_AVKbARhrv6fl3_PJDyG9zVvC6oeFQUHS5RvvD5AkOrvk9w&oe=62E38D66',
              sub:
                  'Đã trả lời câu hỏi : " Đếm số đỉnh,số cạnh của khối bát diện"...... Mà bạn đang theo dõi ',
              onTap: () {
                // Navigator.of(context, rootNavigator: true).push(
                //   MaterialPageRoute(
                //     builder: (_) => AnswerScreen(),
                //   ),
                // );
              },
              title: "Tran thanh",
              time: "3 phút trước",
            ),
            Notification2(
              avatar:
                  'https://scontent.xx.fbcdn.net/v/t1.15752-9/289100526_1087040555230418_9115132632334291519_n.png?stp=dst-png_p206x206&_nc_cat=110&ccb=1-7&_nc_sid=aee45a&_nc_ohc=Svma-tNysPgAX-T2iyG&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_AVKYKoKEGXQohNis5Kf174sNhdTlq7_W2Wp-vBHGzESfZg&oe=62E4243F',
              sub:
                  'Đã vote 5 sao cho câu trả lời của bạn , trong bài :"Đếm số đỉnh,số cạnh của khối bát diện"',
              onTap: () {
                // Navigator.of(context, rootNavigator: true).push(
                //   MaterialPageRoute(
                //     builder: (_) => AnswerScreen(),
                //   ),
                // );
              },
              title: "Nguyen van nam",
              time: "4 phút trước",
            ),
            Notification2(
              avatar:
                  'https://scontent.xx.fbcdn.net/v/t1.15752-9/283941161_537305418091091_8650752695389883231_n.png?stp=dst-png_p206x206&_nc_cat=104&ccb=1-7&_nc_sid=aee45a&_nc_ohc=A8FMj9-28L8AX_TrNC4&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_AVKbARhrv6fl3_PJDyG9zVvC6oeFQUHS5RvvD5AkOrvk9w&oe=62E38D66',
              sub:
                  'Đã nhắc đến bạn trong bình luận của câu hỏi :Đếm số đỉnh,số cạnh của khối bát diện"...... ',
              onTap: () {
                // Navigator.of(context, rootNavigator: true).push(
                //   MaterialPageRoute(
                //     builder: (_) => CommentScreen(),
                //   ),
                // );
              },
              title: "Tran thanh",
              time: "5 phút trước",
            ),
            Notification2(
              avatar:
                  'https://scontent.xx.fbcdn.net/v/t1.15752-9/287597439_1021284538591165_6492048507439901569_n.png?stp=dst-png_s206x206&_nc_cat=107&ccb=1-7&_nc_sid=aee45a&_nc_ohc=rumpVxqjoFQAX-YGZqf&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_AVLpZj8Kj3FYbWb6llDzuBxp6VnJe13fth93YHUjXUtJsg&oe=62E26C5C',
              sub:
                  'Bạn đã nhận được 50.000 đ vào ví , sau khi trả lời đúng nhất trong câu hỏi : "Đếm số đỉnh,số cạnh của khối bát diện".....  ',
              onTap: () {
                // Navigator.of(context, rootNavigator: true).push(
                //   MaterialPageRoute(
                //     builder: (_) => ViTien(),
                //   ),
                // );
              },
              title: "Admin",
              time: "10 phút trước",
            ),
            Notification2(
              avatar:
                  'https://scontent.xx.fbcdn.net/v/t1.15752-9/289572347_1491667817914152_7850947533575165862_n.png?stp=dst-png_p206x206&_nc_cat=111&ccb=1-7&_nc_sid=aee45a&_nc_ohc=iXQOCRD_bJ0AX-vU6fi&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_AVLe237ObAwC8vTCk9bfWVAS3uoSAAhKGMBZWnxAvbH_GQ&oe=62E19671',
              sub:
                  'Câu trả lời của bạn cho câu hỏi: "Đếm số đỉnh,số cạnh của khối bát diện"... đã bị xóa vì lý do sao chép từ nguồn khác trên mạng.  ',
              onTap: () {
                // Navigator.of(context, rootNavigator: true).push(
                //   MaterialPageRoute(
                //     builder: (_) => AnswerScreen(),
                //   ),
                // );
              },
              title: "Admin",
              time: "15 phút trước",
            ),
          ],
        ),
      ),
    );
  }
}
