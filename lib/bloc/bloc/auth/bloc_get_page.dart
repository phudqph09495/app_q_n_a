import 'package:app_q_n_a/bloc/event_bloc.dart';
import 'package:app_q_n_a/bloc/state_bloc.dart';
import 'package:app_q_n_a/config/api.dart';
import 'package:app_q_n_a/config/path/api_path.dart';
import 'package:app_q_n_a/models/model_page.dart';
import 'package:app_q_n_a/models/model_user.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocGetPage extends Bloc<EventBloc, StateBloc> {
  BlocGetPage() : super(StateBloc());

  @override
  Stream<StateBloc> mapEventToState(EventBloc event) async* {
    if (event is GetData) {
      yield Loading();
      List<ModelPage> list = [];
      try {
        var res = await Api.postAsync(endPoint: ApiPath.page, req: {});
        if (res['code'] == 1) {
          for(var item in res['data']){
            ModelPage model = ModelPage.fromJson(item);
            list.add(model);
          }
          yield LoadSuccess(
            data: list,
          );
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
