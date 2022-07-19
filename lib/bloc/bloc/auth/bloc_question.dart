


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

        List<MultipartFile> images = [];
        if(event.images != null){
          for(var item in event.images!){
            MultipartFile image =  await MultipartFile.fromFile(item.path,
                       filename: item.path.split('/').last);
            images.add(image);
          }
          req['images'] = images;
        }
        print(req);
        var res = await Api.postAsync(endPoint: ApiPath.addQuestion, req: req);
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