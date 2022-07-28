import 'package:app_q_n_a/bloc/event_bloc.dart';
import 'package:app_q_n_a/bloc/state_bloc.dart';
import 'package:app_q_n_a/config/path/api_path.dart';
import 'package:app_q_n_a/models/model_taonganhang.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import '../../../config/api.dart';

class BlocNganHang extends Bloc<EventBloc, StateBloc> {
  BlocNganHang() : super(StateBloc());
  @override
  Stream<StateBloc> mapEventToState(EventBloc event) async* {
    if (event is getTaoNganHang) {
      yield Loading();
      try {
        Map<String, dynamic> req = Map();
        req['user_id'] = event.user_id;
        req['name'] = event.name;
        req['bank_name'] = event.bank_name;
        req['number'] = event.number;
        var res =
            await Api.postAsync(endPoint: ApiPath.getNganHang, req: req);
        print(res);
        if (res['code'] == 1) {
          ModelNganHang modelNganHang = ModelNganHang.fromJson(res['data']);
          yield LoadSuccess(
            data: modelNganHang,
          );
        }
      } on DioError catch (e) {
        yield LoadFail(error: e.error ?? "Lỗi kết nối");
      } catch (e) {
        yield LoadFail(error: e.toString());
      }
    }
  }
}
