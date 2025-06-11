import 'package:emonesia/styles/text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextBold extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  const CustomTextBold(
      {super.key,
      required this.text,
      required this.fontSize,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyles.boldMontserratFont(
        fontSize: fontSize,
        color: color,
      ),
    );
  }
}

class CustomTextMedium extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  const CustomTextMedium(
      {super.key,
      required this.text,
      required this.fontSize,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyles.mediumMontserratFont(
        fontSize: fontSize,
        color: color,
      ),
    );
  }
}

class CustomTextRegular extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final Function? onAction;

  const CustomTextRegular({
    super.key,
    required this.text,
    required this.fontSize,
    required this.color,
    this.onAction,
  });

  const CustomTextRegular.withOnAction({
    super.key,
    required this.text,
    required this.fontSize,
    required this.color,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onAction != null ? () => onAction!() : null,
      child: Text(
        text,
        style: TextStyles.regularMontserratFont(
          fontSize: fontSize,
          color: color,
        ),
      ),
    );
  }
}

class CustomRegularTextOpenSans extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  const CustomRegularTextOpenSans(
      {super.key,
      required this.text,
      required this.fontSize,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyles.regularOpenSansFont(
        fontSize: fontSize,
        color: color,
      ),
    );
  }
}
