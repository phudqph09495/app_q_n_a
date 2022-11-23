import 'package:app_q_n_a/bloc/event_bloc.dart';
import 'package:app_q_n_a/bloc/state_bloc.dart';
import 'package:app_q_n_a/config/api.dart';
import 'package:app_q_n_a/config/path/api_path.dart';
import 'package:app_q_n_a/config/path/share_pref_path.dart';
import 'package:app_q_n_a/config/share_pref.dart';
import 'package:app_q_n_a/models/model_local.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocGetSub extends Bloc<EventBloc, StateBloc> {
  BlocGetSub() : super(StateBloc());

  @override
  Stream<StateBloc> mapEventToState(EventBloc event) async* {
    if (event is GetData) {
      List<ModelLocal> list = [];
      List<ModelLocal> listSub = [];
      yield Loading();
      try {
        String notifiSub =
            await SharedPrefs.readString(SharePrefsKeys.notifiSub) ?? "";
        List<String> listNotifiSub = notifiSub.split(" ");
        var res = await Api.postAsync(endPoint: ApiPath.getSub, req: {});
        if (res['code'] == 1) {
          for (var item in res['data']) {
            ModelLocal model = ModelLocal(id: item["id"], name: item['name']);
            list.add(model);
            if (listNotifiSub.contains(item["id"].toString())) {
              listSub.add(model);
            }
          }
          yield LoadSuccess(
            data: list,
            dataSub: listSub,
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
