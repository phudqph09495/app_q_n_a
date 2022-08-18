import 'package:app_q_n_a/config/path/share_pref_path.dart';
import 'package:app_q_n_a/models/model_user.dart';
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
        if (event.req!['avatar'] != null) {
          event.req!['avatar'] = await MultipartFile.fromFile(
              event.req!['avatar'].path,
              filename: event.req!['avatar'].path.split('/').last);
        }

        var res =
            await Api.postAsync(endPoint: ApiPath.updateUser, req: event.req!);

        if (res['code'] == 1) {
          ModelUser datas = ModelUser.fromJson(res['data']);
          yield LoadSuccess(
            data: datas,
          );
        } else {
          yield LoadFail(error: res['message'] ?? "Lỗi kết nối");
        }
      } on DioError catch (e) {
        yield LoadFail(
            error: e.error.error ??
                "Lỗi. Vui lòng liên hệ với Admin để được hỗ trợ.");
      } catch (e) {
        yield LoadFail(
            error:e.toString());
      }
    }
  }
}
