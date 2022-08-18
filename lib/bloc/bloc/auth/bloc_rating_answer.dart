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

class BlocRatingAnswer extends Bloc<EventBloc, StateBloc> {
  BlocRatingAnswer() : super(StateBloc());

  @override
  Stream<StateBloc> mapEventToState(EventBloc event) async* {

    if(event is Rating){
      yield Loading();
      try {
        Map<String, dynamic> req1 = Map();
        req1['id'] = event.id;
        req1['ratings']=event.ratings;
        req1['price_tip']=event.price_tip;
        var res = await Api.postAsync(endPoint: ApiPath.goodAnswer, req: req1);
       
        if (res['code'] == 1) {
          yield LoadSuccess();
        } else {
          yield LoadFail(error: res['message'] ?? "Lỗi kết nối");

        }
      } on DioError catch (e) {
        yield LoadFail(error: e.error.error);
      } catch (e) {
        yield LoadFail(error: e.toString());
      }
    }

  }
}