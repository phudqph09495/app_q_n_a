import 'package:app_q_n_a/bloc/event_bloc.dart';
import 'package:app_q_n_a/bloc/state_bloc.dart';
import 'package:app_q_n_a/config/api.dart';
import 'package:app_q_n_a/config/const.dart';
import 'package:app_q_n_a/config/path/api_path.dart';
import 'package:app_q_n_a/models/model_bank.dart';
import 'package:app_q_n_a/models/model_wallet.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocBankUser extends Bloc<EventBloc, StateBloc> {
  BlocBankUser() : super(StateBloc());

  @override
  Stream<StateBloc> mapEventToState(EventBloc event) async* {
    if (event is GetData) {
      yield Loading();
      try {
        Map<String, dynamic> req = {};
        var res = await Api.postAsync(endPoint: ApiPath.getBank, req: req);

        print(res);
        if (res['code'] == 1) {
          ModelBank model = ModelBank.fromJson(res['data']);
          yield LoadSuccess(
            data: model,
          );
        } else {
          yield LoadFail(error: res['error'] ?? "Lỗi kết nối");
        }
      } on DioError catch (e) {
        yield LoadFail(error: e.error.error ?? "Lỗi kết nối");
      } catch (e) {
        yield LoadFail(error: e.toString());
      }
    }
  }
}
