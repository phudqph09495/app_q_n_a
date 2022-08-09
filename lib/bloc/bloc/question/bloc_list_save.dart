import 'package:app_q_n_a/bloc/event_bloc.dart';
import 'package:app_q_n_a/bloc/state_bloc.dart';
import 'package:app_q_n_a/config/api.dart';
import 'package:app_q_n_a/config/path/api_path.dart';
import 'package:app_q_n_a/models/model_question.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocListSave extends Bloc<EventBloc, StateBloc> {
  BlocListSave() : super(StateBloc());
  List<ModelQuestion> list = [];
  @override
  Stream<StateBloc> mapEventToState(EventBloc event) async* {
    if (event is GetData) {
      yield Loading();
      try {
        Map<String, dynamic> req = {};

        var res = await Api.postAsync(endPoint: ApiPath.listsave, req: req);
        if (res['code'] == 1) {
          for (var item in res['data']) {
            ModelQuestion model = ModelQuestion.fromJson(item);
            list.add(model);
          }
          yield LoadSuccess(
            data: list
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
