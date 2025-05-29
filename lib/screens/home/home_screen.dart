// ignore_for_file: prefer_const_constructors

import 'package:emonesia/components/dialog/dialog_date_picker.dart';
import 'package:emonesia/components/dialog/dialog_date_picker2.dart';
import 'package:emonesia/components/input/custom_boerderless_text_field.dart';
import 'package:emonesia/resources/constants/app_constants.dart';
import 'package:emonesia/resources/constants/asset_constants.dart';
import 'package:emonesia/styles/app_colors.dart';
import 'package:emonesia/styles/app_sizes.dart';
import 'package:emonesia/utils/extensions/double_extension.dart';
import 'package:emonesia/utils/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<DateTime?> _dates = [];

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
        Positioned.fill(
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
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    AppSizes.s10.toVerticalSpace(),
                    Text(
                      AppConstants.LABEL_HOME_SUBHEADER,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    AppSizes.s40.toVerticalSpace(),
                    Row(
                      children: [
                        CustomBorderlessTextField(
                          radius: AppSizes.s60,
                          hintText: AppConstants.HINT_SEARCH,
                          hintSize: AppSizes.s14,
                          hintColor: AppColors.colorGrey,
                        ),
                        AppSizes.s8.toHorizontalSpace(),
                        IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (ctx) {
                                return CustomDateRangePicker(
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
                          style: IconButton.styleFrom(
                            backgroundColor: AppColors.colorPrimary,
                            shape: CircleBorder(),
                            padding: EdgeInsets.all(AppSizes.s13),
                          ),
                          icon: Icon(Icons.calendar_month),
                          color: AppColors.colorWhite,
                          iconSize: AppSizes.s24,
                        ),
                      ],
                    ),
                    AppSizes.s24.toVerticalSpace(),
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.colorPrimary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppSizes.s30),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: AppSizes.s30, vertical: AppSizes.s10),
                        ),
                        child: Text(
                          AppConstants.ACTION_SEARCH,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
