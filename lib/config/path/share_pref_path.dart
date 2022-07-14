
import '../share_pref.dart';


class SharePrefsKey{
  static String login = "login";
  static String user = "user";
  static String user_id = "user_id";
  static String user_token = "user_token";
  static String name = "name";
  static String avatar = "avatar";
  static String phone = "phone";
  static String email = "email";
  static String location = "location";
  static String is_shop = "is_shop";

  static removeAllKey() async {
    SharedPrefs.remove(SharePrefsKey.login);
    SharedPrefs.remove(SharePrefsKey.user_id);
    SharedPrefs.remove(SharePrefsKey.user_token);
    SharedPrefs.remove(SharePrefsKey.name);
    SharedPrefs.remove(SharePrefsKey.phone);
    SharedPrefs.remove(SharePrefsKey.email);
    SharedPrefs.remove(SharePrefsKey.avatar);
  }

  static seveUserKey( model) async {
    SharedPrefs.saveBool(SharePrefsKey.login, true);
    SharedPrefs.saveString(SharePrefsKey.user_id, model.id);
    SharedPrefs.saveString(SharePrefsKey.user_token, model.tokenApp);
    SharedPrefs.saveString(SharePrefsKey.name, model.username);
    SharedPrefs.saveString(SharePrefsKey.phone, model.phone);
    SharedPrefs.saveString(SharePrefsKey.email, model.email);
    SharedPrefs.saveString(SharePrefsKey.avatar, model.avatarPath.toString() + model.avatarName.toString());
    SharedPrefs.saveBool(SharePrefsKey.is_shop, model.sShop != null ? true : false);
    SharedPrefs.saveString(SharePrefsKey.user, model.toJson());
  }
}
