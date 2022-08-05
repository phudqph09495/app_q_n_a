import 'package:app_q_n_a/bloc/event_bloc.dart';
import 'package:app_q_n_a/bloc/state_bloc.dart';
import 'package:app_q_n_a/config/api.dart';
import 'package:app_q_n_a/config/path/api_path.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocReadNotifi extends Bloc<EventBloc, StateBloc> {
  BlocReadNotifi() : super(StateBloc());

  @override
  Stream<StateBloc> mapEventToState(EventBloc event) async* {
    if (event is GetData) {
      yield Loading();
      try {
        Map<String, dynamic> req = {};
        req["id"] = event.id;
        var res = await Api.postAsync(endPoint: ApiPath.readNotifi, req: req);
        if (res['code'] == 1) {
          yield LoadSuccess();
        } else {
          yield LoadFail(error: res['error']);
        }
      } on DioError catch (e) {
        yield LoadFail(error: e.error ?? "Lỗi kết nối");
      } catch (e) {
        yield LoadFail(error: e.toString());
      }
    }
  }
}
