import 'package:app_q_n_a/bloc/event_bloc.dart';
import 'package:app_q_n_a/bloc/state_bloc.dart';
import 'package:app_q_n_a/config/path/share_pref_path.dart';
import 'package:app_q_n_a/config/share_pref.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocCheckLogin extends Bloc<EventBloc, StateBloc> {
  BlocCheckLogin() : super(StateBloc());

  @override
  Stream<StateBloc> mapEventToState(EventBloc event) async* {
    if (event is GetData) {
      bool check = await SharedPrefs.readBool(SharePrefsKeys.login) ?? false;
      yield LoadSuccess(
        data: check,
      );
    }
  }
}
