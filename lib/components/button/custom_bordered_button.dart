import 'package:emonesia/styles/app_colors.dart';
import 'package:emonesia/styles/app_sizes.dart';
import 'package:flutter/material.dart';

class CustomBorderedButton extends StatelessWidget {
  final String text;
  final Color color;
  final Function()? onPressed;

  final EdgeInsetsGeometry? margin;
  final double? elevation;
  final double? horizontalPadding;
  final double? borderRadius;
  final TextStyle? textStyle;

  const CustomBorderedButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.color,
    this.margin,
    this.elevation,
    this.horizontalPadding,
    this.borderRadius,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      foregroundColor: color,
      backgroundColor: AppColors.colorWhite,
      elevation: elevation ?? 2,
      padding:
          EdgeInsets.symmetric(horizontal: horizontalPadding ?? AppSizes.s16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 10)),
        side: BorderSide(
          color: onPressed == null ? AppColors.colorLightGrey : color,
        ),
      ),
    );

    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: ElevatedButton(
        onPressed: onPressed,
        style: raisedButtonStyle,
        child: SizedBox(
          width: double.infinity,
          height: AppSizes.s50,
          child: Center(
            child: Text(text, style: textStyle),
          ),
        ),
      ),
    );
  }
}
