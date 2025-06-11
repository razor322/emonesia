import 'dart:io';
import 'package:emonesia/components/dialog/dialog_confirm.dart';
import 'package:emonesia/resources/constants/app_constants.dart';
import 'package:emonesia/routes/app_routes.dart';
import 'package:emonesia/utils/loader_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../screens/result/pdf_screen.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class ResultController extends GetxController {
  Future<File?> _downloadFile(
      BuildContext context, String url, String filename) async {
    try {
      final status = await Permission.storage.request();
      if (!status.isGranted) {
        Get.snackbar('Error', AppConstants.LABEL_UNKNOWN_ERROR,
            snackPosition: SnackPosition.BOTTOM);
        return null;
      }

      LoadingUtils.showLoading();

      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final directory = await getApplicationDocumentsDirectory();
        final file = File('${directory.path}/$filename');
        await file.writeAsBytes(response.bodyBytes);
        return file;
      } else {
        Get.snackbar('Error', 'Gagal mengunduh file',
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar('Error', AppConstants.LABEL_UNKNOWN_ERROR,
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      LoadingUtils.hideLoader();
    }
    return null;
  }

  openPdfFromApi(BuildContext context, String outputFile) async {
    final file = await _downloadFile(
        context,
        "${AppConstants.Baseurl}/download-pdf?filename=$outputFile",
        outputFile);
    if (file != null) {
      Get.to(() => PdfViewerScreen(), arguments: file.path);
    } else {
      // Handle error
    }
  }

  Future<void> saveToDownloads(String sourcePath) async {
    try {
      final status = await Permission.storage.request();
      if (!status.isGranted) {
        Get.snackbar("Permission Denied", "Izin penyimpanan dibutuhkan.");
        return;
      }

      final fileName = sourcePath.split('/').last;
      final downloadsDirectory = Directory('/storage/emulated/0/Download');
      final newPath = '${downloadsDirectory.path}/$fileName';

      final sourceFile = File(sourcePath);
      final newFile = await sourceFile.copy(newPath);

      Get.snackbar("Download Berhasil", "File tersimpan di folder Download.");
    } catch (e) {
      Get.snackbar("Gagal", "Terjadi kesalahan saat menyimpan file.");
      print(e);
    }
  }

  void showExitConfirmationDialog() {
    showDialog(
      context: Get.context!,
      builder: (context) => DialogConfirm(
          onYes: () => Get.offAllNamed(AppRoutes.main),
          title: AppConstants.LABEL_TITLE_DIALOG,
          subTitle: AppConstants.LABEL_SUBTITLE_DIALOG),
    );
  }
}
