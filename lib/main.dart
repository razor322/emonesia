import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:emonesia/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
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
    );
  }
}
