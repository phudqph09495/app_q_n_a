import 'package:app_q_n_a/bloc/event_bloc.dart';
import 'package:app_q_n_a/bloc/state_bloc.dart';
import 'package:app_q_n_a/config/api.dart';
import 'package:app_q_n_a/config/path/api_path.dart';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

late String loi;

class BlocReportQuestion extends Bloc<EventBloc, StateBloc> {
  BlocReportQuestion() : super(StateBloc());

  @override
  Stream<StateBloc> mapEventToState(EventBloc event) async* {
    if (event is reportANS) {
      yield Loading();
      try {
        Map<String, dynamic> req = Map();
        req['id'] = event.id;
        req['content'] = event.content;

        var res = await Api.postAsync(endPoint: ApiPath.reportQuestion, req: req);
        print(res);

        if (res['code'] == 1) {
          yield LoadSuccess();
        } else {
          if (res['message'] != '') {
            loi = res['message'];
          } else if (res['error'] != '') {
            loi = res['error'];
          } else
            loi = "Lỗi kết nối";
          yield LoadFail(error: loi);
        }
      } on DioError catch (e) {

        yield LoadFail(error: e.error.error);
      } catch (e) {
        print(e);
        yield LoadFail(error: e.toString());
      }
    }
  }
}
