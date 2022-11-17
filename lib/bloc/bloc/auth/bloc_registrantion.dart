import 'dart:async';

import 'package:app_q_n_a/bloc/state_bloc.dart';
import 'package:app_q_n_a/config/path/api_path.dart';
import 'package:app_q_n_a/models/model_user.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_q_n_a/config/api.dart';
import '../../event_bloc.dart';

class BlocRegistrantion extends Bloc<EventBloc, StateBloc> {
  BlocRegistrantion() : super(StateBloc());

  @override
  Stream<StateBloc> mapEventToState(EventBloc event) async* {
    if (event is AddDataRegistrantion) {
      yield Loading();
      try {
        Map<String, dynamic> req = Map();
        //req['email'] = event.email;
        req['username'] = event.username;
        req['phone'] = event.phone;
        req['password'] = event.password;

        req['cmt']=event.cccd;
        req['province_id']=event.province_id;
        req['district_id']=event.district_id;
        req['work']=event.work;
        req['bank_name']=event.bankName;
        req['bank_code']=event.bankNumber;
        req['bank_username']=event.userNameBank;

        Map<String, dynamic> req1 = Map();
        req1['SignupForm'] = req;
        req1['supporter']=event.role;
        var res = await Api.postAsync(endPoint: ApiPath.signin, req: req1);

        if (res['code'] == 1) {
          ModelUser model = ModelUser.fromJson(res['data']);
          yield LoadSuccess(
            data: model,
          );
        } else {
          yield LoadFail(error: res['message'] ?? "Lỗi kết nối");
        }
      } on DioError catch (e) {
        yield LoadFail(error: e.error.error);
      } catch (e) {
        yield LoadFail(error: e.toString());
      }
    }
  }
}
