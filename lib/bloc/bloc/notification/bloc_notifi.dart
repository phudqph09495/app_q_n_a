import 'package:app_q_n_a/bloc/event_bloc.dart';
import 'package:app_q_n_a/bloc/state_bloc.dart';
import 'package:app_q_n_a/config/path/api_path.dart';
import 'package:app_q_n_a/config/share_pref.dart';
import 'package:app_q_n_a/models/model_news.dart';
import 'package:app_q_n_a/models/model_notifi.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/api.dart';
import '../../../config/path/share_pref_path.dart';
import '../../../models/model_question.dart';

class BlocNotifi extends Bloc<EventBloc, StateBloc> {
  BlocNotifi() : super(StateBloc());
  List<ModelNotifi> list = [];

  @override
  Stream<StateBloc> mapEventToState(EventBloc event) async* {
    if (event is LoadMoreEvent) {
      if (!event.loadMore) {
        yield Loading();
        list.clear();
      }
      try {
        if (event.cleanList) {
          list.clear();
        }
        if (event.loadMore) {
          yield LoadSuccess(
            data: list,
            hasMore: true,
          );
        }
        Map<String, dynamic> req = {};
        req['limit'] = event.limit;
        req['page'] = event.page;
        var res = await Api.postAsync(endPoint: ApiPath.listNotifi, req: req);
        print(res);
        if (res['code'] == 1) {
          for (var item in res['data']) {
            ModelNotifi model = ModelNotifi.fromJson(item);
            list.add(model);
          }
          yield LoadSuccess(
            data: list,
            hasMore: false,
            checkLength:
            res['data'].length == 0 && event.loadMore ? true : false,
          );
        }
      } on DioError catch (e) {
        yield LoadFail(error: e.error.error ?? "Không sác định");
      } catch (e) {
        yield LoadFail(error: e.toString());
      }
    }
  }
}
