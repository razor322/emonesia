// ignore_for_file: prefer_const_constructors

import 'package:emonesia/components/app/custom_scaffold.dart';
import 'package:emonesia/components/card/custom_button.dart';
import 'package:emonesia/components/custom_closable_searchbar.dart';
import 'package:emonesia/components/dialog/dialog_date_picker.dart';

import 'package:emonesia/resources/constants/app_constants.dart';
import 'package:emonesia/resources/constants/asset_constants.dart';
import 'package:emonesia/styles/app_sizes.dart';
import 'package:emonesia/styles/text_styles.dart';
import 'package:emonesia/utils/extensions/double_extension.dart';
import 'package:emonesia/utils/extensions/string_extension.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<DateTime?> _dates = [];

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        child: Positioned.fill(
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
                  style:
                      TextStyles.regularMontserratFont(fontSize: AppSizes.s16),
                ),
                AppSizes.s40.toVerticalSpace(),
                ClosableSearchBar(
                  controller: TextEditingController(),
                  hintText: AppConstants.HINT_SEARCH,
                  onPress: () {
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
                  icon: Icon(Icons.calendar_month),
                ),
                AppSizes.s24.toVerticalSpace(),
                CustomPrimaryButton(
                  onPressed: () {},
                  label: AppConstants.ACTION_SEARCH,
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
