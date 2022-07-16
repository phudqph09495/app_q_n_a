


import 'package:app_q_n_a/bloc/event_bloc.dart';
import 'package:app_q_n_a/bloc/state_bloc.dart';
import 'package:app_q_n_a/config/api.dart';
import 'package:app_q_n_a/config/path/api_path.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocQuestion extends Bloc<EventBloc,StateBloc>{
  BlocQuestion():super(StateBloc());

  @override

  Stream<StateBloc> mapEventToState(EventBloc event) async* {
    if (event is addQuesForm) {
      yield Loading();
      try {
        Map<String, dynamic> req = Map();
        // req['email'] = event.email;
        // req['password'] = event.password;
        req['user_id']=event.user_id;
        req['cat_id']=event.cat_id;
        req['class_id']=event.class_id;
        req['deadline']=event.deadline;
        req['money']=event.money;
        req['image[]']=event.image;
        Map<String, dynamic> req1 = Map();
        req1['QuestionForm'] = req;

        var res = await Api.postAsync(endPoint: ApiPath.addQuestion, req: req1);
        if (res['code'] == 1) {
          // ModelUser model = ModelUser.fromJson(res['data']);
          yield LoadSuccess(
            // data: model,
          );
        } else {
          yield LoadFail(error: res['message'] ?? "Lỗi kết nối");
        }
      } on DioError catch (e) {
        yield LoadFail(error: e.error);
      } catch (e) {
        yield LoadFail(error: e.toString());
      }
    }
  }

}