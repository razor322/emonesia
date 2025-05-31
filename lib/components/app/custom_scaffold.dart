import 'package:emonesia/resources/constants/app_constants.dart';
import 'package:emonesia/resources/constants/asset_constants.dart';
import 'package:emonesia/styles/app_colors.dart';
import 'package:emonesia/styles/app_sizes.dart';
import 'package:emonesia/styles/text_styles.dart';
import 'package:emonesia/utils/extensions/string_extension.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final Widget child;
  final String? version;

  const CustomScaffold({super.key, required this.child, this.version});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Text(
        AppConstants.appVersion,
        style: TextStyles.regularOpenSansFont(
          fontSize: AppSizes.s14,
          color: AppColors.colorGrey,
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: AssetConstants.IMAGE_BG.assetPng(
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(child: child),
        ],
      ),
    );
  }
}
