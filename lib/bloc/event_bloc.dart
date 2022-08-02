import 'package:app_q_n_a/models/model_local.dart';
import 'package:image_picker/image_picker.dart';

abstract class EventBloc {}

class GetData extends EventBloc {
  int? cat_id;
  int? class_id;
  int? subject_id;
  String? keySearch;
  String? keyword;
  GetData({
    this.keyword,
    this.cat_id,
    this.class_id,
    this.subject_id,
    this.keySearch,
  });
}

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
  String? user_id;
  String? birthday;
  String? phone;
  String? email;
  String? sex;
  String? avatar;
  String? cmt;
  String? province_id;
  String? district_id;

  UpdateProfile(
      {this.user_id,
      this.birthday,
      this.phone,
      this.email,
      this.sex,
      this.avatar,
      this.cmt,
      this.province_id,
      this.district_id});
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
  int? subject_id;
  DateTime deadline;
  String money;
  int? class_id;

  String description;
  List<XFile>? images;
  addQuesForm({

    required this.description,
    required this.user_id,
    this.subject_id,
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
  int? parent_id;
  addAnsForm({
    required this.user_id,
    required this.question_id,
    required this.answer,
    this.images,
    this.parent_id
  });
}

class getAns extends EventBloc {

  int question_id;
  getAns({

    required this.question_id,
  });
}

class goodAns extends EventBloc {
  int user_id;
  int answer_id;
  goodAns({
    required this.user_id,
    required this.answer_id,
  });
}

class reportANS extends EventBloc {
  int user_id;
  int id;
  String content;
  reportANS({required this.user_id, required this.id, required this.content});
}

class getHistory extends EventBloc {
  int? user_id;
  int? limit;
  int? page;
  int? is_week;
  int? is_day;
  int? is_month;
  int? is_last_month;
  DateTime? start_time;
  DateTime? end_time;

  getHistory(
      {this.user_id,
      this.limit,
      this.page,
      this.is_week,
      this.is_day,
      this.is_month,
      this.is_last_month,
      this.start_time,
      this.end_time});
}

class getViTien extends EventBloc {
  int user_id;
  int cat_id;
  getViTien({
    required this.user_id,
    required this.cat_id,
  });
}

class getTaoNganHang extends EventBloc {
  int? user_id;
  String? name;
  String? bank_name;
  int? created_at;
  int? updated_at;
  int? number;

  getTaoNganHang(
      {this.user_id,
      this.number,
      this.name,
      this.bank_name,
      this.created_at,
      this.updated_at});
}
