// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicate_app/ui/dashboard/profile/manufacture/kyc/level_one_card.dart';
import 'package:medicate_app/ui/dashboard/profile/manufacture/kyc/level_three_card.dart';
import 'package:stacked/stacked.dart';

import '../../../../../core/config/colors.dart';
import '../../../../../core/connect_end/view_model/manufacturer_view_model.dart';
import '../../../../../core/core_folder/app/app.locator.dart';
import '../../../../widget/button.dart';
import '../../../../widget/text.dart';
import 'level_two_card.dart';

class DistributorKycScreen extends StatefulWidget {
  const DistributorKycScreen({super.key});

  @override
  State<DistributorKycScreen> createState() => _DistributorKycScreenState();
}

class _DistributorKycScreenState extends State<DistributorKycScreen> {
  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dashboard,
      appBar: AppBar(
        backgroundColor: AppColors.appWhite,
        surfaceTintColor: Colors.transparent, // removes Material3 tint
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.all(14.w),
          child: GlobalNavigator(),
        ),
        title: TextView(
          text: 'KYC',
          textStyle: TextStyle(
            fontSize: 17.2.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 30.w, horizontal: 20.h),
        child: ViewModelBuilder<ManufacturerViewModel>.reactive(
          viewModelBuilder: () => locator<ManufacturerViewModel>(),
          onViewModelReady: (model) {
            WidgetsBinding.instance.addPostFrameCallback((_) async {
              model.getManAndDistributorKyc(context);
            });
          },
          disposeViewModel: false,
          builder: (_, ManufacturerViewModel model, _) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      vertical: 22.w,
                      horizontal: 20.w,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: TextView(
                            text: 'View Levels',
                            textStyle: TextStyle(
                              fontSize: 15.6.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primary,
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.primary,
                              decorationStyle: TextDecorationStyle.solid,
                              decorationThickness: .7,
                            ),
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextView(
                              text:
                                  'Level ${model.getDistributorKycResponseModel?.data?.currentLevel} of 3',
                              textStyle: TextStyle(
                                fontSize: 15.06.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.reminder1,
                              ),
                            ),
                            TextView(
                              text:
                                  '${model.getDistributorKycResponseModel?.data?.completionPercentage}% Complete',
                              textStyle: TextStyle(
                                fontSize: 14.90.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.reminder1,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.h),
                        model.getDistributorKycResponseModel != null
                            ? ClipRRect(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(5.0),
                                ),
                                child: LinearProgressIndicator(
                                  minHeight: 4.0, // Adjust height as needed
                                  value:
                                      model
                                          .getDistributorKycResponseModel!
                                          .data!
                                          .currentLevel! /
                                      3,
                                  color:
                                      AppColors.primary, // Progress bar color
                                  backgroundColor: Colors
                                      .grey[300], // Background track color
                                ),
                              )
                            : SizedBox.shrink(),
                        SizedBox(height: 17.0.h),
                        LevelOneCard(model: model),
                        SizedBox(height: 14.0.h),
                        LevelTwoCard(),
                        SizedBox(height: 14.0.h),
                        LevelThreeCard(model: model),
                        SizedBox(height: 6.0.h),
                      ],
                    ),
                  ),

                  SizedBox(height: 50.h),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
