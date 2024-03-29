import 'package:app_q_n_a/bloc/event_bloc.dart';
import 'package:app_q_n_a/bloc/state_bloc.dart';
import 'package:app_q_n_a/config/api.dart';
import 'package:app_q_n_a/config/path/api_path.dart';
import 'package:app_q_n_a/models/model_user.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocLogin extends Bloc<EventBloc, StateBloc> {
  BlocLogin() : super(StateBloc());

  @override
  Stream<StateBloc> mapEventToState(EventBloc event) async* {
    if (event is loginApp) {
      yield Loading();
      try {
        Map<String, dynamic> req = Map();
        req['email'] = event.email;
        req['password'] = event.password;
        Map<String, dynamic> req1 = Map();
        req1['LoginForm'] = req;
        var res = await Api.postAsync(endPoint: ApiPath.login, req: req1);
        if (res['code'] == 1) {
          ModelUser model = ModelUser.fromJson(res['data']);
          yield LoadSuccess(
            data: model,
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
