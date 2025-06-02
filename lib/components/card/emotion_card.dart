import 'package:emonesia/resources/constants/app_constants.dart';
import 'package:emonesia/styles/app_colors.dart';
import 'package:emonesia/styles/app_sizes.dart';
import 'package:emonesia/styles/text_styles.dart';
import 'package:emonesia/utils/extensions/double_extension.dart';
import 'package:emonesia/utils/extensions/string_extension.dart';
import 'package:flutter/material.dart';

class EmotionResultCard extends StatelessWidget {
  final String imageAsset;
  final String title;
  final String titleCard;
  final String label;
  final bool isDetection;

  const EmotionResultCard({
    super.key,
    required this.imageAsset,
    required this.title,
    required this.titleCard,
    required this.label,
    this.isDetection = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSizes.s16),
      width: AppSizes.s162,
      height: AppSizes.s145,
      decoration: BoxDecoration(
        color: AppColors.colorWhite,
        borderRadius: BorderRadius.circular(AppSizes.s12),
        boxShadow: [
          BoxShadow(
            color: AppColors.colorPrimary.withOpacity(0.25),
            spreadRadius: AppSizes.s20,
            blurRadius: AppSizes.s25,
            offset: Offset(AppSizes.s0, AppSizes.s2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          imageAsset.assetPng(
            fit: BoxFit.cover,
            width: AppSizes.s35,
          ),
          AppSizes.s16.toVerticalSpace(),
          Text(
            titleCard,
            style: TextStyles.regularOpenSansFont(
              fontSize: AppSizes.s14,
              color: AppColors.colorGrey,
            ),
          ),
          isDetection
              ? AppSizes.s8.toVerticalSpace()
              : AppSizes.s16.toVerticalSpace(),
          Row(
            children: [
              Text(
                title,
                style: TextStyles.boldMontserratFont(
                  fontSize: AppSizes.s16,
                  color: AppColors.colorBlack,
                ),
              ),
              AppSizes.s4.toHorizontalSpace(),
              Container(
                padding: isDetection
                    ? EdgeInsets.symmetric(
                        horizontal: AppSizes.s8,
                        vertical: AppSizes.s8,
                      )
                    : EdgeInsets.zero,
                decoration: isDetection
                    ? BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSizes.s8),
                        color: AppColors.colorPrimary,
                      )
                    : null,
                child: Text(
                  label,
                  style: isDetection
                      ? TextStyles.boldMontserratFont(
                          fontSize: AppSizes.s12, color: AppColors.colorWhite)
                      : TextStyles.regularOpenSansFont(
                          fontSize: AppSizes.s12,
                          color: AppColors.colorGrey,
                        ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
