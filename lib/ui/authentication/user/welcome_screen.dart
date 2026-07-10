// ignore_for_file: must_be_immutable, use_build_context_synchronously, deprecated_member_use
import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medicate_app/core/connect_end/model/login_entity_model.dart';
import 'package:medicate_app/core/core_folder/app/app.router.dart';
import 'package:medicate_app/core/core_folder/manager/shared_preference.dart';
import 'package:medicate_app/main.dart';
import 'package:pinput/pinput.dart';
import 'package:stacked/stacked.dart';
import '../../../core/app_assets/app_validation.dart';
import '../../../core/app_assets/image.dart';
import '../../../core/config/colors.dart';
import '../../../core/connect_end/view_model/auth_view_model.dart';
import '../../widget/button.dart';
import '../../widget/text.dart';
import '../bio_authentication.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({super.key, this.phone});
  String? phone;

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

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

  String? pinInput;

  Future<bool> willPopControl() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: TextView(
              text: 'Do you want to exit the app',
              textAlign: TextAlign.center,
              fontSize: 18.0.sp,
              color: AppColors.black,
              fontWeight: FontWeight.w400,
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.red, // Text Color
                    ),
                    child: TextView(
                      text: 'No',
                      fontSize: 20.sp,
                      color: AppColors.red,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextButton(
                    onPressed: () => exitApp(),
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.green, // Text Color
                    ),
                    child: TextView(
                      text: 'Yes',
                      fontSize: 20.sp,
                      color: AppColors.green,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        )) ??
        false;
  }

  void exitApp() {
    Future.delayed(const Duration(milliseconds: 1000), () {
      SystemChannels.platform.invokeListMethod('SystemNavigator.pop');
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: willPopControl,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: ViewModelBuilder<AuthViewModel>.reactive(
          viewModelBuilder: () => AuthViewModel(),
          onViewModelReady: (model) {
            WidgetsBinding.instance.addPostFrameCallback((_) async {
              await model.getUserDetails(
                context: context,
                phoneNo: model.formatPhoneNumberForWelcomeScreen(
                  widget.phone ??
                      SharedPreferencesService
                          .instance
                          .usersData['user']['phone'],
                ),
              );
            });
          },
          disposeViewModel: false,
          builder: (_, AuthViewModel model, _) {
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
                        GestureDetector(
                          onTap: () {
                            if (Platform.isAndroid) {
                              SystemNavigator.pop();
                            } else if (Platform.isIOS) {
                              exit(0);
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.all(4.10.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.10.r),
                              border: Border.all(color: AppColors.black),
                            ),
                            child: Icon(
                              Icons.arrow_back_ios_new,
                              size: 14.sp,
                              color: AppColors.black,
                            ),
                          ),
                        ),
                        SvgPicture.asset(
                          AppImage.applogoSvg,
                          width: 116.w,
                          height: 28.h,
                        ),
                        SizedBox(height: 30.h, width: 30.w),
                      ],
                    ),
                    SizedBox(height: 26.0.h),
                    model.getUserDetailsResponseModel != null &&
                            model.getUserDetailsResponseModel!.data!.fullName !=
                                null
                        ? TextView(
                            text:
                                'Welcome back, ${model.getUserDetailsResponseModel?.data?.fullName ?? ''}',
                            textStyle: TextStyle(
                              fontFamily: 'GoogleSans',
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.black,
                            ),
                          )
                        : TextView(
                            text: // ignore: unnecessary_null_comparison
                                SharedPreferencesService
                                        .instance
                                        .usersData['user'] ==
                                    null
                                ? 'Welcome back'
                                : 'Welcome back, ${SharedPreferencesService.instance.usersData['user']['fullName'].toString()}',
                            textStyle: TextStyle(
                              fontFamily: 'GoogleSans',
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.black,
                            ),
                          ),
                    SizedBox(height: 3.70.h),
                    TextView(
                      text: 'Enter your 4 digit pin to continue',
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

                    SizedBox(height: 20.0.h),
                    GestureDetector(
                      onTap: () => navigate.navigateTo(Routes.forgotPinScreen),
                      child: TextView(
                        text: 'Forgot PIN',
                        decoration: TextDecoration.underline,
                        textStyle: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 14.2.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0.h),
                    model.getUserDetailsResponseModel != null &&
                                model
                                        .getUserDetailsResponseModel
                                        ?.data
                                        ?.pinSet ==
                                    true ||
                            SharedPreferencesService
                                    .instance
                                    .usersData['pinSet'] ==
                                true
                        ? Column(
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  bool auth =
                                      await Authentication.authentication();
                                  if (auth) {
                                    model.signIn(
                                      context,
                                      signInEntity: LoginEntityModel(
                                        phone: model
                                            .formatPhoneNumberForWelcomeScreen(
                                              widget.phone ??
                                                  SharedPreferencesService
                                                      .instance
                                                      .usersData['user']['phone'],
                                            ),
                                        pin: SharedPreferencesService
                                            .instance
                                            .pinSet,
                                      ),
                                    );
                                  }
                                },
                                child: Container(
                                  padding: EdgeInsets.all(14.8.w),
                                  decoration: BoxDecoration(
                                    color: AppColors.inactive.withOpacity(.22),
                                    shape: BoxShape.circle,
                                  ),
                                  child: SvgPicture.asset(AppImage.bio),
                                ),
                              ),
                              SizedBox(height: 16.0.h),
                              TextView(
                                text: 'Login with biometric',
                                decoration: TextDecoration.underline,
                                textStyle: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 12.6.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.greygrey1,
                                ),
                              ),
                            ],
                          )
                        : SizedBox.shrink(),

                    SizedBox(height: 260.h),
                    ButtonWidget(
                      border: 100.r,
                      buttonColor: AppColors.primary,
                      buttonText: 'Continue',
                      color: AppColors.white,
                      buttonBorderColor: AppColors.transparent,
                      isLoading: model.isLoading,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          model.signIn(
                            context,
                            signInEntity: LoginEntityModel(
                              phone: model.formatPhoneNumberForWelcomeScreen(
                                widget.phone ??
                                    SharedPreferencesService
                                        .instance
                                        .usersData['user']['phone'],
                              ),
                              pin: pinInput,
                            ),
                          );
                        }
                      },
                    ),
                    SizedBox(height: 20.30.h),
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
                                    navigate.navigateTo(Routes.signUpScreen),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20.30.h),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
