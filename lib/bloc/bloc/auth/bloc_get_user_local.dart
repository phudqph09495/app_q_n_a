import 'package:app_q_n_a/config/path/share_pref_path.dart';
import 'package:app_q_n_a/config/share_pref.dart';
import 'package:app_q_n_a/models/model_user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class BLocLocalUser extends Cubit<ModelUser?> {
  BLocLocalUser() : super(null);

  void getUser() async {
    var userData = await SharedPrefs.readString(SharePrefsKeys.user);
    ModelUser? user = ModelUser.fromJson(userData);
    emit(user);
  }
}
