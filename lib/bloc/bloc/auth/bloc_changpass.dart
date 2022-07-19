import 'package:app_q_n_a/bloc/event_bloc.dart';
import 'package:app_q_n_a/bloc/state_bloc.dart';
import 'package:app_q_n_a/config/api.dart';
import 'package:app_q_n_a/config/path/api_path.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_q_n_a/config/share_pref.dart';
import 'package:dio/dio.dart';

import '../../../config/path/share_pref_path.dart';

class BlocChangPass extends Bloc<EventBloc, StateBloc> {
  BlocChangPass() : super(StateBloc());
  @override
  Stream<StateBloc> mapEventToState(EventBloc event) async* {
    if (event is ChagePassApp) {
      yield Loading();
      try {
        Map<String, dynamic> req = Map();
        req['email_or_phone'] = event.email_or_phone;
        req['password'] = event.password;
        var res = await Api.postAsync(endPoint: ApiPath.changePass, req: req);
        if (res['result']) {
          yield LoadSuccess(
            data: res,
          );
        } else {
          yield LoadFail(error: res['message']);
        }
      } on DioError catch (e) {
        yield LoadFail(
            error: e.error.error ??
                "Hệ thống phát sinh lỗi. Vui lòng liên hệ với Admin.");
      } on Exception catch (_) {
        yield LoadFail(
            error: "Hệ thống phát sinh lỗi. Vui lòng liên hệ với Admin.");
      }
    }
    if (event is ChagePassIsLogin) {
      yield Loading();
      try {
        Map<String, dynamic> req = Map();
        req['new_password'] = event.password_new;
        req['old_password'] = event.password;
        final token = await SharedPrefs.readString(SharePrefsKeys.user_token);
        var res = await Api.postAsync(
            endPoint: ApiPath.changePassIsLogin, req: req, isToken: token);
        if (res['result']) {
          yield LoadSuccess(
            data: res,
          );
        } else {
          yield LoadFail(error: res['message']);
        }
      } on DioError catch (e) {
        yield LoadFail(
            error: e.error.error ??
                "Hệ thống phát sinh lỗi. Vui lòng liên hệ với Admin.");
      } on Exception catch (_) {
        yield LoadFail(
            error: "Hệ thống phát sinh lỗi. Vui lòng liên hệ với Admin.");
      }
    }
  }
}
