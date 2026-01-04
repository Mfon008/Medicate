// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medicate_app/core/core_folder/app/app.router.dart';
import 'package:medicate_app/main.dart';
import 'package:medicate_app/ui/widget/every_day_card_widget.dart';
import '../../core/app_assets/image.dart';
import '../../core/config/colors.dart';
import '../widget/button.dart';
import '../widget/medicate_enum.dart';
import '../widget/text.dart';

class RoleOnboarding extends StatefulWidget {
  const RoleOnboarding({super.key});

  @override
  State<RoleOnboarding> createState() => _RoleOnboardingState();
}

class _RoleOnboardingState extends State<RoleOnboarding> {
  UserType? selectedUserType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(
            vertical: 60.w,
            horizontal: 12.4.w,
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppImage.applogoSvg,
                    width: 116.w,
                    height: 28.h,
                  ),
                  SizedBox(height: 24.20.h),
                  TextView(
                    text: 'Choose Your Role to Get Started!',
                    textStyle: TextStyle(
                      fontFamily: 'GoogleSans',
                      fontWeight: FontWeight.w700,
                      fontSize: 18.50.sp,
                    ),
                  ),
                  SizedBox(height: 20.0.h),
                  EverydayUserCard(
                    imge: AppImage.everyDayUSer,
                    userType: UserType.everydayUser,
                    selectedUserType: selectedUserType,
                    onTap: (type) {
                      setState(() => selectedUserType = type);
                    },
                    text: 'Everyday User',
                    text2:
                        'Set reminders, order medications, book appointments, track health, and receive wellness tips.',
                  ),
                  SizedBox(height: 12.0.h),
                  EverydayUserCard(
                    imge: AppImage.pharmacist,
                    userType: UserType.pharmacist,
                    selectedUserType: selectedUserType,
                    onTap: (type) {
                      setState(() => selectedUserType = type);
                    },
                    text: 'I Own a Pharmacy',
                    text2:
                        'Buy and sell medications, fulfill orders, and set reminders for customers.',
                  ),
                  SizedBox(height: 12.0.h),
                  EverydayUserCard(
                    imge: AppImage.health_pro,
                    userType: UserType.healthCare,
                    selectedUserType: selectedUserType,
                    onTap: (type) {
                      setState(() => selectedUserType = type);
                    },
                    text: 'Healthcare Provider',
                    text2:
                        'Manage patient medication adherence and appointments, set\nmedication reminders.',
                  ),
                  SizedBox(height: 12.0.h),
                  EverydayUserCard(
                    imge: AppImage.hmo,
                    userType: UserType.hmo,
                    selectedUserType: selectedUserType,
                    onTap: (type) {
                      setState(() => selectedUserType = type);
                    },
                    text: 'HMO',
                    text2:
                        'Manage employee health plans, view usage reports, and ensure access to quality care.',
                  ),
                  SizedBox(height: 70.h),
                  ButtonWidget(
                    border: 100.r,
                    buttonColor: AppColors.primary,
                    buttonText: 'Continue',
                    color: AppColors.white,
                    buttonBorderColor: AppColors.transparent,
                    onPressed: () => navigationFlow(),
                  ),
                  SizedBox(height: 20.h),
                  TextView(
                    text: 'Powered by Infostrategy Technology Limited',
                    textAlign: TextAlign.center,
                    textStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontWeight: FontWeight.w400,
                      fontSize: 10.sp,
                      color: AppColors.infoGrey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void navigationFlow() {
    switch (selectedUserType) {
      case UserType.everydayUser:
        navigate.navigateTo(Routes.signUpScreen);
        break;

      case UserType.pharmacist:
        navigate.navigateTo(Routes.pharmacySignUpScreen);
        break;
      case UserType.healthCare:
      case UserType.hmo:
        navigate.navigateTo(Routes.hMOSignUpScreen);
        break;

      case null:
        throw UnimplementedError();
    }
  }
}
