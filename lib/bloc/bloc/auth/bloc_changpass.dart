import 'dart:convert';

import 'package:app_q_n_a/bloc/event_bloc.dart';
import 'package:app_q_n_a/bloc/state_bloc.dart';
import 'package:app_q_n_a/config/api.dart';
import 'package:app_q_n_a/config/path/api_path.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import '../../../config/path/share_pref_path.dart';
import '../../../config/share_pref.dart';
import '../../../models/model_user.dart';

class BlocChangPass extends Bloc<EventBloc, StateBloc> {
  BlocChangPass() : super(StateBloc());
  @override
  Stream<StateBloc> mapEventToState(EventBloc event) async* {
    if (event is ChagePassIsLogin) {
      yield Loading();
      try {
        Map<String, dynamic> req = Map();
        req['password'] = event.password;
        req['passwordre'] = event.passwordre;

        var res =
            await Api.postAsync(endPoint: ApiPath.changePassIsLogin, req: req);

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
