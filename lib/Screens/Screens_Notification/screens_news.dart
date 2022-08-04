import 'dart:io';

import 'package:app_q_n_a/models/model_news.dart';
import 'package:app_q_n_a/styles/colors.dart';
import 'package:app_q_n_a/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class ScreensNew extends StatelessWidget {
  ModelNews modelNews;

  ScreensNew({required this.modelNews});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorApp.whiteF0,
        centerTitle: true,
        title: Text(
          modelNews.title ?? "Tin tức",
          style: StyleApp.textStyle700(color: ColorApp.black, fontSize: 16),
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
        padding: const EdgeInsets.all(10),
        child: HtmlWidget(modelNews.description ?? "Dang cập nhật",),
      ),
    );
  }
}
