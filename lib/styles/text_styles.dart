import 'package:flutter/material.dart';
import 'package:emonesia/styles/app_sizes.dart';

import 'app_colors.dart';

class TextStyles {
  static TextStyle regularMontserratFont({double? fontSize, Color? color}) {
    return TextStyle(
      fontFamily: 'Montserrat',
      fontSize: fontSize ?? FontSize.s14,
      color: color ?? AppColors.colorBlack,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle mediumMontserratFont({double? fontSize, Color? color}) {
    return TextStyle(
      fontFamily: 'Montserrat',
      fontSize: fontSize ?? FontSize.s14,
      color: color ?? AppColors.colorBlack,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle boldMontserratFont({double? fontSize, Color? color}) {
    return TextStyle(
      fontFamily: 'Montserrat',
      fontSize: fontSize ?? FontSize.s14,
      color: color ?? AppColors.colorBlack,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle regularOpenSansFont({double? fontSize, Color? color}) {
    return TextStyle(
      fontSize: fontSize ?? FontSize.s14,
      fontFamily: 'OpenSans',
      color: color ?? AppColors.colorBlack,
      fontWeight: FontWeight.w400,
    );
  }
}
