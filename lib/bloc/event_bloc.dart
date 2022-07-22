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
  String address;
  String sex;
  String? birthday;

  UpdateProfile({
    required this.address,
    required this.sex,
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

class addQuesForm extends EventBloc {
  int user_id;
  String question;
  int? cat_id;
  DateTime deadline;
  String money;
  int? class_id;
  List<XFile>? images;
  addQuesForm({
    required this.user_id,
    this.cat_id,
    this.class_id,
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
  int user_id;
  String password;
  String passwordre;

  ChagePassIsLogin({
    required this.user_id,
    required this.passwordre,
    required this.password,
  });
}

class addAnsForm extends EventBloc {
  int user_id;
  int question_id;
  String answer;
  List<XFile>? images;
  addAnsForm({
    required this.user_id,
    required this.question_id,
    required this.answer,
    this.images,
  });
}

class getAns extends EventBloc {
  int user_id;
  int question_id;
  getAns({
    required this.user_id,
    required this.question_id,
  });
}

class getHistory extends EventBloc {
  int user_id;
  String limit;
  String page;
  String is_week;
  String is_day;
  String is_month;
  String is_last_month;
  String start_time;
  String end_time;

  getHistory(
      {required this.user_id,
      required this.limit,
      required this.page,
      required this.is_week,
      required this.is_day,
      required this.is_month,
      required this.is_last_month,
      required this.start_time,
      required this.end_time});
}

class getViTien extends EventBloc {
  int user_id;
  int cat_id;
  getViTien({
    required this.user_id,
    required this.cat_id,
  });
}
