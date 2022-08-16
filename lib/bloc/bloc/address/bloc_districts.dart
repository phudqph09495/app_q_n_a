import 'package:app_q_n_a/config/path/share_pref_path.dart';
import 'package:app_q_n_a/models/model_local.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../config/path/api_path.dart';
import '../../event_bloc.dart';
import '../../state_bloc.dart';
import '../../../config/api.dart';

class BlocDistricts extends Bloc<EventBloc, StateBloc> {
  BlocDistricts() : super(StateBloc());
  @override
  Stream<StateBloc> mapEventToState(EventBloc event) async* {
    if (event is GetData) {
      List<ModelLocal> list = [];
      yield Loading();
      try {

        var res = await Api.postAsync(
          endPoint: ApiPath.getDistricts,
          req: {
            "province_id":event.id,
          },
        );
        if (res['code'] == 1) {
          res['data'].forEach((k,v){
            ModelLocal model = ModelLocal(
              id: k.toString(),
              name: v.toString(),
            );
            list.add(model);
          });
          yield LoadSuccess(
            data: list,
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
