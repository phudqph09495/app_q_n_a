import 'package:app_q_n_a/bloc/event_bloc.dart';
import 'package:app_q_n_a/bloc/state_bloc.dart';
import 'package:app_q_n_a/config/api.dart';
import 'package:app_q_n_a/config/path/api_path.dart';
import 'package:app_q_n_a/models/model_wallet.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocWalletHistory extends Bloc<EventBloc, StateBloc> {
  BlocWalletHistory() : super(StateBloc());

  @override
  Stream<StateBloc> mapEventToState(EventBloc event) async* {
    if (event is getHistory) {
      List<Datas> ques = [];
      yield Loading();
      try {
        Map<String, dynamic> req = Map();
        req['user_id']=event.user_id;
        req['limit']=event.limit;
        req['page']=event.page;
        req['is_week']=event.is_week;
        req['is_day']=event.is_day;
        req['is_month']=event.is_month;
        req['is_last_month']=event.is_last_month;
        req['start_time']=event.start_time;
        req['end_time']=event.end_time;
        var res = await Api.postAsync(endPoint: ApiPath.getWalletHistory, req: req);
        print(res);
        if (res['code'] == 1) {
          Datas datas = Datas.fromJson(res['data']);
          ques.add(datas);
          yield LoadSuccess(
            data: ques,
          );
        }
      } on DioError catch (e) {
        yield LoadFail(error: e.error ?? "Lỗi kết nối");
      } catch (e) {
        yield LoadFail(error: e.toString());
      }
    }
    // if (event is getHistory) {
    //   yield Loading();
    //   try {
    //     Map<String, dynamic> req = Map();
    //     req['user_id'] = event.user_id;
    //     req['limit'] = event.limit;
    //     req['page'] = event.page;
    //     req['is_week'] = event.is_week;
    //     req['is_day'] = event.is_day;
    //     req['is_month'] = event.is_month;
    //     req['is_last_month'] = event.is_last_month;
    //     req['start_time'] = event.start_time;
    //     req['end_time'] = event.end_time;
    //     var res =
    //         await Api.postAsync(endPoint: ApiPath.getWalletHistory, req: req);
    //     print(res);
    //     if (res['code'] == 1) {
    //       ModelHistory modelHistory = ModelHistory.fromJson(res['data']);
    //       yield LoadSuccess(data: modelHistory);
    //     }
    //   } on DioError catch (e) {
    //     yield LoadFail(error: e.error ?? "Lỗi kết nối");
    //   } catch (e) {
    //     yield LoadFail(error: e.toString());
    //   }
    // }
  }
}
