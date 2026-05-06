// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pinput/pinput.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/app_assets/app_validation.dart';
import '../../../../core/app_assets/image.dart';
import '../../../../core/config/colors.dart';
import '../../../../core/connect_end/view_model/hmo_view_model.dart';
import '../../../../core/core_folder/app/app.locator.dart';
import '../../../../core/core_folder/app/app.router.dart';
import '../../../../main.dart';
import '../../../widget/button.dart';
import '../../../widget/text.dart';

class HmoTwoFactorAuthVerificationFirstScreen extends StatefulWidget {
  HmoTwoFactorAuthVerificationFirstScreen({super.key});
  String? phone;
  String? resetToken;

  @override
  State<HmoTwoFactorAuthVerificationFirstScreen> createState() =>
      _HmoTwoFactorAuthVerificationFirstScreenState();
}

class _HmoTwoFactorAuthVerificationFirstScreenState
    extends State<HmoTwoFactorAuthVerificationFirstScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isPhoneValid = false;
  String? pinInput;

  final defaultPinTheme = PinTheme(
    width: 50.w,
    height: 50.h,
    margin: EdgeInsets.only(right: 10.w),
    textStyle: const TextStyle(
      fontSize: 20,
      color: Colors.black,
      fontWeight: FontWeight.w500,
    ),
    decoration: BoxDecoration(
      color: AppColors.grey, // light background
      border: Border.all(color: AppColors.transparent),
      borderRadius: BorderRadius.circular(10),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: ViewModelBuilder<HMOViewModel>.reactive(
        viewModelBuilder: () => locator<HMOViewModel>(),
        onViewModelReady: (model) {},
        disposeViewModel: false,
        builder: (_, HMOViewModel model, _) {
          return SingleChildScrollView(
            padding: EdgeInsetsGeometry.symmetric(
              vertical: 60.w,
              horizontal: 16.w,
            ),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GlobalNavigator(),
                      SvgPicture.asset(
                        AppImage.applogoSvg,
                        width: 116.w,
                        height: 28.h,
                      ),
                      SizedBox(height: 30.h, width: 30.w),
                    ],
                  ),
                  SizedBox(height: 26.0.h),
                  TextView(
                    text: 'Two-step verification',
                    textStyle: TextStyle(
                      fontFamily: 'GoogleSans',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  TextView(
                    text: 'Create a 4-digit PIN that you can remember',
                    textStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 15.2.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.greygrey,
                    ),
                  ),
                  SizedBox(height: 24.10.h),
                  Center(
                    child: Pinput(
                      length: 4,
                      obscureText: true,
                      defaultPinTheme: defaultPinTheme,
                      focusedPinTheme: defaultPinTheme.copyWith(
                        decoration: BoxDecoration(
                          color: AppColors.transparent,
                          border: Border.all(
                            color: AppColors.primary,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      submittedPinTheme: defaultPinTheme.copyWith(
                        decoration: BoxDecoration(
                          color: AppColors.transparent,
                          border: Border.all(color: AppColors.primary),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: AppValidator.validateOTP(),
                      onCompleted: (pin) {
                        pinInput = pin;
                        setState(() {});
                      },
                    ),
                  ),

                  SizedBox(height: 370.h),
                  ButtonWidget(
                    border: 100.r,
                    buttonColor: AppColors.primary,
                    buttonText: 'Continue',
                    color: AppColors.white,
                    buttonBorderColor: AppColors.transparent,
                    isLoading: model.isLoading,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        navigate.navigateTo(
                          Routes.hmoTwoFactorAuthVerificationSecondScreen,
                        );
                      }
                    },
                  ),
                  SizedBox(height: 20.30.h),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
