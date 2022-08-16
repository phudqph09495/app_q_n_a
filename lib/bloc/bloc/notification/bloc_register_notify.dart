import 'dart:async';

import 'package:app_q_n_a/bloc/state_bloc.dart';
import 'package:app_q_n_a/config/path/api_path.dart';
import 'package:app_q_n_a/models/model_user.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_q_n_a/config/api.dart';
import '../../event_bloc.dart';

class BlocRegisNotify extends Bloc<EventBloc, StateBloc> {
  BlocRegisNotify() : super(StateBloc());

  @override
  Stream<StateBloc> mapEventToState(EventBloc event) async* {
    if (event is RegisNotify) {
      yield Loading();
      try {
        Map<String, dynamic> req = Map();

        req['subject_id'] = event.subject_id;
        var res = await Api.postAsync(endPoint: ApiPath.regisNotify, req: req);

        if (res['code'] == 1) {
          yield LoadSuccess(data: res['message']);
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
