import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../widget/DuaTopList.dart';
import '../../../widget/ThongBaoList.dart';
import '../../../widget/inFo_list.dart';
import '../../../widget/sk_list.dart';

class tabBar extends StatelessWidget {
  const tabBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      physics: const NeverScrollableScrollPhysics(),
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                inFoList(
                  ontap: () => launch('https://hoidap247.com/'),
                ),
              ],
            ),
          ),
        ),
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                skListQuestion(
                  ontap: () => launch('https://hoidap247.com/'),
                ),
              ],
            ),
          ),
        ),
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                DuaTopList(
                  ontap: () => launch('https://hoidap247.com/'),
                ),
              ],
            ),
          ),
        ),
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                ThongBaoList(
                  ontap: () => launch('https://hoidap247.com/'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
