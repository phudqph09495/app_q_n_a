import 'package:app_q_n_a/models/model_local.dart';


abstract class EventBloc {}

class getData extends EventBloc {}

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







