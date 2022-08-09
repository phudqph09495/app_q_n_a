import 'package:app_q_n_a/bloc/event_bloc.dart';
import 'package:app_q_n_a/bloc/state_bloc.dart';
import 'package:app_q_n_a/config/api.dart';
import 'package:app_q_n_a/config/path/api_path.dart';
import 'package:app_q_n_a/config/path/share_pref_path.dart';
import 'package:app_q_n_a/config/share_pref.dart';
import 'package:app_q_n_a/models/model_answer.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_q_n_a/models/model_question.dart';

class BlocGetAnswer extends Bloc<EventBloc, StateBloc> {
  BlocGetAnswer() : super(StateBloc());

  @override
  Stream<StateBloc> mapEventToState(EventBloc event) async* {
    if (event is getAns) {
      yield Loading();
      try {
        Map<String, dynamic> req = Map();

        req['question_id'] = event.question_id;

        var res = await Api.postAsync(endPoint: ApiPath.getAnswer, req: req);
        print(res);
        if (res['code'] == 1) {
          ModelAnswer modelAnswer = ModelAnswer.fromJson(res['data']);
          yield LoadSuccess(data: modelAnswer);
        }
        else {
          yield LoadFail(error: res['message'] ?? "Lỗi kết nối");
        }
      } on DioError catch (e) {
        yield LoadFail(error: e.error ?? "Lỗi kết nối");

      }
      catch (e) {
        yield LoadFail(error: e.toString());
      }
    }
  }
}
