
import 'package:app_q_n_a/Screens/comment.dart';
import 'package:app_q_n_a/Screens/screen_home.dart';
import 'package:app_q_n_a/bloc/bloc/auth/get_token.dart';
import 'package:app_q_n_a/bloc/event_bloc.dart';
import 'package:app_q_n_a/bloc/state_bloc.dart';
import 'package:app_q_n_a/provider/image_provider.dart';
import 'package:app_q_n_a/styles/colors.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'config/share_pref.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs.init();
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
       providers: [
         BlocProvider(create: (_)=>GetToken()..add(GetData())),
       ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ImageAppProvider()..setImage()),
        ],
        child: MaterialApp(
          // useInheritedMediaQuery: true,
          // locale: DevicePreview.locale(context),
          // builder: DevicePreview.appBuilder,
          theme: ThemeData(
            unselectedWidgetColor: ColorApp.orangeF2,
          ),
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'),
            Locale('vi'),
          ],
          locale: Locale('vi'),
          home: BlocBuilder<GetToken,StateBloc>(
            builder: (context, StateBloc state) {
              if(state is Loading){

              }
              if(state is LoadFail){

              }
              return ScreenHome();
            }
          ),
        ),
      ),
    );
  }
}
