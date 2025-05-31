// ignore_for_file: prefer_const_constructors

import 'package:emonesia/components/app/custom_scaffold.dart';
import 'package:emonesia/components/card/custom_button.dart';
import 'package:emonesia/components/custom_closable_searchbar.dart';
import 'package:emonesia/components/dialog/dialog_date_picker.dart';
import 'package:emonesia/controllers/home/prediction_controller.dart';
import 'package:emonesia/resources/constants/app_constants.dart';
import 'package:emonesia/resources/constants/asset_constants.dart';
import 'package:emonesia/styles/app_sizes.dart';
import 'package:emonesia/styles/text_styles.dart';
import 'package:emonesia/utils/extensions/double_extension.dart';
import 'package:emonesia/utils/extensions/string_extension.dart';
import 'package:emonesia/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:emonesia/utils/extensions/datetime_extension.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final controller = Get.put(PredictionController());

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return _buildContent();
  }

  Widget _buildContent() {
    return CustomScaffold(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AssetConstants.IMAGE_LOGO.assetPng(
          fit: BoxFit.cover,
        ),
        SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.s26),
          child: Column(
            children: [
              Text(
                AppConstants.LABEL_HOME_HEADER,
                style: TextStyles.boldMontserratFont(fontSize: AppSizes.s20),
              ),
              AppSizes.s10.toVerticalSpace(),
              Text(
                AppConstants.LABEL_HOME_SUBHEADER,
                textAlign: TextAlign.center,
                style: TextStyles.regularMontserratFont(fontSize: AppSizes.s16),
              ),
              AppSizes.s40.toVerticalSpace(),
              Obx(
                () => ClosableSearchBar(
                  controller: controller.keyword,
                  hintText: AppConstants.HINT_SEARCH,
                  suffixIcon: controller.textValue.value.isNotEmpty
                      ? IconButton(
                          icon: Icon(Icons.close),
                          onPressed: controller.clearText,
                        )
                      : null,
                  onChanged: (val) {
                    controller.textValue.value = val;
                  },
                  onPress: () {
                    showDialog(
                      context: Get.context!,
                      builder: (ctx) {
                        return CustomDateRangePicker(
                          controller: controller.dateRangeController,
                          onSubmit: (range) {
                            if (range != null) {
                              print("Start: ${range.startDate}");
                              print("End: ${range.endDate}");
                            }
                          },
                        );
                      },
                    );
                  },
                  icon: Icon(Icons.calendar_month),
                ),
              ),
              AppSizes.s24.toVerticalSpace(),
              CustomPrimaryButton(
                onPressed: () {
                  if (controller.keyword.text.isEmpty ||
                      controller.dateRangeController.selectedRange == null) {
                    Get.snackbar(
                      'Error',
                      'Please fill in all fields',
                      snackPosition: SnackPosition.BOTTOM,
                    );
                    return;
                  }
                  controller.fetchPrediction();

                  cprint("Keyword: ${controller.keyword.text}");

                  cprint(
                      "Start Date1: ${controller.dateRangeController.selectedRange!.startDate?.getFormattedDate()}");
                  cprint(
                      "End Date: ${controller.dateRangeController.selectedRange!.endDate?.getFormattedDate()}");
                },
                label: AppConstants.ACTION_SEARCH,
              ),
              // AppSizes.s120.toVerticalSpace(),
            ],
          ),
        ),
      ],
    ));
  }
}
