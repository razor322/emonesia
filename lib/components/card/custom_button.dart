import 'package:emonesia/styles/app_colors.dart';
import 'package:emonesia/styles/app_sizes.dart';
import 'package:emonesia/styles/text_styles.dart';
import 'package:flutter/material.dart';

class CustomPrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;

  const CustomPrimaryButton({
    super.key,
    required this.onPressed,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.colorPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.s30),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.s30,
          vertical: AppSizes.s10,
        ),
      ),
      child: Text(
        label,
        style: TextStyles.mediumMontserratFont(
          fontSize: AppSizes.s16,
          color: AppColors.colorWhite,
        ),
      ),
    );
  }
}
