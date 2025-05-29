import 'package:emonesia/styles/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

extension StringExtension on String {
  Widget assetSvg({
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
  }) {
    return SvgPicture.asset(
      "$this.svg",
      width: width,
      height: height,
      fit: fit,
    );
  }

  Widget assetPng({
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
  }) {
    return Image.asset(
      "$this.png",
      width: width,
      height: height,
      fit: fit,
    );
  }

  Widget assetJpg({
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
  }) {
    return Image.asset(
      "$this.jpg",
      width: width,
      height: height,
      fit: fit,
    );
  }

  Widget imageNetwork({
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    BoxShape boxShape = BoxShape.circle,
  }) {
    return CachedNetworkImage(
      imageUrl: this,
      width: width,
      height: height,
      fit: fit,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: imageProvider, fit: fit),
          shape: boxShape,
        ),
      ),
      placeholder: (context, url) => const CircularProgressIndicator(
        color: AppColors.colorWhite,
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }

  String toFirstTwoWords() {
    List<String> nameParts = this.split(' ');
    return nameParts.length > 2 ? '${nameParts[0]} ${nameParts[1]}' : this;
  }

  String toUpperCaseFirstTwoWords() {
    return toFirstTwoWords().toUpperCase();
  }
}
