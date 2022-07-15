
import '../../models/model_user.dart';
import '../share_pref.dart';


class SharePrefsKeys{
  static String login = "login";
  static String user = "user";
  static String user_id = "id";
  static String user_token = "user_token";
  static String name = "username";
  static String avatar = "avatar";
  static String phone = "phone";
  static String email = "email";
  static String location = "location";
  static seveUserKey(ModelUser model) async {
    SharedPrefs.saveBool(SharePrefsKeys.login, true);
    SharedPrefs.saveString(SharePrefsKeys.user_id, model.id);
    SharedPrefs.saveString(SharePrefsKeys.user_token, model.tokenApp);
    SharedPrefs.saveString(SharePrefsKeys.name, model.username);
    SharedPrefs.saveString(SharePrefsKeys.phone, model.phone);
    SharedPrefs.saveString(SharePrefsKeys.email, model.email);
    // SharedPrefs.saveString(SharePrefsKey.avatar, model.avatarPath.toString() + model.avatarName.toString());
    SharedPrefs.saveString(SharePrefsKeys.user, model.toJson());
  }
  static removeAllKey() async {
    SharedPrefs.remove(SharePrefsKeys.login);
    SharedPrefs.remove(SharePrefsKeys.user_id);
    SharedPrefs.remove(SharePrefsKeys.user_token);
    SharedPrefs.remove(SharePrefsKeys.name);
    SharedPrefs.remove(SharePrefsKeys.phone);
    SharedPrefs.remove(SharePrefsKeys.email);
    SharedPrefs.remove(SharePrefsKeys.avatar);
  }
}
