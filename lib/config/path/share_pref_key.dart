import '../share_pref.dart';

class SharePrefsKey {
  static String login = "login";
  static String user = "user";
  static String user_id = "user_id";
  static String user_token = "user_token";
  static String name = "name";
  static String avatar = "avatar";
  static String phone = "phone";
  static String email = "email";

  static removeAllKey() async {
    final user_id = await SharedPrefs.readString(SharePrefsKey.user_id);

    await SharedPrefs.remove(SharePrefsKey.login);
    await SharedPrefs.remove(SharePrefsKey.user);
    await SharedPrefs.remove(SharePrefsKey.user_id);
    await SharedPrefs.remove(SharePrefsKey.user_token);
    await SharedPrefs.remove(SharePrefsKey.name);
    await SharedPrefs.remove(SharePrefsKey.avatar);
    await SharedPrefs.remove(SharePrefsKey.phone);
    await SharedPrefs.remove(SharePrefsKey.email);
  }
}
