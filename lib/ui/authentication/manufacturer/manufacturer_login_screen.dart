import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';
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

class ManufacturerLoginScreen extends StatefulWidget {
  const ManufacturerLoginScreen({super.key});

  @override
  State<ManufacturerLoginScreen> createState() => _ManufacturerLoginScreenState();
}

class _ManufacturerLoginScreenState extends State<ManufacturerLoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController phoneController = TextEditingController();

  bool isPhone = false;
  bool isPhoneValid = false;

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
      body: ViewModelBuilder<ManufacturerViewModel>.reactive(
        viewModelBuilder: () => ManufacturerViewModel(),
        onViewModelReady: (model) {},
        disposeViewModel: false,
        builder: (_, ManufacturerViewModel model, _) {
          return SingleChildScrollView(
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
                    text: 'Login',
                    textStyle: TextStyle(
                      fontFamily: 'GoogleSans',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
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
                  SizedBox(height: 16.h),
          
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      children: [
                        const TextSpan(text: "Don’t have a Medicate account? "),
                        TextSpan(
                          text: "Sign Up",
                          style: TextStyle(
                            color: AppColors.primary,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 150.h),
                  ButtonWidget(
                    border: 100.r,
                    buttonColor: !isPassed(isPhone: isPhone)
                        ? AppColors.buttonGrey1
                        : AppColors.primary,
                    buttonText: 'Log In',
                    color: AppColors.white,
                    buttonBorderColor: AppColors.transparent,
                    onPressed: !isPassed(isPhone: isPhone)
                        ? () {}
                        : () {
                            if (formKey.currentState!.validate()) {
                              navigate.navigateTo(
                                Routes.manufacturerWelcomeScreen,
                                arguments: ManufacturerWelcomeScreenArguments(
                                  phone: '+234${phoneController.text}',
                                ),
                              );
                            }
                          },
                  ),
                  SizedBox(height: 30.h),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(color: AppColors.buttonGrey1, thickness: 1),
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
                        child: Divider(color: AppColors.buttonGrey1, thickness: 1),
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
                          const TextSpan(text: "Don’t have an account? "),
                          TextSpan(
                            text: " Sign up",
                            style: TextStyle(
                              color: AppColors.primary,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                            ..onTap = () =>
                                navigate.navigateTo(Routes.manufacturerSignUpScreen),
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
        }
      ),
    );
  }

  bool isPassed({required bool isPhone}) {
    if (isPhone == true) {
      return true;
    }
    return false;
  }
}
