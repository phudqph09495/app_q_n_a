import 'package:app_q_n_a/bloc/event_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/api.dart';
import '../../../config/path/api_path.dart';
import '../../../config/path/share_pref_path.dart';
import '../../../config/share_pref.dart';
import '../../../models/model_user.dart';
import '../../state_bloc.dart';

class BlocGetProfile extends Bloc<EventBloc, StateBloc> {
  BlocGetProfile() : super(StateBloc());
  @override
  Stream<StateBloc> mapEventToState(EventBloc event) async* {
    if (event is GetData) {
      yield Loading();
      try {
        final token = await SharedPrefs.readString(SharePrefsKeys.user_token);

        Map<String, dynamic> req = Map();
        req['access_token'] = token;
        var res = await Api.postAsync(
            endPoint: ApiPath.login, req: {}, isToken: token);
        ModelUser modelUser = ModelUser.fromJson(res);
        yield LoadSuccess(
          data: modelUser,
        );
      } on DioError catch (e) {
        yield LoadFail(
            error: e.error.error ??
                "Lỗi. Vui lòng liên hệ với Admin để được hỗ trợ.");
      } on Exception catch (_) {
        yield LoadFail(
            error: "Lỗi. Vui lòng liên hệ với Admin để được hỗ trợ.");
      }
    }
  }
}
