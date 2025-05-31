import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:emonesia/routes/app_routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:emonesia/di/application_module.dart' as di;

class MyHttpoverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    HttpOverrides.global = MyHttpoverrides();
    await di.init();
    runApp(const MyApp());
  }, (error, stack) {
    log('Error: $error');
    log('Stack trace: $stack');
  });
  ;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Emonesia',
      initialRoute: AppRoutes.splash,
      debugShowCheckedModeBanner: false,
      locale: const Locale('en', 'EN'),
      supportedLocales: const [
        Locale('en', 'EN'),
      ],
      theme: ThemeData(
        fontFamily: 'Inter',
      ),
      getPages: AppRoutes.routes,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
    );
  }
}
