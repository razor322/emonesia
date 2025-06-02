// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:emonesia/components/app/custom_scaffold.dart';
import 'package:emonesia/components/card/custom_result_card.dart';
import 'package:emonesia/components/card/emotion_card.dart';
import 'package:emonesia/components/custom_closable_searchbar.dart';
import 'package:emonesia/controllers/home/prediction_controller.dart';
import 'package:emonesia/resources/constants/app_constants.dart';
import 'package:emonesia/resources/constants/asset_constants.dart';
import 'package:emonesia/routes/app_routes.dart';
import 'package:emonesia/styles/app_sizes.dart';
import 'package:emonesia/styles/text_styles.dart';
import 'package:emonesia/utils/extensions/double_extension.dart';
import 'package:emonesia/utils/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({super.key});
  final PredictionController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(child: _buildBody());
  }

  Widget _buildBody() {
    return _buildContent();
  }

  Widget _buildContent() {
    return Obx(() {
      final data = controller.predictionData.value;

      return Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.s26),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AssetConstants.IMAGE_LOGO.assetPng(
              fit: BoxFit.cover,
            ),
            AppSizes.s16.toVerticalSpace(),
            Text(
              AppConstants.LABEL_HASIL_HEADER,
              style: TextStyles.boldMontserratFont(fontSize: AppSizes.s20),
            ),
            AppSizes.s65.toVerticalSpace(),
            ResultCard(
              title: '"${data?.keyword}"',
              subtitle: AppConstants.LABEL_HASIL_SUBHEADER,
            ),
            AppSizes.s16.toVerticalSpace(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                EmotionResultCard(
                  imageAsset: AssetConstants.IMAGE_EMOTICON,
                  titleCard: AppConstants.LABEL_HASIL_EMOSI,
                  title: data?.dominantLabel ?? "",
                  label: "",
                ),
                EmotionResultCard(
                  imageAsset: AssetConstants.IMAGE_SEARCH,
                  titleCard: AppConstants.LABEL_HASIL_DETEKSI,
                  title: "${data?.jumlah ?? ""} kali",
                  label: "${data?.persentase ?? ""}%",
                  isDetection: true,
                ),
              ],
            ),
            AppSizes.s32.toVerticalSpace(),
            ClosableSearchBar(
              onPress: () {
                Get.offAndToNamed(AppRoutes.main);
              },
              icon: Icon(Icons.close),
            ),
          ],
        ),
      );
    });
  }
}
