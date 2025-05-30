import 'package:emonesia/styles/app_colors.dart';
import 'package:emonesia/styles/app_sizes.dart';
import 'package:emonesia/styles/text_styles.dart';
import 'package:emonesia/utils/extensions/double_extension.dart';
import 'package:flutter/material.dart';

class ResultCard extends StatelessWidget {
  final String title;
  final String subtitle;

  const ResultCard({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSizes.s12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.colorWhite,
        borderRadius: BorderRadius.circular(AppSizes.s12),
        boxShadow: [
          BoxShadow(
            color: AppColors.colorPrimary.withOpacity(0.25),
            spreadRadius: AppSizes.s11,
            blurRadius: AppSizes.s20,
            offset: Offset(AppSizes.s0, AppSizes.s2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyles.boldMontserratFont(
              fontSize: AppSizes.s18,
              color: AppColors.colorBlack,
            ),
          ),
          AppSizes.s8.toVerticalSpace(),
          Text(
            subtitle,
            style: TextStyles.regularOpenSansFont(
              fontSize: AppSizes.s14,
              color: AppColors.colorBlack,
            ),
          ),
        ],
      ),
    );
  }
}
