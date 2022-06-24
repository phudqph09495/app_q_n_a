// import 'dart:io';
//
// import 'package:app_q_n_a/Screens/Screens_TaiKhoan/question_Widget.dart';
// import 'package:flutter/material.dart';
//
// import '../../styles/colors.dart';
// import '../../styles/styles.dart';
//
// class QuestionSaved2 extends StatefulWidget {
//   final VoidCallback onDelete;
//   QuestionSaved2({required this.onDelete} );
//
//   @override
//   State<QuestionSaved2> createState() => _QuestionSaved2State();
// }
//
// class _QuestionSaved2State extends State<QuestionSaved2> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorApp.whiteF7,
//       appBar: AppBar(
//         backgroundColor: ColorApp.whiteF0,
//         title: Text(
//           'Câu hỏi đã lưu',
//           style: StyleApp.textStyle700(fontSize: 18, color: ColorApp.black),
//         ),
//         leading: IconButton(
//           icon: Icon(
//             Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
//             color: ColorApp.black,
//           ),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(8),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               QuestionWidget(
//                 time: '11:07 7/6/2022',
//                 title: 'Đếm số đỉnh, số cạnh của khối bát diện đều',
//                 name: 'Câu số :1',
//               ),
//               SizedBox(
//                 height: 5,
//               ),
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                     IconButton(
//                       icon: const Icon(
//                         Icons.delete,
//                         color: ColorApp.black,
//                       ),
//                       onPressed: onDelete,
//                     ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
