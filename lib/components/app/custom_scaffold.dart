import 'package:emonesia/resources/constants/asset_constants.dart';
import 'package:emonesia/utils/extensions/string_extension.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final Widget child;

  const CustomScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: AssetConstants.IMAGE_BG.assetPng(
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(child: child),
        ],
      ),
    );
  }
}
