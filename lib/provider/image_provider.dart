import 'package:flutter/cupertino.dart';

class ImageAppProvider extends ChangeNotifier {
  String? _image;

  String? get image => _image;

  setImage({
    String? path,
  }) {
    _image = path;
    notifyListeners();
  }
}
