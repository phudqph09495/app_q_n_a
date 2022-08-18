import 'package:app_q_n_a/bloc/event_bloc.dart';
import 'package:app_q_n_a/bloc/state_bloc.dart';
import 'package:app_q_n_a/config/api.dart';
import 'package:app_q_n_a/config/path/api_path.dart';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

late String loi;

class BlocQuestion extends Bloc<EventBloc, StateBloc> {
  BlocQuestion() : super(StateBloc());

  @override
  Stream<StateBloc> mapEventToState(EventBloc event) async* {
    if (event is addQuesForm) {
      yield Loading();
      try {
        Map<String, dynamic> req = Map();
        req['user_id'] = event.user_id;
        req['subject_id'] = event.subject_id;
        req['class_id'] = event.class_id;
        req['deadline'] = event.deadline;
        req['price_gift'] = event.money;
        req['question'] = event.question;
        req['description'] = event.description;
        List<MultipartFile> images = [];
        if (event.images != null) {
          for (var item in event.images!) {
            MultipartFile image = await MultipartFile.fromFile(item.path,
                filename: item.path.split('/').last);
            images.add(image);
          }
          req['images[]'] = images;
        }
        print(req);
        var res = await Api.postAsync(endPoint: ApiPath.addQuestion, req: req);
        print(res);
        if (res['code'] == 1) {
          yield LoadSuccess(mess: res['message']);
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
        yield LoadFail(error: e.toString());
      }
    }
  }
}
