import 'package:emonesia/styles/app_colors.dart';
import 'package:emonesia/styles/app_sizes.dart';
import 'package:flutter/material.dart';

class CustomPrimaryButton extends StatelessWidget {
  final double? width;
  final double? height;
  final String text;
  final Color? textColor,
      backgroundColor,
      disabledTextColor,
      disabledBackgroundColor;
  final Function()? onPressed;

  final EdgeInsetsGeometry? margin;
  final double? elevation;
  final double? horizontalPadding;
  final double? borderRadius;
  final TextStyle? textStyle;

  const CustomPrimaryButton({
    super.key,
    this.width,
    this.height,
    required this.text,
    required this.onPressed,
    this.textColor,
    this.backgroundColor,
    this.disabledTextColor,
    this.disabledBackgroundColor,
    this.margin,
    this.elevation,
    this.horizontalPadding,
    this.borderRadius,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      foregroundColor: textColor ?? AppColors.colorPrimary,
      backgroundColor: backgroundColor ?? AppColors.colorWhite,
      disabledForegroundColor: disabledTextColor ?? AppColors.colorPrimary,
      disabledBackgroundColor: disabledBackgroundColor ?? AppColors.colorGrey,
      elevation: elevation ?? 2,
      padding:
          EdgeInsets.symmetric(horizontal: horizontalPadding ?? AppSizes.s16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 10)),
      ),
    );

    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: SizedBox(
        width: width ?? double.infinity,
        height: height ?? AppSizes.s50,
        child: ElevatedButton(
          onPressed: onPressed,
          style: raisedButtonStyle,
          child: Center(
            child: Text(text, style: textStyle),
          ),
        ),
      ),
    );
  }
}
