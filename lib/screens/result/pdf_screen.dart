import 'dart:io';

import 'package:emonesia/controllers/result/result_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:emonesia/styles/app_colors.dart';
import 'package:emonesia/styles/app_sizes.dart';
import 'package:emonesia/styles/text_styles.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewerScreen extends StatelessWidget {
  PdfViewerScreen({super.key});
  final ResultController controller = Get.find();

  final String filePath = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.colorBackground,
        elevation: 0,
        title: Text(
          "Hasil Analisis",
          style: TextStyles.boldMontserratFont(
            fontSize: AppSizes.s16,
            color: AppColors.colorPrimary,
          ),
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(Icons.chevron_left),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: AppColors.colorPrimary,
        onPressed: () {
          controller.saveToDownloads(filePath);
        },
        child: const Icon(Icons.download, color: AppColors.colorWhite),
      ),
      body: SfPdfViewer.file(
        File(filePath),
      ),
    );
  }
}
