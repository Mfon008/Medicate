// ignore_for_file: must_be_immutable, prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/config/colors.dart';
import '../../../../core/connect_end/view_model/auth_view_model.dart';
import '../../../widget/button.dart';
import '../../../widget/text.dart';
import 'package:medicate_app/core/connect_end/model/get_hmos_plan_response_model/datum.dart';

class ApplicationFormScreen extends StatelessWidget {
  ApplicationFormScreen({
    super.key,
    required this.planTypeName,
    required this.planTeirName,
    required this.planId,
    required this.hmoId,
    required this.data,
  });

  String? planTypeName;
  String? planTeirName;
  String? planId;
  String? hmoId;
  Datum? data;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
      viewModelBuilder: () => AuthViewModel(),
      onViewModelReady: (model) {
        model.checkPlanTypeAndTier(
          context: context,
          model: model,
          planType: planTypeName,
          planTier: planTeirName,
          planId: planId
        );
      },
      disposeViewModel: false,
      onDispose: (viewModel) {},
      builder: (_, AuthViewModel model, _) {
        return Scaffold(
          backgroundColor: AppColors.dashboard,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.white,
            toolbarHeight: 80.0,
            title: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GlobalNavigator(),
                  TextView(
                    text: 'Apply for $planTeirName $planTypeName Basic',
                    textStyle: TextStyle(
                      fontFamily: 'GoogleSans',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.deep,
                    ),
                  ),
                  TextView(
                    text: 'View',
                    textStyle: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: 'Arial',
                      fontWeight: FontWeight.w400,
                      color: AppColors.primary,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 14.50.w, horizontal: 16.w),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 18.0.w,
                    horizontal: 17.6.w,
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: model.setSubscriptionModalFlow(
                    model: model,
                    context: context,
                    planType: planTypeName,
                    planTier: planTeirName,
                    hmoId: hmoId,
                    planId: planId,
                    data: data,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
