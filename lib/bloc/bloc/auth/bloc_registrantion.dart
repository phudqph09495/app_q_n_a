import 'dart:async';

import 'package:app_q_n_a/bloc/state_bloc.dart';
import 'package:app_q_n_a/config/api_path.dart';
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
        req['email']=event.email;
        req['username']=event.username;
        req['phone'] = event.phone;
        req['register_by'] = event.register_by;
        req['password'] = event.password;

        var res =
        await Api.postAsync(endPoint: ApiPath.signup, req: req);
        if(res['code'] == 1){
          yield LoadSuccess(
            data: res['data'],
          );
        }else{
          yield LoadFail(error: res['error'] ?? "Lỗi kết nối");
        }
      }
      on DioError catch (e) {
        yield LoadFail(error: e.error);
      }
      catch (e) {
        yield LoadFail(error: e.toString());
      }
    }
  }
}
