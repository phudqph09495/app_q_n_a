import 'package:app_q_n_a/models/model_local.dart';
import 'package:image_picker/image_picker.dart';

abstract class EventBloc {}

class GetData extends EventBloc {}

class getDataOrder extends EventBloc {
  String order_key;
  int page;
  int limit;
  bool cleanList;
  bool loadMore;

  getDataOrder(
      {this.limit = 12,
      this.page = 1,
      this.cleanList = false,
      this.loadMore = false,
      required this.order_key});
}

class getBanner extends EventBloc {
  String position;
  String featured;

  getBanner({
    this.position = "1",
    this.featured = "",
  });
}

class UpdateProfile extends EventBloc {
  String name;
  String email;
  String gender;
  String? birthday;

  UpdateProfile({
    required this.name,
    required this.email,
    required this.gender,
    this.birthday,
  });
}

class AddDataRegistrantion extends EventBloc {
  String phone;
  String register_by;
  String username;
  String password;
  String email;

  AddDataRegistrantion({
    required this.username,
    required this.email,
    required this.phone,
    required this.password,
    required this.register_by,
  });
}

class loginApp extends EventBloc {
  String email;
  String password;

  loginApp({
    required this.email,
    required this.password,
  });
}

class addQuesForm extends EventBloc{
  int user_id;
  String question;
  int cat_id;
  DateTime deadline;
  int money;
  int class_id;
  List<XFile>? images;
  addQuesForm({
    required this.user_id,
    required this.cat_id,
    required this.class_id,
    required this.deadline,
    required this.money,
    required this.question,
    this.images,

});

}

class ChagePassApp extends EventBloc {
  String email_or_phone;
  String password;

  ChagePassApp({
    required this.email_or_phone,
    required this.password,
  });
}

class ChagePassIsLogin extends EventBloc {
  String password;
  String password_new;

  ChagePassIsLogin({
    required this.password_new,
    required this.password,
  });
}
