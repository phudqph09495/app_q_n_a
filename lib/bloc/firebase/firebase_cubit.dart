// import 'package:ban_dong_hanh/src/presentation/cubits/bloc_status.dart';
// import 'package:ban_dong_hanh/src/presentation/cubits/cubit_state.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// import '../../../../main.dart';
//
// class FirebaseCubit extends Cubit<CubitState> {
//   FirebaseCubit() : super(CubitState());
//
//   String verificationId = "";
//
//
//   sendCode({
//     required String phone,
//     required BuildContext context,
//   }) async {
//     await FirebaseAuth.instance.verifyPhoneNumber(
//       phoneNumber: "+84${phone.substring(1, phone.length)}",
//       //phoneNumber: "+84339604406",
//       timeout: const Duration(seconds: 60),
//       verificationCompleted: (credential) async {},
//       verificationFailed: (authException) {
//         emit(
//           state.copyWith(
//             status: BlocStatus.loadfail,
//             msg:
//                 "Chúng tôi đã chặn tất cả các yêu cầu từ số điện thoại $phone này do hoạt động bất thường. Thử lại sau.",
//           ),
//         );
//       },
//       codeSent: (String verifi, int? resenToken) {
//         verificationId = verifi;
//       },
//       codeAutoRetrievalTimeout: (String verifiId) {
//         verificationId = verifiId;
//       },
//     );
//   }
//
//   checkCode({
//     required String code,
//     required BuildContext context,
//   }) async {
//     try {
//       emit(state.copyWith(
//         status: BlocStatus.loading,
//       ));
//       await FirebaseAuth.instance
//           .signInWithCredential(
//         PhoneAuthProvider.credential(
//           verificationId: verificationId,
//           smsCode: code,
//         ),
//       )
//           .then(
//         (val) {
//           print(val);
//           if (val.user != null) {
//             emit(
//               state.copyWith(
//                 status: BlocStatus.sucsess,
//                 msg: "Xác thực thành công",
//               ),
//             );
//           } else {
//             emit(
//               state.copyWith(
//                 status: BlocStatus.loadfail,
//                 msg: "Xác thực thất bại",
//               ),
//             );
//           }
//         },
//       );
//     } catch (e) {
//       emit(
//         state.copyWith(
//           status: BlocStatus.loadfail,
//           msg: "Xác thực thất bại",
//         ),
//       );
//     }
//   }
//
//   intiNotifi() async {
//     AndroidInitializationSettings initializationSettingsAndroid =
//     const AndroidInitializationSettings('@mipmap/ic_launcher');
//
//     const DarwinInitializationSettings initializationSettingsDarwin =
//     DarwinInitializationSettings(
//       requestAlertPermission: true,
//       requestBadgePermission: true,
//       requestSoundPermission: true,
//     );
//     final InitializationSettings initializationSettings = InitializationSettings(
//       android: initializationSettingsAndroid,
//       iOS: initializationSettingsDarwin,
//     );
//     await flutterLocalNotificationsPlugin.initialize(initializationSettings);
//     FirebaseMessaging.instance.requestPermission(
//       alert: true,
//       announcement: false,
//       badge: true,
//       carPlay: false,
//       criticalAlert: false,
//       provisional: false,
//       sound: true,
//     );
//     FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
//   }
//
// }
