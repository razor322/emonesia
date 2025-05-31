import 'package:emonesia/components/input/custom_boerderless_text_field.dart';
import 'package:emonesia/styles/app_colors.dart';
import 'package:emonesia/styles/app_sizes.dart';
import 'package:emonesia/utils/extensions/double_extension.dart';
import 'package:flutter/material.dart';

class ClosableSearchBar extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final VoidCallback onPress;
  final Icon icon;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final FocusNode _focusNode = FocusNode();
  ClosableSearchBar({
    super.key,
    this.controller,
    this.hintText,
    this.suffixIcon,
    this.onChanged,
    required this.onPress,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomBorderlessTextField(
          focusNode: _focusNode,
          controller: controller,
          radius: AppSizes.s60,
          hintSize: AppSizes.s14,
          hintColor: AppColors.colorGrey,
          hintText: hintText,
          suffixIcon: suffixIcon,
          onChanged: onChanged,
        ),
        AppSizes.s8.toHorizontalSpace(),
        IconButton(
          onPressed: onPress,
          style: IconButton.styleFrom(
            backgroundColor: AppColors.colorPrimary,
            shape: const CircleBorder(),
            padding: EdgeInsets.all(AppSizes.s13),
          ),
          icon: icon,
          color: AppColors.colorWhite,
          iconSize: AppSizes.s25,
        ),
      ],
    );
  }
}
