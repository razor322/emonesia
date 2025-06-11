import 'package:emonesia/components/button/custom_bordered_button.dart';
import 'package:emonesia/components/button/custom_primary_button.dart';
import 'package:emonesia/resources/constants/app_constants.dart';
import 'package:emonesia/styles/app_colors.dart';
import 'package:emonesia/styles/app_sizes.dart';
import 'package:emonesia/styles/text_styles.dart';
import 'package:emonesia/utils/extensions/double_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogConfirm extends StatelessWidget {
  final String title;
  final String subTitle;
  final String? buttonYesText;
  final String? buttonNoText;
  final VoidCallback? onYes;

  const DialogConfirm({
    super.key,
    required this.title,
    required this.subTitle,
    this.buttonYesText,
    this.buttonNoText,
    this.onYes,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: AppSizes.s20, horizontal: AppSizes.s30),
        margin: EdgeInsets.symmetric(horizontal: AppSizes.s32),
        decoration: BoxDecoration(
          color: AppColors.colorWhite,
          borderRadius: BorderRadius.circular(AppSizes.s16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyles.boldMontserratFont(
                fontSize: AppSizes.s20,
                color: AppColors.colorPrimary,
              ),
            ),
            AppSizes.s12.toVerticalSpace(),
            Text(
              subTitle,
              textAlign: TextAlign.center,
              style: TextStyles.regularMontserratFont(
                fontSize: FontSize.s16,
                color: AppColors.colorTextBlack,
              ),
            ),
            AppSizes.s24.toVerticalSpace(),
            Row(
              children: [
                Expanded(
                  child: CustomBorderedButton(
                    onPressed: () => Get.back(),
                    text: buttonYesText ?? AppConstants.ACTION_CANCEL,
                    color: AppColors.colorTextBlack,
                    textStyle: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                AppSizes.s16.toHorizontalSpace(),
                Expanded(
                  child: CustomPrimaryButton(
                    onPressed: onYes,
                    text: buttonNoText ?? AppConstants.ACTION_CONFIRM,
                    backgroundColor: AppColors.colorPrimary,
                    textColor: AppColors.colorWhite,
                    textStyle: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
