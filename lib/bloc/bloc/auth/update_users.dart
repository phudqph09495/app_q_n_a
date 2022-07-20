import 'package:app_q_n_a/config/path/share_pref_path.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../config/path/api_path.dart';
import '../../../config/share_pref.dart';
import '../../event_bloc.dart';
import '../../state_bloc.dart';
import '../../../config/api.dart';

class BlocUpdateUser extends Bloc<EventBloc, StateBloc> {
  BlocUpdateUser() : super(StateBloc());
  @override
  Stream<StateBloc> mapEventToState(EventBloc event) async* {
    if (event is UpdateProfile) {
      yield Loading();
      try {
        final token = await SharedPrefs.readString(SharePrefsKeys.user_token);
        Map<String, dynamic> req = Map();
        //thiếu
        req['info'] = event.name;
        req['email'] = event.email;
        req['gender'] = event.gender;
        req['birthday'] = event.birthday;

        var res = await Api.postAsync(
            endPoint: ApiPath.updateUser, req: req, isToken: token);
        yield LoadSuccess(
          data: res,
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
