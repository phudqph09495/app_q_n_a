import 'package:app_q_n_a/Screens/screen_home.dart';
import 'package:app_q_n_a/provider/image_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ImageAppProvider()..setImage()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          unselectedWidgetColor: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'),
          Locale('vi'),
        ],
        home: ScreenHome(),
      ),
    );
  }
}
