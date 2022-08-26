import 'dart:async';

import 'package:app_q_n_a/bloc/state_bloc.dart';
import 'package:app_q_n_a/config/path/api_path.dart';
import 'package:app_q_n_a/models/model_user.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_q_n_a/config/api.dart';
import '../../event_bloc.dart';

class BlocSpSignup extends Bloc<EventBloc, StateBloc> {
  BlocSpSignup() : super(StateBloc());

  @override
  Stream<StateBloc> mapEventToState(EventBloc event) async* {
    if (event is AddDataRegistrantion) {
      yield Loading();
      try {
        Map<String, dynamic> req = Map();


        req['cmt']=event.cccd;
        req['province_id']=event.province_id;
        req['district_id']=event.district_id;
        req['work']=event.work;
        req['bank_name']=event.bankName;
        req['bank_code']=event.bankNumber;
        req['bank_username']=event.userNameBank;
        print(req);

        var res = await Api.postAsync(endPoint: ApiPath.signupTL, req: req);
        print(res);


        if (res['code'] == 1) {
          yield LoadSuccess(
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
