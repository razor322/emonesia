import 'dart:io';
import 'package:emonesia/components/dialog/dialog_confirm.dart';
import 'package:emonesia/di/application_module.dart';
import 'package:emonesia/resources/constants/app_constants.dart';
import 'package:emonesia/routes/app_routes.dart';
import 'package:emonesia/services/remote_config/remote_config_repository.dart';
import 'package:emonesia/utils/loader_utils.dart';
import 'package:emonesia/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path/path.dart' as path;
import '../../screens/result/pdf_screen.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class ResultController extends GetxController {
  final RemoteConfigRepository remoteConfigRepository = locator();
  Future<File?> _downloadFile(
      BuildContext context, String url, String filename) async {
    try {
      // final status = await Permission.storage.request();
      // if (!status.isGranted) {
      //   Get.snackbar('Error', AppConstants.LABEL_UNKNOWN_ERROR,
      //       snackPosition: SnackPosition.BOTTOM);
      //   return null;
      // }
      if (Platform.isAndroid) {
        if (await Permission.manageExternalStorage.isDenied) {
          final status = await Permission.manageExternalStorage.request();
          if (!status.isGranted) {
            Get.snackbar('Izin Ditolak',
                'Aplikasi membutuhkan izin untuk menyimpan file.');
            return null;
          }
        }
      }
      cprint("[DEBUG] Mulai download PDF dari: $url");

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
    final String apiBaseUrl = await remoteConfigRepository.getApiBaseUrl();
    cprint('[DEBUG RESULT] API Base URL: $apiBaseUrl',
        warningIn: 'Prediction API');
    final file = await _downloadFile(
        context, "$apiBaseUrl/download-pdf?filename=$outputFile", outputFile);
    if (file != null) {
      cprint(file.path, warningIn: 'File Path');
      Get.to(() => PdfViewerScreen(), arguments: file.path);
    } else {
      Get.snackbar("Gagal", "Terjadi kesalahan saat melihat file.");
    }
  }

  Future<void> saveToDownloads(String sourcePath) async {
    try {
      if (Platform.isAndroid) {
        if (await Permission.manageExternalStorage.isDenied) {
          final status = await Permission.manageExternalStorage.request();
          if (!status.isGranted) {
            Get.snackbar("Permission Denied", "Izin penyimpanan dibutuhkan.");
            return;
          }
        }
      }

      // Perbaiki nama file
      String fileName = path.basename(sourcePath);
      if (fileName.startsWith('hasil\\')) {
        fileName = fileName.replaceFirst('hasil\\', '');
      }

      final downloadsDirectory = Directory('/storage/emulated/0/Download');

      if (!await downloadsDirectory.exists()) {
        await downloadsDirectory.create(recursive: true);
      }

      final newPath = '${downloadsDirectory.path}/$fileName';
      final sourceFile = File(sourcePath);

      if (!(await sourceFile.exists())) {
        Get.snackbar("Gagal", "File sumber tidak ditemukan.");
        return;
      }

      await sourceFile.copy(newPath);

      Get.snackbar("Download Berhasil", "File tersimpan di folder Download.");
    } catch (e) {
      Get.snackbar("Gagal", "Terjadi kesalahan saat menyimpan file.");
      print("[ERROR] $e");
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
