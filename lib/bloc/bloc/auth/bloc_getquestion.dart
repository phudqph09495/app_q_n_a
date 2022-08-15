import 'package:app_q_n_a/bloc/event_bloc.dart';
import 'package:app_q_n_a/bloc/state_bloc.dart';
import 'package:app_q_n_a/config/api.dart';
import 'package:app_q_n_a/config/path/api_path.dart';
import 'package:app_q_n_a/config/path/share_pref_path.dart';
import 'package:app_q_n_a/config/share_pref.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_q_n_a/models/model_question.dart';

class BlocGetQuestion extends Bloc<EventBloc, StateBloc> {
  BlocGetQuestion() : super(StateBloc());

  @override
  Stream<StateBloc> mapEventToState(EventBloc event) async* {
    if (event is GetData) {
      List<ModelQuestion> ques = [];

      yield Loading();
      try {
        Map<String, dynamic> req = Map();
        req['cat_id'] = event.cat_id;
        req['class_id'] = event.class_id;
        req['subject_id'] = event.subject_id;
        req['keywords'] = event.keyword;
bool? user=event.user;
        var res = await Api.postAsync(endPoint: ApiPath.getQuestion, req: req,user: user??true);
        print(res);
        if (res["code"] == 1) {
          for (var item in res['data']) {
            ModelQuestion modelQuestion = ModelQuestion.fromJson(item);
            ques.add(modelQuestion);
          }
          yield LoadSuccess(
            data: ques,
            keySearch: event.keySearch,
            keySearch1: event.keySearch1,
            keySearch2: event.keySearch2,
            countFilter: event.countFilter,

              keySearchid: event.cat_id,
            keySearchid1: event.subject_id,
            keySearchid2: event.class_id
          );
        }
        else {
          yield LoadFail(error: res['message'] ?? "Lỗi kết nối");
        }
      } on DioError catch (e) {
        yield LoadFail(error: e.error.error ?? "Lỗi kết nối");
      } catch (e) {
        yield LoadFail(error: e.toString());
      }
    }
  }
}
