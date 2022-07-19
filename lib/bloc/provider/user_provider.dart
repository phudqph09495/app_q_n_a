import 'package:flutter/cupertino.dart';

import '../../config/path/share_pref_path.dart';
import '../../config/share_pref.dart';

class UserProvider with ChangeNotifier{
  String? name;
  String? email;
  String? phone;
  String? avatar;

  String? get getname => name;
  String? get getemail => email;
  String? get getphone => phone;
  String? get getavatar => avatar;

  getDataProvider() async {
    name = await SharedPrefs.readString(SharePrefsKeys.name);
    avatar = await SharedPrefs.readString(SharePrefsKeys.avatar);
    email = await SharedPrefs.readString(SharePrefsKeys.email);
    phone = await SharedPrefs.readString(SharePrefsKeys.phone);
    notifyListeners();
  }
}