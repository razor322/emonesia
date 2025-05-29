import 'dart:io';

import 'package:emonesia/components/custom_on_tap.dart';
import 'package:emonesia/resources/constants/asset_constants.dart';
import 'package:emonesia/styles/app_colors.dart';
import 'package:emonesia/utils/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.colorPrimary.withOpacity(0.19),
        centerTitle: false,
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: CustomOnTap(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Platform.isIOS ? Icons.arrow_back_ios_new : Icons.arrow_back,
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: AssetConstants.IMAGE_BG.assetPng(
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
