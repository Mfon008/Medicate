// ignore_for_file: must_be_immutable

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import '../../../core/app_assets/app_validation.dart';
import '../../../core/app_assets/image.dart';
import '../../../core/config/colors.dart';
import '../../../core/connect_end/view_model/manufacturer_view_model.dart';
import '../../../core/core_folder/app/app.router.dart';
import '../../../main.dart';
import '../../widget/button.dart';
import '../../widget/text.dart';
import '../../widget/text_form_widget.dart';

class ManufacturerSignUpScreen extends StatefulWidget {
  const ManufacturerSignUpScreen({
    super.key,
  });

  @override
  State<ManufacturerSignUpScreen> createState() =>
      _ManufacturerSignUpScreenState();
}

class _ManufacturerSignUpScreenState
    extends State<ManufacturerSignUpScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController phoneController = TextEditingController();
  TextEditingController registrationNumberController = TextEditingController();
  TextEditingController businessAddressController = TextEditingController();
  TextEditingController manufacturerNameController = TextEditingController();

  bool isChecked = false;
  bool isPhone = false;
  bool isPhoneValid = false;
  bool isName = false;

  @override
  Widget build(BuildContext context) {
    bool isTablet(BuildContext context) =>
        MediaQuery.of(context).size.shortestSide >= 600;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: ViewModelBuilder<ManufacturerViewModel>.reactive(
        viewModelBuilder: () => ManufacturerViewModel(),
        onViewModelReady: (model) {},
        disposeViewModel: false,
        builder: (_, ManufacturerViewModel model, _) {
          return SingleChildScrollView(
            padding: EdgeInsetsGeometry.symmetric(
              vertical: 60.w,
              horizontal: 16.w,
            ),
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
                  SizedBox(height: 28.0.h),
                  TextView(
                    text: 'Welcome to Medicatet',
                    textStyle: TextStyle(
                      fontFamily: 'GoogleSans',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: 4.10.h),
                  TextView(
                    text:
                        'Manage your catalog, fulfil orders and monitor your wallet from one place.',
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
                          fontSize: 16.60.sp,
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
                            fontSize: 16.sp,
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
                        padding: EdgeInsets.all(13.8.w),
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
                            label: 'Best number to reach you?',
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Arial',
                              fontSize: 14.sp,
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
                              final result = AppValidator.validatePhone()(
                                value,
                              );
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
                  SizedBox(height: 16.h),
                  TextFormWidget(
                    hint: 'Distributor/Manufacturer name',
                    borderColor: AppColors.transparent,
                    borderTopLeft: 10.r,
                    borderTopRight: 10.r,
                    borderBottomLeft: 10.r,
                    borderBottomRight: 10.r,
                    label: 'Enter name',
                    hintSize: isTablet(context) ? 6.82.sp : 16.60.sp,
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Arial',
                      fontSize: 14.sp,
                      color: AppColors.infoGrey,
                    ),
                    fillColor: AppColors.grey,
                    isFilled: true,
                    controller: manufacturerNameController,
                    validator: AppValidator.validateString(),
                  ),
                  SizedBox(height: 16.h),
                  TextFormWidget(
                    hint: 'Registration number',
                    borderColor: AppColors.transparent,
                    borderTopLeft: 10.r,
                    borderTopRight: 10.r,
                    borderBottomLeft: 10.r,
                    borderBottomRight: 10.r,
                    label: 'Enter registration number',
                    hintSize: isTablet(context) ? 6.82.sp : 16.60.sp,
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Arial',
                      fontSize: 14.sp,
                      color: AppColors.infoGrey,
                    ),
                    fillColor: AppColors.grey,
                    isFilled: true,
                    controller: registrationNumberController,
                    validator: AppValidator.validateString(),
                  ),
                  SizedBox(height: 16.h),
                  TextFormWidget(
                    hint: 'Business address',
                    borderColor: AppColors.transparent,
                    borderTopLeft: 10.r,
                    borderTopRight: 10.r,
                    borderBottomLeft: 10.r,
                    borderBottomRight: 10.r,
                    label: 'Enter business address',
                    hintSize: isTablet(context) ? 6.82.sp : 16.60.sp,
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Arial',
                      fontSize: 14.sp,
                      color: AppColors.infoGrey,
                    ),
                    fillColor: AppColors.grey,
                    isFilled: true,
                    controller: businessAddressController,
                    validator: AppValidator.validateString(),
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Transform.scale(
                        scale: isTablet(context) ? 1.5 : 1.1,
                        child: Checkbox(
                          value: isChecked,
                          onChanged: (value) {
                            setState(() {
                              isChecked = value ?? false;
                            });
                          },
                          activeColor: AppColors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          visualDensity: VisualDensity
                              .compact, // 👈 reduces internal padding
                        ),
                      ), // 👈 small spacing you control
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            children: [
                              const TextSpan(text: "I agree to the "),
                              TextSpan(
                                text: "Terms of Use",
                                style: TextStyle(
                                  color: AppColors.primary,
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {},
                              ),
                              const TextSpan(text: " and "),
                              TextSpan(
                                text: "Privacy Policy",
                                style: TextStyle(
                                  color: AppColors.primary,
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {},
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50.h),
                  ButtonWidget(
                    border: 100.r,
                    buttonColor:
                        !isPassed(isPhone: isPhone, isChecked: isChecked)
                        ? AppColors.buttonGrey1
                        : AppColors.primary,
                    buttonText: 'Sign Up',
                    color: AppColors.white,
                    // isLoading: model.isLoading,
                    buttonBorderColor: AppColors.transparent,
                    onPressed:  () {}
                        
                  ),
                  SizedBox(height: 30.h),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: AppColors.buttonGrey1,
                          thickness: 1,
                        ),
                      ),
                      SizedBox(width: 20.w),
                      TextView(
                        text: 'Or continue with',
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Arial',
                          fontSize: 14.2.sp,
                          color: AppColors.fineGrey,
                        ),
                      ),
                      SizedBox(width: 20.w),
                      Expanded(
                        child: Divider(
                          color: AppColors.buttonGrey1,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.30.h),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2,
                          padding: EdgeInsets.symmetric(vertical: 15.0.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32.r),
                            border: Border.all(color: AppColors.buttonGrey1),
                          ),
                          child: SvgPicture.asset(
                            AppImage.google,
                            width: 22.w,
                            height: 22.h,
                          ),
                        ),
                      ),
                      SizedBox(width: 20.w),
                      Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2,
                          padding: EdgeInsets.symmetric(vertical: 15.0.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32.r),
                            border: Border.all(color: AppColors.buttonGrey1),
                          ),
                          child: SvgPicture.asset(
                            AppImage.facebook,
                            width: 22.w,
                            height: 22.h,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 17.30.h),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        children: [
                          const TextSpan(text: "Have a Medicate account? "),
                          TextSpan(
                            text: " Sign in",
                            style: TextStyle(
                              color: AppColors.primary,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => navigate.navigateTo(
                                Routes.manufacturerLoginScreen,
                              ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16.30.h),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  bool isPassed({
    required bool isPhone,
    // required bool isName,
    required bool isChecked,
  }) {
    if (isPhone == true && isChecked == true) {
      return true;
    }
    return false;
  }
}
