import 'package:app_q_n_a/bloc/event_bloc.dart';
import 'package:app_q_n_a/bloc/state_bloc.dart';
import 'package:app_q_n_a/config/api.dart';
import 'package:app_q_n_a/config/path/api_path.dart';
import 'package:app_q_n_a/models/model_wallet.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocGetWallet extends Bloc<EventBloc, StateBloc> {
  BlocGetWallet() : super(StateBloc());

  @override
  Stream<StateBloc> mapEventToState(EventBloc event) async* {
    if (event is getViTien) {
      yield Loading();
      try {
        Map<String, dynamic> req = Map();
        req['user_id'] = event.user_id;
        req['cat_id'] = event.cat_id;
        var res=await Api.postAsync(endPoint: ApiPath.getWallet, req: req);

        if (res['code'] == 1) {
          ModelWallet modelWallet=ModelWallet.fromJson(res['data']);
          yield LoadSuccess(
              data: modelWallet
          );
        }
      } on DioError catch (e) {
        yield LoadFail(error: e.error ?? "Lỗi kết nối");
      } catch (e) {
        yield LoadFail(error: e.toString());
      }
    }
  }
}
