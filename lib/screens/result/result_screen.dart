// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:emonesia/components/app/custom_scaffold.dart';
import 'package:emonesia/components/card/custom_result_card.dart';
import 'package:emonesia/components/card/emotion_card.dart';
import 'package:emonesia/controllers/home/prediction_controller.dart';
import 'package:emonesia/controllers/result/result_controller.dart';
import 'package:emonesia/resources/constants/app_constants.dart';
import 'package:emonesia/resources/constants/asset_constants.dart';
import 'package:emonesia/styles/app_colors.dart';
import 'package:emonesia/styles/app_sizes.dart';
import 'package:emonesia/styles/text_styles.dart';
import 'package:emonesia/utils/extensions/double_extension.dart';
import 'package:emonesia/utils/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({super.key});
  final resultC = Get.put(ResultController());
  final controller = Get.put(PredictionController());
  // final PredictionController controller = Get.find();

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
                  title: "${data?.jumlahDominan ?? ""} kali",
                  label: "${data?.persentase ?? ""}",
                  isDetection: true,
                ),
              ],
            ),
            AppSizes.s12.toVerticalSpace(),
            Obx(() {
              final sortedEmotions = controller.getSortedEmotions();
              return Column(children: [
                AppSizes.s10.toVerticalSpace(),
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: AppSizes.s8, bottom: AppSizes.s8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: sortedEmotions.map((item) {
                          return Container(
                            margin: EdgeInsets.only(right: 8),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: AppColors.colorWhite,
                              borderRadius: BorderRadius.circular(AppSizes.s12),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      AppColors.colorPrimary.withOpacity(0.25),
                                  spreadRadius: AppSizes.s1,
                                  blurRadius: AppSizes.s1,
                                  offset: Offset(AppSizes.s0, AppSizes.s1),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  item.labelEmosi,
                                  style: TextStyles.boldMontserratFont(
                                      color: getEmotionColor(item.labelEmosi),
                                      fontSize: AppSizes.s15),
                                ),
                                AppSizes.s8.toVerticalSpace(),
                                RichText(
                                    text: TextSpan(
                                        text: "${item.jumlah} ",
                                        style: TextStyles.boldMontserratFont(
                                            color: AppColors.colorBlack,
                                            fontSize: AppSizes.s15),
                                        children: [
                                      TextSpan(
                                        text: AppConstants.LABEL_JUMLAH,
                                        style: TextStyles.regularMontserratFont(
                                            color: AppColors.colorBlack,
                                            fontSize: AppSizes.s15),
                                      )
                                    ]))
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    )),
              ]);
            }),
            AppSizes.s32.toVerticalSpace(),
            _buildAnalysisActionButtons(
              onViewAnalysis: () {
                resultC.openPdfFromApi(Get.context!, data?.outputFile ?? "");
                print("View Analysis Clicked");
                print("Output File: ${data?.outputFile ?? ""}");
              },
              onClose: () {
                // Get.offAndToNamed(AppRoutes.main);
                resultC.showExitConfirmationDialog();
              },
            ),
          ],
        ),
      );
    });
  }

  Widget _buildAnalysisActionButtons({
    required VoidCallback onViewAnalysis,
    required VoidCallback onClose,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: AppSizes.s280,
          height: AppSizes.s50,
          child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.colorPrimary.withOpacity(0.8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSizes.s60),
                ),
                padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.s20, vertical: AppSizes.s13),
              ),
              onPressed: onViewAnalysis,
              label: Text(
                "Lihat Hasil Analisis!",
                style: TextStyles.mediumMontserratFont(
                  fontSize: AppSizes.s16,
                  color: AppColors.colorWhite,
                ),
              ),
              icon: Icon(Icons.picture_as_pdf_rounded,
                  color: AppColors.colorWhite, size: AppSizes.s25)),
        ),
        IconButton(
          onPressed: onClose,
          style: IconButton.styleFrom(
            backgroundColor: AppColors.colorRed.withOpacity(0.8),
            shape: const CircleBorder(),
            padding: EdgeInsets.all(AppSizes.s13),
          ),
          icon: Icon(Icons.close),
          color: AppColors.colorWhite,
          iconSize: AppSizes.s25,
        ),
      ],
    );
  }

  Color getEmotionColor(String label) {
    switch (label.toLowerCase()) {
      case 'takut':
        return AppColors.colorPurple;
      case 'sedih':
        return AppColors.colorOrange;
      case 'bahagia':
        return AppColors.colorGreen;
      case 'marah':
        return AppColors.colorRed;
      case 'netral':
        return AppColors.colorGrey;
      default:
        return AppColors.colorPrimary;
    }
  }
}
