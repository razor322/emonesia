import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:emonesia/routes/app_routes.dart';
import 'package:emonesia/styles/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed(AppRoutes.main);
    });
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            color: AppColors.colorWhite,
            child: Text(
              "splash",
            ),
          ),
        ),
      ),
    );
  }
}
