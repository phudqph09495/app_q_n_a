
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
  static String sex = "sex";
  static String address = "address";
  static String birthday = "birthday";


  static seveUserKey(ModelUser model) async {
    SharedPrefs.saveBool(SharePrefsKeys.login, true);
    SharedPrefs.saveString(SharePrefsKeys.user_id, model.id);
    SharedPrefs.saveString(SharePrefsKeys.user_token, model.tokenApp);
    SharedPrefs.saveString(SharePrefsKeys.name, model.username);
    SharedPrefs.saveString(SharePrefsKeys.address, model.address);
    SharedPrefs.saveString(SharePrefsKeys.sex, model.sex);
    SharedPrefs.saveString(SharePrefsKeys.birthday, model.birthday);
    SharedPrefs.saveString(SharePrefsKeys.phone, model.phone);
    SharedPrefs.saveString(SharePrefsKeys.email, model.email);
    SharedPrefs.saveString(SharePrefsKeys.avatar, model.avatarPath.toString() + model.avatarName.toString());
    SharedPrefs.saveString(SharePrefsKeys.user, model.toJson());
  }
  static removeAllKey() async {
    SharedPrefs.remove(SharePrefsKeys.login);
    SharedPrefs.remove(SharePrefsKeys.user_id);
    SharedPrefs.remove(SharePrefsKeys.name);
    SharedPrefs.remove(SharePrefsKeys.phone);
    SharedPrefs.remove(SharePrefsKeys.email);
    SharedPrefs.remove(SharePrefsKeys.avatar);
    SharedPrefs.remove(SharePrefsKeys.sex);
    SharedPrefs.remove(SharePrefsKeys.birthday);
    SharedPrefs.remove(SharePrefsKeys.address);
  }
}
