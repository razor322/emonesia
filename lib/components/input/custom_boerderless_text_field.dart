import 'package:emonesia/styles/app_colors.dart';
import 'package:emonesia/styles/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomBorderlessTextField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? inputType;
  final int? maxLines, maxLength;
  final String? hintText;
  final Function(String)? onSubmitted;
  final Function(String)? onChanged;
  final TextAlign? textAlign;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final bool? isOptional;
  final double? radius, verticalMargin, horizontalMargin, verticalPadding;
  final Color? fillColor;
  final Color? hintColor;
  final Color? cursorColor;
  final Color? textColor;
  final double? hintSize;
  final double? textSize;
  final double? width;
  final double? height;
  final bool readOnly;
  final bool enabled;
  final bool? obscureText;
  final Function()? onTap;
  final FocusNode? focusNode;

  const CustomBorderlessTextField({
    Key? key,
    this.width,
    this.height,
    this.controller,
    this.maxLines,
    this.hintText,
    this.inputType,
    this.onSubmitted,
    this.maxLength,
    this.prefixIcon,
    this.isOptional,
    this.suffixIcon,
    this.radius,
    this.verticalMargin,
    this.horizontalMargin,
    this.verticalPadding,
    this.fillColor,
    this.hintColor,
    this.cursorColor,
    this.textColor,
    this.onChanged,
    this.textAlign,
    this.hintSize,
    this.textSize,
    this.readOnly = false,
    this.enabled = true,
    this.obscureText = false,
    this.onTap,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width ?? AppSizes.s280,
        height: height ?? AppSizes.s50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? AppSizes.s4),
          border: Border.all(width: 2, color: AppColors.colorBorder),
          boxShadow: [
            BoxShadow(
              color: AppColors.colorPrimary.withOpacity(0.25),
              spreadRadius: AppSizes.s11,
              blurRadius: AppSizes.s20,
              offset: Offset(AppSizes.s0, AppSizes.s4),
            ),
          ],
        ),
        child: TextFormField(
          focusNode: focusNode,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z0-9\s]+$')),
          ],
          onChanged: onChanged,
          showCursor: true,
          controller: controller,
          keyboardType: TextInputType.text,
          maxLines: 1,
          maxLength: 30,
          obscureText: obscureText ?? false,
          onFieldSubmitted: onSubmitted,
          cursorColor: cursorColor ?? Colors.black45,
          textAlign: textAlign ?? TextAlign.start,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          buildCounter: (
            _, {
            required int currentLength,
            required bool isFocused,
            required int? maxLength,
          }) =>
              null,
          validator: (value) {
            if (isOptional ?? false) {
              return null;
            }
            if (value == null || value.isEmpty) {
              return "Field ini wajib diisi";
            }
            return null;
          },
          style: TextStyle(
              fontFamily: 'OpenSans',
              color: textColor ?? Colors.black,
              fontSize: textSize ?? FontSize.s14),
          readOnly: readOnly,
          enabled: enabled,
          onTap: onTap,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            fillColor: fillColor ?? Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius ?? AppSizes.s4),
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
            ),
            contentPadding:
                EdgeInsets.only(left: AppSizes.s16, top: AppSizes.s20),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius ?? AppSizes.s4),
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius ?? AppSizes.s4),
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius ?? AppSizes.s4),
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius ?? AppSizes.s4),
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
            ),
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: hintSize ?? 16,
                color: hintColor ?? Colors.grey),
          ),
        ));
  }
}
