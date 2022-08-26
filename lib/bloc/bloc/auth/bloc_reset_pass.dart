import 'package:app_q_n_a/bloc/event_bloc.dart';
import 'package:app_q_n_a/bloc/state_bloc.dart';
import 'package:app_q_n_a/config/api.dart';
import 'package:app_q_n_a/config/path/api_path.dart';
import 'package:app_q_n_a/config/path/share_pref_path.dart';
import 'package:app_q_n_a/config/share_pref.dart';
import 'package:app_q_n_a/models/model_answer.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_q_n_a/models/model_question.dart';

class BlocReSet extends Bloc<EventBloc, StateBloc> {
  BlocReSet() : super(StateBloc());

  @override
  Stream<StateBloc> mapEventToState(EventBloc event) async* {

    if(event is ResetP){
      yield Loading();
      try {
        Map<String, dynamic> req = Map();

        req['email']=event.email;
        print(req);
        var res = await Api.postAsync(endPoint: ApiPath.reset, req: req);
print(res);
        if (res['code'] == 1) {
          yield LoadSuccess(
            mess: res['message'],
                data: '',
          );
        } else {
          yield LoadFail(error: res['error'] ?? "Lỗi kết nối");

        }
      } on DioError catch (e) {
        yield LoadFail(error: e.error.error);
      } catch (e) {
        yield LoadFail(error: e.toString());
      }
    }

  }
}