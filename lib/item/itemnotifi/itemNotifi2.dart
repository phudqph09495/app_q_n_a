import 'package:app_q_n_a/Screens/Screens_Notification/screens_news.dart';
import 'package:app_q_n_a/bloc/state_bloc.dart';
import 'package:app_q_n_a/config/next_page.dart';
import 'package:app_q_n_a/item/load_image.dart';
import 'package:app_q_n_a/models/model_notifi.dart';
import 'package:flutter/material.dart';
import 'package:app_q_n_a/styles/init_style.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/bloc/notification/bloc_read_notifi.dart';
import '../../bloc/event_bloc.dart';
import '../../config/const.dart';
import '../../widget/notifi/notifi.dart';

class Notification2 extends StatefulWidget {
  ModelNotifi modelNotifi ;

  Notification2({required this.modelNotifi});

  @override
  State<Notification2> createState() => _Notification2State();
}

class _Notification2State extends State<Notification2> {
  BlocReadNotifi bloc = BlocReadNotifi();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        bloc.add(GetData(id: widget.modelNotifi.id));
        widget.modelNotifi.unread = "0";
        FirebaseSendNotifi.nextPage(
          context,
          model: widget.modelNotifi,
        );
        setState((){});
      },
      child:  BlocListener(
        bloc: bloc,
        listener: (_,StateBloc state){},
        child: Container(
          padding: const EdgeInsets.all(10.0),
          decoration:  BoxDecoration(
            border: const Border(
              bottom: BorderSide(color: Colors.grey, width:0.5),
            ),
            color: widget.modelNotifi.unread == "1" ?  ColorApp.orangeF0.withOpacity(0.05) : Colors.white
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                widget.modelNotifi.title ?? "",
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: StyleApp.textStyle500(),
              ),
              const SizedBox(height: 5),
              Text(
                Const.checkTime(Const.convertNumber(widget.modelNotifi.createdAt).round()),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: StyleApp.textStyle400(
                    fontSize: 12, color: ColorApp.grey82),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
