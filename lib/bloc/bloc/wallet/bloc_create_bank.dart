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

class BlocCreateBank extends Bloc<EventBloc, StateBloc> {
  BlocCreateBank() : super(StateBloc());

  @override
  Stream<StateBloc> mapEventToState(EventBloc event) async* {
    if (event is GetData) {
      yield Loading();
      try {
        Map<String, dynamic> req = {};

        req['name'] = event.name;
        req['bank_name'] = event.bankName;
        req['number'] = event.number;

        var res =
            await Api.postAsync(endPoint: ApiPath.createNganHang, req: req);

        if (res['code'] == 1) {
          yield LoadSuccess(
            data: "Tạo ngân hàng thành công",
          );
        } else {
          yield LoadFail(error: res['error'] ?? "Lỗi kết nối");
        }
      } on DioError catch (e) {
        yield LoadFail(error: e.error ?? "Lỗi kết nối");
      } catch (e) {
        yield LoadFail(error: e.toString());
      }
    }
  }
}
