import 'dart:convert';
import 'dart:math';

import 'package:app_q_n_a/bloc/event_bloc.dart';
import 'package:app_q_n_a/bloc/state_bloc.dart';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/api.dart';
import '../../../config/const.dart';
import '../../../config/path/api_path.dart';
import '../../../config/path/share_pref_path.dart';
import '../../../config/share_pref.dart';

class GetToken extends Bloc<EventBloc, StateBloc> {
  GetToken():super(StateBloc());
  @override
  Stream<StateBloc> mapEventToState(EventBloc event) async* {
   if(event is GetData){
     yield Loading();
     try{
       bool isLogin = await SharedPrefs.readBool(SharePrefsKey.login);
       if(!isLogin){
         var rng = Random();
         var randText = rng.nextInt(1000000000);
         var token = sha1.convert(utf8.encode(randText.toString() + Const.key));
         var res = await Api.getAsync(endPoint: ApiPath.startHome + randText.toString(),tokenStart: token.toString());
         if(res["code"] == 1){
           SharedPrefs.saveString(SharePrefsKey.user_token, res['data']['token']);
           yield LoadSuccess(
               data: res['data']['token']
           );
         }else{
           yield LoadFail(error: res['message'] ?? "Tạo token không thành công.");
         }
       }else{
         String? token = await SharedPrefs.readString(SharePrefsKey.user_token);
         yield LoadSuccess(
             data: token
         );
       }
     } on DioError catch (e) {
       yield LoadFail(error: e.error.error);
     } catch (e) {
       yield LoadFail(error: e.toString());
     }
   }
  }
}