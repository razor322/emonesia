import 'package:emonesia/resources/constants/app_constants.dart';
import 'package:emonesia/resources/constants/asset_constants.dart';
import 'package:emonesia/utils/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:emonesia/routes/app_routes.dart';
import 'package:emonesia/styles/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(AppConstants.SPLASH_DURATION, () {
      Get.offNamed(AppRoutes.main);
    });
    return Scaffold(
      backgroundColor: AppColors.colorBackground,
      body: Center(
          child: AssetConstants.IMAGE_SPLASH
              .assetPng(fit: BoxFit.cover, width: Get.width * 10)),
    );
  }
}
