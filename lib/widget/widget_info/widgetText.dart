import 'package:app_q_n_a/Screens/account/edit_account/edit_profile.dart';
import 'package:app_q_n_a/bloc/bloc/auth/bloc_get_user.dart';
import 'package:app_q_n_a/bloc/bloc/auth/bloc_get_user_local.dart';
import 'package:app_q_n_a/bloc/event_bloc.dart';
import 'package:app_q_n_a/config/next_page.dart';
import 'package:app_q_n_a/item/button.dart';
import 'package:app_q_n_a/models/model_user.dart';
import 'package:app_q_n_a/styles/init_style.dart';
import 'package:app_q_n_a/widget/items/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Screens/account/item/bottom_sheet.dart';
import '../../bloc/bloc/auth/bloc_get_wallet.dart';
import '../../bloc/bloc/auth/bloc_waller_history.dart';
import '../../config/const.dart';
import '../../config/path/image_path.dart';
import '../../item/load_image.dart';
import '../../path/image_path.dart';
import 'widgetIcons.dart';
import '../../../bloc/state_bloc.dart';

int userID = 0;
bool iskyc = false;

class ItemAccount extends StatefulWidget {
  @override
  State<ItemAccount> createState() => _ItemAccountState();
}

class _ItemAccountState extends State<ItemAccount> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<BlocGetWallet>().add(GetData());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BLocLocalUser, ModelUser?>(builder: (context, snapshot) {
      ModelUser user = snapshot ?? ModelUser();
      userID = user.id ?? 0;
      iskyc = user.isKyc ?? false;
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          children: [
            Stack(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: ColorApp.orangeF8, width: 1),
                  ),
                  child: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) => BottomSheetAccount());
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: LoadImage(
                        url: Const.image_host +
                            user.avatarPath.toString() +
                            user.avatarName.toString(),
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                // Positioned(
                //     bottom: 0,
                //     right: 0,
                //     child: Container(
                //       height: 20,
                //       width: 20,
                //       child: const Icon(
                //         Icons.edit,
                //         color: Colors.white,
                //         size: 15,
                //       ),
                //       decoration: const BoxDecoration(
                //         color: Colors.lightGreen,
                //         borderRadius: BorderRadius.all(
                //           Radius.circular(20),
                //         ),
                //       ),
                //     ))
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    // Const.checkStringNull(name),
                    'Họ và tên: ${user.username ?? ""}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: StyleApp.textStyle700(
                        color: ColorApp.black, fontSize: 16),
                  ),
                  Text(
                    // Const.checkStringNull(id),
                    'Id : $userID',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: StyleApp.textStyle700(
                        color: ColorApp.black, fontSize: 16),
                  ),
                  BlocBuilder<BlocGetWallet, StateBloc>(builder: (_, state) {
                    final coin = state is LoadSuccess ? state.data as int : 0;
                    return Text(
                      'VNĐ: ${Const.convertPrice(coin)} ',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: StyleApp.textStyle700(
                          color: ColorApp.red, fontSize: 16),
                    );
                  }),
                ],
              ),
            ),

          ],
        ),
      );
    });
  }
}
