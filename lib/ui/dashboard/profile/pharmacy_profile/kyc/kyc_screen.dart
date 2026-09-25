import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import '../../../../../core/config/colors.dart';
import '../../../../../core/connect_end/view_model/pharm_auth_view_model.dart';
import '../../../../widget/button.dart';
import '../../../../widget/text.dart';
import 'level_one_card.dart';
import 'level_two_card.dart';

class KycScreen extends StatelessWidget {
  const KycScreen({super.key});

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
            fontWeight: FontWeight.w700,
            color: AppColors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 30.w, horizontal: 20.h),
        child: ViewModelBuilder<PharmViewModel>.reactive(
          viewModelBuilder: () => PharmViewModel(),
          onViewModelReady: (model) {
            WidgetsBinding.instance.addPostFrameCallback((_) async {
              model.getPharmacyKyc(context);
            });
          },
          disposeViewModel: false,
          builder: (_, PharmViewModel model, _) {
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextView(
                              text:
                                  'Level ${model.getPharmacyKycResponseModel?.data?.currentLevel ?? ''} of 3',
                              textStyle: TextStyle(
                                fontSize: 15.06.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.reminder1,
                              ),
                            ),
                            TextView(
                              text:
                                  '${model.getPharmacyKycResponseModel?.data?.completionPercentage ?? ''}% Complete',
                              textStyle: TextStyle(
                                fontSize: 14.90.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.reminder1,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.h),
                        model.getPharmacyKycResponseModel != null
                            ? ClipRRect(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(5.0),
                                ),
                                child: LinearProgressIndicator(
                                  minHeight: 4.0, // Adjust height as needed
                                  value:
                                      model
                                          .getPharmacyKycResponseModel!
                                          .data!
                                          .currentLevel! /
                                      2,
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
