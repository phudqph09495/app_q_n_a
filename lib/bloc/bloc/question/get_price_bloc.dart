import 'package:app_q_n_a/bloc/event_bloc.dart';
import 'package:app_q_n_a/bloc/state_bloc.dart';
import 'package:app_q_n_a/config/api.dart';
import 'package:app_q_n_a/config/path/api_path.dart';
import 'package:app_q_n_a/models/model_local.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocGetPrice extends Bloc<EventBloc, StateBloc> {
  BlocGetPrice() : super(StateBloc());

  @override
  Stream<StateBloc> mapEventToState(EventBloc event) async* {
    if (event is GetData) {
      List<ModelLocal2> list = [];
      yield Loading();
      try {
        var res = await Api.postAsync(endPoint: ApiPath.getPrice, req: {});
print(res);
        if (res['code'] == 1) {
          for (var item in res['data']) {
            ModelLocal2 model = ModelLocal2(id: item["id"], name: item["name"]);
            list.add(model);
          }
          yield LoadSuccess(data: list);
        }
      } on DioError catch (e) {

        yield LoadFail(error: e.error.error ?? "Lỗi kết nối");
      } catch (e) {
        print(e);
        yield LoadFail(error: e.toString());
      }
    }
  }
}