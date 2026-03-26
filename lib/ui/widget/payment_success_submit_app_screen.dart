// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicate_app/core/config/colors.dart';
import 'package:medicate_app/core/connect_end/view_model/auth_view_model.dart';
import 'package:medicate_app/ui/dashboard/reminder/payment_status_string.dart';
import 'package:medicate_app/ui/widget/button.dart';
import 'package:stacked/stacked.dart';

import 'text.dart';

class PaymentSuccessSubmitAppScreen extends StatelessWidget {
  const PaymentSuccessSubmitAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
      viewModelBuilder: () => AuthViewModel(),
      onViewModelReady: (model) {},
      disposeViewModel: false,
      onDispose: (viewModel) {},
      builder: (_, AuthViewModel model, _) {
        return Scaffold(
          backgroundColor: AppColors.white,
          body: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(10.w),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.app_green.withOpacity(.09),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(12.0.w),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.app_green,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.check,
                          size: 30.30.sp,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 25.30.h),
                  TextView(
                    text: 'Payment Successful!',
                    textStyle: TextStyle(
                      fontFamily: 'GoogleSans',
                      fontSize: 20.2.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: 23.30.h),
                  TextView(
                    text: PaymentStatusString.successfulHmo,
                    textAlign: TextAlign.center,
                    textStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 15.8.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.success,
                    ),
                  ),
                  SizedBox(height: 30.h),
                  ButtonWidget(
                    border: 100.r,
                    fontSize: 14.sp,
                    buttonColor: AppColors.primary,
                    buttonText: 'Submit Application',
                    color: AppColors.white,
                    buttonBorderColor: AppColors.transparent,
                    isLoading: model.isLoading,
                    onPressed: () {
                      model.submitApplication(
                        context,
                        applicationId:
                            model.session.applicationIdIndividualRuby,
                      );
                    },
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
