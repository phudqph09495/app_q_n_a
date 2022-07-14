import 'package:app_q_n_a/bloc/event_bloc.dart';
import 'package:app_q_n_a/bloc/state_bloc.dart';
import 'package:app_q_n_a/config/api.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../config/path/api_path.dart';
import '../config/path/string_path.dart';
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
        var res = await Api.postAsync(endPoint: ApiPath.login, req: req);
        if (res['result']) {
          yield LoadSuccess(
            data: res,
          );
        } else {
          yield LoadFail(error: res['message']);
        }
      } on DioError catch (e) {
        yield LoadFail(error: e.error.error ?? StringPath.errInput);
      } on Exception catch (e) {
        yield LoadFail(error: StringPath.errInput);
      }
    }
  }
}
