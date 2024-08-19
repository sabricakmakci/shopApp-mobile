import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart' as getx;
import 'package:get/get.dart';
import 'package:shop_app_mobile/l10n/l10n.dart';
import 'package:shop_app_mobile/views/screen/splash/splash_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return GetCupertinoApp(
      enableLog: true,
      defaultTransition: getx.Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      supportedLocales: L10n.all,
      locale: const Locale('tr'),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
    );
  }
}
