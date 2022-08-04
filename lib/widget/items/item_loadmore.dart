import 'package:flutter/material.dart';

import '../../config/path/string_path.dart';
import '../../styles/init_style.dart';

Widget ItemLoadMore({
  bool length = false,
  bool hasMore = false,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Text(
      length
          ? StringPath.loadFull
          : hasMore
              ? StringPath.loading
              : "",
      textAlign: TextAlign.center,
      style: StyleApp.textStyle400(),
    ),
  );
}
Widget ItemListEmpty() {
  return Center(
    child: Text(
      StringPath.listEmpty,
      textAlign: TextAlign.center,
      style: StyleApp.textStyle400(),
    ),
  );
}