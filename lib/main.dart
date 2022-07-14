import 'package:app_q_n_a/Screens/comment.dart';
import 'package:app_q_n_a/Screens/screen_home.dart';
import 'package:app_q_n_a/bloc/bloc/auth/get_token.dart';
import 'package:app_q_n_a/bloc/event_bloc.dart';
import 'package:app_q_n_a/bloc/state_bloc.dart';
import 'package:app_q_n_a/config/path/image_path.dart';
import 'package:app_q_n_a/item/button.dart';
import 'package:app_q_n_a/provider/image_provider.dart';
import 'package:app_q_n_a/styles/colors.dart';
import 'package:app_q_n_a/styles/init_style.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'config/path/share_pref_key.dart';
import 'config/share_pref.dart';
import 'item/button/button2.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs.init();

  final checkLogin = await SharedPrefs.readBool(SharePrefsKey.login);
  if (checkLogin != true) {
    SharePrefsKey.removeAllKey();
  }
  runApp(MyApp(
    checkLogin: checkLogin,
  ));
}

class MyApp extends StatelessWidget {
  bool? checkLogin;
  MyApp({this.checkLogin});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => GetToken()..add(GetData())),
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
          home: BlocBuilder<GetToken, StateBloc>(
              builder: (context, StateBloc state) {
            if (state is Loading) {
              return Scaffold(
                body: Center(
                  child: Image.asset(ImagePath.logo, width: 100, height: 100),
                ),
              );
            }
            if (state is LoadFail) {
              return Scaffold(
                body: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  decoration: const BoxDecoration(
                      gradient: ColorApp.linearGradientMain),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(ImagePath.loadError),
                      const SizedBox(height: 10),
                      Text(
                        state.error,
                        style: StyleApp.textStyle500(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Button2(
                        title: "Tải lại",
                        radius: 10,
                        onTap: () {
                          context.read<GetToken>().add(GetData());
                        },
                        border: Border.all(color: Colors.white, width: 1),
                        width: 100,
                        textColor: Colors.white,
                        bgColor: Colors.transparent,
                      ),
                    ],
                  ),
                ),
              );
            }
            return ScreenHome();
          }),
        ),
      ),
    );
  }
}
