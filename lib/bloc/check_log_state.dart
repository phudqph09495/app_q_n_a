import 'package:app_q_n_a/bloc/state_bloc.dart';
import 'package:flutter/widgets.dart';

import '../widget/items/custom_toast.dart';
import '../widget/items/dia_log_item.dart';

class CheckLogState {
   static check(BuildContext context,{required StateBloc state,String msg = "",
     bool isShowMsg = true,
     Function()? success}){
     if(state is Loading){
       DialogItem.showLoading(context: context);
     }
     if(state is LoadSuccess){
       DialogItem.hideLoading(context: context);
       isShowMsg ? CustomToast.showToast(context: context, msg: msg) : null;
       if(success != null){
         success();
       }
     }
     if(state is LoadFail){
       DialogItem.hideLoading(context: context);
       DialogItem.showMsg(
           context: context,
           title: "Lỗi",
           msg: state.error);
     }
   }
}