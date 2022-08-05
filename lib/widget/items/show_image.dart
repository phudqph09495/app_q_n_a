import 'package:app_q_n_a/styles/init_style.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../item/load_image.dart';

class ShowImage extends StatefulWidget {

  List<String> listImage;
  ShowImage({required this.listImage});

  @override
  State<ShowImage> createState() => _ShowImageState();
}

class _ShowImageState extends State<ShowImage> {
  int page = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text("$page/${widget.listImage.length}", style: StyleApp.textStyle400(color: Colors.white,fontSize: 18),),
        centerTitle: true,
      ),
      body: CarouselSlider(
        items: List.generate(
            widget.listImage.length,
                (index) => LoadImage(
                  url: widget.listImage[index],
                  fit: BoxFit.contain,
                ),),
        options: CarouselOptions(
          height: double.infinity,
          aspectRatio: 16 / 9,
          viewportFraction: 1,
          initialPage: 0,
          autoPlay: false,
          onPageChanged: (val, reason) {
            setState((){
              page = val +1;
            });
          },
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
