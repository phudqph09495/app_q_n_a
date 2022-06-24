import 'package:app_q_n_a/Screens/Screens_Pays/qr_view.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import '../../styles/colors.dart';
import '../../styles/styles.dart';

class QrScans extends StatefulWidget {
  @override
  _QrScansState createState() => _QrScansState();
}

class _QrScansState extends State<QrScans> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorApp.whiteF0,
        title: Text(
          'Thanh toán',
          style: StyleApp.textStyle700(color: ColorApp.black),
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
      body: const QRViewExample(),
    );
  }
}
