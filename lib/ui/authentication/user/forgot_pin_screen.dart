// ignore_for_file: must_be_immutable
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicate_app/core/core_folder/app/app.router.dart';
import 'package:medicate_app/main.dart';
import '../../../core/app_assets/app_validation.dart';
import '../../../core/app_assets/image.dart';
import '../../../core/config/colors.dart';
import '../../widget/button.dart';
import '../../widget/text.dart';
import '../../widget/text_form_widget.dart';

class ForgotPinScreen extends StatefulWidget {
  const ForgotPinScreen({super.key});

  @override
  State<ForgotPinScreen> createState() => _ForgotPinScreenState();
}

class _ForgotPinScreenState extends State<ForgotPinScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController phoneController = TextEditingController();

  bool isPhone = false;

  bool isPhoneValid = false;

  bool isPassed({required bool isPhone}) {
    if (isPhone == true) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        padding: EdgeInsetsGeometry.symmetric(vertical: 60.w, horizontal: 16.w),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                text: 'Forgot PIN?',
                textStyle: TextStyle(
                  fontFamily: 'GoogleSans',
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.black,
                ),
              ),
              SizedBox(height: 10.h),
              TextView(
                text:
                    'Enter the phone number associated with your account to get a PIN reset OTP.',
                textStyle: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 15.2.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                ),
              ),
              SizedBox(height: 24.0.h),

              Stack(
                clipBehavior: Clip.none,
                children: [
                  TextView(
                    text: 'Phone Number',
                    textStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                    ),
                  ),

                  Positioned(
                    right: -12.10,
                    child: TextView(
                      text: '*',
                      textStyle: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.red,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      color: AppColors.grey,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.r),
                        topRight: Radius.circular(0.r),
                        bottomLeft: Radius.circular(10.r),
                        bottomRight: Radius.circular(0.r),
                      ),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          AppImage.nigeria,
                          width: 22.w,
                          height: 22.h,
                        ),
                        SizedBox(width: 4.w),
                        TextView(
                          text: '+234',
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Arial',
                            fontSize: 14.2.sp,
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 2.w),
                  Expanded(
                    child: Container(
                      margin: isPhoneValid
                          ? EdgeInsets.only(top: 20.w)
                          : EdgeInsets.zero, // Add margin if invalid

                      child: TextFormWidget(
                        hint: null,
                        borderColor: AppColors.transparent,
                        borderTopLeft: 0,
                        borderTopRight: 10,
                        borderBottomLeft: 0,
                        borderBottomRight: 10,
                        label: 'Enter your number',

                        labelStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Arial',
                          fontSize: 14.2.sp,
                          color: AppColors.infoGrey,
                        ),
                        fillColor: AppColors.grey,
                        isFilled: true,
                        controller: phoneController,
                        onChange: (p0) {
                          if (p0.isEmpty) {
                            isPhone = false;
                          } else {
                            isPhone = true;
                          }
                          setState(() {});
                        },
                        validator: (value) {
                          final result = AppValidator.validatePhone()(value);
                          if (result != null) {
                            isPhoneValid = true;
                          } else {
                            isPhoneValid = false;
                          }
                          setState(() {});
                          return result;
                        },
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 350.h),
              ButtonWidget(
                border: 100.r,
                buttonColor: !isPassed(isPhone: isPhone)
                    ? AppColors.buttonGrey1
                    : AppColors.primary,
                buttonText: 'Continue',
                color: AppColors.white,
                buttonBorderColor: AppColors.transparent,
                onPressed: !isPassed(isPhone: isPhone)
                    ? () {}
                    : () {
                        if (formKey.currentState!.validate()) {
                          navigate.navigateTo(Routes.resetPinScreen);
                        }
                      },
              ),
              SizedBox(height: 30.h),
              Center(
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    children: [
                      const TextSpan(text: "Don’t have an account? "),
                      TextSpan(
                        text: " Sign in",
                        style: TextStyle(
                          color: AppColors.primary,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.30.h),
            ],
          ),
        ),
      ),
    );
  }
}
