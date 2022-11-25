import 'package:app_q_n_a/Screens/screen_home.dart';
import 'package:app_q_n_a/bloc/bloc/auth/bloc_get_user.dart';
import 'package:app_q_n_a/bloc/bloc/auth/bloc_get_user_local.dart';
import 'package:app_q_n_a/bloc/bloc/auth/bloc_version.dart';
import 'package:app_q_n_a/bloc/bloc/auth/get_token.dart';
import 'package:app_q_n_a/bloc/event_bloc.dart';
import 'package:app_q_n_a/bloc/state_bloc.dart';
import 'package:app_q_n_a/config/path/image_path.dart';
import 'package:app_q_n_a/provider/image_provider.dart';
import 'package:app_q_n_a/styles/init_style.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';

import 'bloc/bloc/auth/bloc_check_login.dart';
import 'bloc/bloc/auth/bloc_get_wallet.dart';
import 'bloc/bloc/auth/bloc_getquestion.dart';
import 'config/path/share_pref_path.dart';
import 'config/share_pref.dart';
import 'item/button/button2.dart';
import 'path/image_path.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SharedPrefs.init();
  AndroidInitializationSettings initializationSettingsAndroid =
      const AndroidInitializationSettings('@mipmap/ic_launcher');

  const DarwinInitializationSettings initializationSettingsDarwin =
      DarwinInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
  );
  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsDarwin,
  );
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  final checkLogin = await SharedPrefs.readBool(SharePrefsKeys.login);
  if (checkLogin != true) {
    SharePrefsKeys.removeAllKey();
  }
  runApp(
      //     DevicePreview(
      //       enabled: !kReleaseMode,
      //       builder: (context) => MyApp(
      //         checkLogin: checkLogin,
      //       ), // Wrap your app
      //     ));
      MyApp(
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
        BlocProvider(create: (_) => BlocCheckLogin()..add(GetData())),
        BlocProvider(create: (_) => BlocGetQuestion()),
        BlocProvider(create: (_) => BLocLocalUser()..getUser()),
        BlocProvider(create: (_) => BlocGetWallet()..add(GetData())),
        BlocProvider(create: (_) => BlocGetUser()..add(GetData())),
        BlocProvider(create: (_) => BlocCheckVersion()..checkData()),
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ImageAppProvider()..setImage()),
        ],
        child: OverlaySupport.global(
          child: MaterialApp(
            useInheritedMediaQuery: true,
            builder: DevicePreview.appBuilder,
            theme: ThemeData(
                unselectedWidgetColor: ColorApp.orangeF2,
                iconTheme: const IconThemeData(color: Colors.black)),
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
            locale: const Locale('vi'),
            home: BlocBuilder<GetToken, StateBloc>(
              builder: (context, StateBloc state) {
                if (state is Loading) {
                  return Scaffold(
                    body: Center(
                      child: Image.asset(
                        ImagesPath.imageLogo,
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.width * 0.8,
                        fit: BoxFit.fitWidth,
                      ),
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
              },
            ),
          ),
        ),
      ),
    );
  }
}
