// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medicate_app/core/app_assets/image.dart';
import 'package:medicate_app/core/config/colors.dart';
import 'package:medicate_app/ui/dashboard/reminder/payment_status_string.dart';

import '../../widget/button.dart';
import '../../widget/text.dart';

class PaymentStatusScreen extends StatelessWidget {
  PaymentStatusScreen({super.key, required this.isSuccessful});
  bool isSuccessful = false;

  @override
  Widget build(BuildContext context) {
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
                  color: !isSuccessful
                      ? AppColors.red.withOpacity(.09)
                      : AppColors.app_green.withOpacity(.09),
                ),
                child: Container(
                  padding: EdgeInsets.all(12.0.w),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: !isSuccessful ? AppColors.red : AppColors.app_green,
                  ),
                  child: Center(
                    child: !isSuccessful
                        ? SvgPicture.asset(
                            AppImage.cancel,
                            color: AppColors.white,
                          )
                        : Icon(
                            Icons.check,
                            size: 30.30.sp,
                            color: AppColors.white,
                          ),
                  ),
                ),
              ),
              SizedBox(height: 25.30.h),
              TextView(
                text: !isSuccessful ? 'Payment Failed!' : 'Payment Successful!',
                textStyle: TextStyle(
                  fontFamily: 'GoogleSans',
                  fontSize: 20.2.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),
              SizedBox(height: 23.30.h),
              TextView(
                text: !isSuccessful
                    ? PaymentStatusString.failed
                    : PaymentStatusString.successful,
                textAlign: TextAlign.center,
                textStyle: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 15.8.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.success,
                ),
              ),
              SizedBox(height: 30.h),
              !isSuccessful
                  ? Column(
                      children: [
                        ButtonWidget(
                          border: 100.r,
                          fontSize: 14.sp,
                          buttonColor: AppColors.primary,
                          buttonText: 'Continue',
                          color: AppColors.white,
                          buttonBorderColor: AppColors.transparent,
                          onPressed: () {},
                        ),
                        SizedBox(height: 20.h),
                        ButtonWidget(
                          border: 100.r,
                          fontSize: 14.sp,
                          buttonColor: AppColors.white,
                          buttonText: 'Go Back',
                          color: AppColors.primary,
                          buttonBorderColor: AppColors.primary,
                          onPressed: () {},
                        ),
                      ],
                    )
                  : ButtonWidget(
                      border: 100.r,
                      fontSize: 14.sp,
                      buttonColor: AppColors.primary,
                      buttonText: 'Continue',
                      color: AppColors.white,
                      buttonBorderColor: AppColors.transparent,
                      onPressed: () {},
                    ),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}
