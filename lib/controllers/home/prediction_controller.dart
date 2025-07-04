import 'package:emonesia/di/application_module.dart';
import 'package:emonesia/routes/app_routes.dart';
import 'package:emonesia/services/prediction/model/prediction_request.dart';
import 'package:emonesia/services/prediction/model/prediction_response.dart';
import 'package:emonesia/services/prediction/prediction_repository.dart';
import 'package:emonesia/utils/loader_utils.dart';
import 'package:emonesia/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:emonesia/utils/extensions/datetime_extension.dart';

class PredictionController extends GetxController {
  final PredictionRepository predictionRepository = locator();
  final predictionData = Rxn<PredictionResponse>();
  final selectedRange = Rxn<PickerDateRange>();

  TextEditingController keyword = TextEditingController();
  DateRangePickerController dateRangeController = DateRangePickerController();

  var textValue = ''.obs;
  DateTime? get startRange => selectedRange.value?.startDate;
  DateTime? get endRange => selectedRange.value?.endDate;
  @override
  void onInit() {
    super.onInit();
    keyword.addListener(() {
      textValue.value = keyword.text;
    });
  }

  void clearText() {
    keyword.clear();
    textValue.value = '';
  }

  Future<void> fetchPrediction() async {
    final startDate = dateRangeController.selectedRange!.startDate!
        .getFormattedDate()
        .toString();
    final endDate = dateRangeController.selectedRange!.endDate!
        .getFormattedDate()
        .toString();
    cprint(
      'Start Date: $startDate, End Date: $endDate',
      warningIn: 'Prediction Dates',
    );
    cprint('Keyword: ${keyword.text}', warningIn: 'Prediction Keyword');
    // Validate input
    if (keyword.text.isEmpty || startDate.isEmpty || endDate.isEmpty) {
      Get.snackbar('Error', 'All fields are required',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }
    LoadingUtils.showLoading();
    try {
      final response = await predictionRepository.fetchPrediction(
        PredictionRequest(
          keyword: keyword.text,
          startDate: startDate,
          endDate: endDate,
        ),
      );
      LoadingUtils.hideLoader();
      cprint(predictionData.toJson(),
          event: 'Prediction Success', warningIn: 'Prediction data controller');

      response.fold(
        (error) => Get.snackbar('Error', error.message,
            snackPosition: SnackPosition.BOTTOM),
        (data) {
          predictionData.value = data;
          cprint(data,
              event: 'Prediction Success', warningIn: 'Prediction data');
          cprint("Data berhasil, pindah halaman...");
          keyword.clear();
          dateRangeController.selectedRange = null;
          Get.offAndToNamed(AppRoutes.result);
          Get.snackbar('Success', 'Prediction fetched successfully',
              snackPosition: SnackPosition.BOTTOM);
        },
      );
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch prediction',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  List<DetailEmosi> getSortedEmotions() {
    final data = predictionData.value?.detailEmosi ?? [];

    List<DetailEmosi> emosiCopy = List.from(data);
    emosiCopy.sort((a, b) => b.jumlah.compareTo(a.jumlah));

    if (emosiCopy.isNotEmpty) {
      emosiCopy.removeAt(0);
    }

    if (emosiCopy.length <= 2) return emosiCopy;

    final second = emosiCopy[0];
    final last = emosiCopy.last;
    final middle = emosiCopy.sublist(1, emosiCopy.length - 1);

    return [second, ...middle, last];
  }
}
