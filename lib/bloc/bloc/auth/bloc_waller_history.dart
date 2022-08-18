import 'package:app_q_n_a/bloc/event_bloc.dart';
import 'package:app_q_n_a/bloc/state_bloc.dart';
import 'package:app_q_n_a/config/api.dart';
import 'package:app_q_n_a/config/path/api_path.dart';
import 'package:app_q_n_a/models/model_wallet.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocWalletHistory extends Bloc<EventBloc, StateBloc> {
  BlocWalletHistory() : super(StateBloc());

  @override
  Stream<StateBloc> mapEventToState(EventBloc event) async* {
    if (event is getHistory) {
      yield Loading();
      try {
        Map<String, dynamic> req = Map();
        var res =
            await Api.postAsync(endPoint: ApiPath.getWalletHistory, req: req);
        if (res['code'] == 1) {
          ModelHistory datas = ModelHistory.fromJson(res['data']);
          yield LoadSuccess(
            data: datas,
          );
        }
      } on DioError catch (e) {
        yield LoadFail(error: e.error.error ?? "Lỗi kết nối");
      } catch (e) {
        yield LoadFail(error: e.toString());
      }
    }
  }
}
