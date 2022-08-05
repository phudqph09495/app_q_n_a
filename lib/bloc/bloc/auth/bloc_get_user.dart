import 'package:app_q_n_a/config/path/share_pref_path.dart';
import 'package:app_q_n_a/models/model_user.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../config/path/api_path.dart';
import '../../../config/share_pref.dart';
import '../../event_bloc.dart';
import '../../state_bloc.dart';
import '../../../config/api.dart';

class BlocGetUser extends Bloc<EventBloc, StateBloc> {
  BlocGetUser() : super(StateBloc());
  @override
  Stream<StateBloc> mapEventToState(EventBloc event) async* {
    if (event is GetData) {
      yield Loading();
      try {
        var res = await Api.postAsync(
          endPoint: ApiPath.getUser,
          req: {},
        );
        if (res['code'] == 1) {
          ModelUser user = ModelUser.fromJson(res['data']);
          yield LoadSuccess(
            data: user,
          );
        } else {
          yield LoadFail(
              error: res['error'] ??
                  "Lỗi. Vui lòng liên hệ với Admin để được hỗ trợ.");
        }
      } on DioError catch (e) {
        yield LoadFail(
            error: e.error.error ??
                "Lỗi. Vui lòng liên hệ với Admin để được hỗ trợ.");
      } catch (e) {
        yield LoadFail(
            error: e.toString());
      }
    }
  }
}
