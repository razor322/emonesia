// ignore_for_file: prefer_const_constructors, use_super_parameters

import 'package:emonesia/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CustomDateRangePicker extends StatelessWidget {
  final void Function(PickerDateRange?) onSubmit;
  final DateRangePickerController? controller;
  const CustomDateRangePicker(
      {Key? key, required this.onSubmit, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              color: AppColors.colorPrimary,
              child: const Text(
                'Pilih Tanggal',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            SizedBox(
              height: 500,
              child: SfDateRangePicker(
                controller: controller,
                showNavigationArrow: true,
                showTodayButton: true,
                selectionColor: AppColors.colorPrimary,
                rangeSelectionColor: AppColors.colorPrimary.withOpacity(0.25),
                startRangeSelectionColor: AppColors.colorPrimary,
                endRangeSelectionColor: AppColors.colorPrimary,
                todayHighlightColor: AppColors.colorPrimary,
                selectionTextStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                view: DateRangePickerView.month,
                headerStyle: DateRangePickerHeaderStyle(
                  textAlign: TextAlign.center,
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                yearCellStyle: DateRangePickerYearCellStyle(
                  textStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                  todayTextStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                  ),
                ),
                selectionMode: DateRangePickerSelectionMode.range,
                showActionButtons: true,
                onSubmit: (Object? val) {
                  if (val is PickerDateRange) {
                    onSubmit(val);
                    Navigator.pop(context);
                  }
                },
                onCancel: () => Navigator.pop(context),
                monthCellStyle: DateRangePickerMonthCellStyle(
                  textStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                  todayTextStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                  ),
                ),
                monthViewSettings: DateRangePickerMonthViewSettings(
                  dayFormat: 'EE',
                  viewHeaderStyle: DateRangePickerViewHeaderStyle(
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  showTrailingAndLeadingDates: true,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
