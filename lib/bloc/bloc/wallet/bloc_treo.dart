import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/api.dart';
import '../../../config/path/api_path.dart';
import '../../../models/ModelTreo.dart';
import '../../event_bloc.dart';
import '../../state_bloc.dart';

class BlocTreo extends Bloc<EventBloc, StateBloc> {
  BlocTreo() : super(StateBloc());
  List<ModelTreo> treo=[];

  @override
  Stream<StateBloc> mapEventToState(EventBloc event) async* {
    if (event is getHistory) {
      yield Loading();
      try {
        Map<String, dynamic> req = Map();
        var res =
        await Api.postAsync(endPoint: ApiPath.treo, req: req);

        if (res['code'] == 1) {
          for (var item in res['data']) {
            ModelTreo modelTreo = ModelTreo.fromJson(item);
            treo.add(modelTreo);
          }
          yield LoadSuccess(
            data: treo,
          );
        }
      } on DioError catch (e) {
        yield LoadFail(error: e.error.error ?? "Lỗi kết nối");
      } catch (e) {
        yield LoadFail(error: e.toString());
      }
    }
  }
}