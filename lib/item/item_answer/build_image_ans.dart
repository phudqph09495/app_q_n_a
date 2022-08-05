import 'package:flutter/material.dart';

import '../../config/const.dart';
import '../../config/next_page.dart';
import '../../styles/init_style.dart';
import '../../widget/items/show_image.dart';
import '../gridView/grid_view_custom.dart';
import '../load_image.dart';

class BuildImageAns extends StatelessWidget {
  List<String> listImages;
  double maxWight;
  double mainAxisExtent;
  BuildImageAns({required this.listImages, this.mainAxisExtent = 150, this.maxWight = 150});

  @override
  Widget build(BuildContext context) {
    return GridViewCustom(
      itemCount:  listImages.length > 4 ? 4 : listImages.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.only(top: 10),
      maxWight: maxWight,
      showFull: true,
      crossAxisSpacing: 10,
      mainAxisExtent: mainAxisExtent,
      itemBuilder: (_, index) {
        return InkWell(
          onTap: () {
            PageNavigator.next(
                context: context,
                page: ShowImage(
                  listImage: listImages,
                ));
          },
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LoadImage(
                  ans: false,
                  url: listImages[index],
                  fit: BoxFit.cover,
                ),
              ),
              (listImages.length - 4) > 0 && index == 3
                  ? Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: Text(
                  "+ ${listImages.length - 4}",
                  style: StyleApp.textStyle500(
                      fontSize: 16, color: Colors.black),
                ),
              )
                  : const SizedBox(),
            ],
          ),
        );
      },
    );
  }
}
