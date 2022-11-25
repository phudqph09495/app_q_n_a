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

class BlocAddMoney extends Bloc<EventBloc, StateBloc> {
  BlocAddMoney() : super(StateBloc());

  @override
  Stream<StateBloc> mapEventToState(EventBloc event) async* {
    if (event is GetData) {
      yield Loading();
      try {
        Map<String, dynamic> req = {};
        req['money'] = event.money;
        req['image'] = await MultipartFile.fromFile(event.image!.path,
            filename: event.image!.path.split('/').last);
        var res = await Api.postAsync(endPoint: ApiPath.addMoney, req: req);


        if (res['code'] == 1) {
          yield LoadSuccess(
            data: "Tạo phiếu nạp sao thành công",
          );
        } else {
          yield LoadFail(
              error: res['error'] ?? "Tạo phiếu nạp Sao không thành công");
        }
      } on DioError catch (e) {
        yield LoadFail(error: e.error.error ?? "Lỗi kết nối");
      } catch (e) {
        yield LoadFail(error: e.toString());
      }
    }
  }
}
