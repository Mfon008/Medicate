import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';
import 'package:stacked/stacked.dart';
import '../../../core/app_assets/app_validation.dart';
import '../../../core/app_assets/image.dart';
import '../../../core/config/colors.dart';
import '../../../core/connect_end/view_model/manufacturer_view_model.dart';
import '../../../core/core_folder/app/app.locator.dart';
import '../../widget/button.dart';
import '../../widget/text.dart';

class ManufacturerSetupPinScreen extends StatefulWidget {
  const ManufacturerSetupPinScreen({super.key});

  @override
  State<ManufacturerSetupPinScreen> createState() =>
      _ManufacturerSetupPinScreenState();
}

class _ManufacturerSetupPinScreenState extends State<ManufacturerSetupPinScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: ViewModelBuilder<ManufacturerViewModel>.reactive(
        viewModelBuilder: () => locator<ManufacturerViewModel>(),
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
                  SizedBox(height: 26.0.h),
                  TextView(
                    text: 'Set up your pin',
                    textStyle: TextStyle(
                      fontFamily: 'GoogleSans',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: 5.0.h),
                  TextView(
                    text:
                        'This pin will give you access to the app anytime you log in.',
                    textStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 15.2.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: 24.10.h),
                  Center(
                    child: TextView(
                      text: 'Enter PIN',
                      textStyle: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 14.2.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0.h),
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
                    // isLoading: model.isLoading,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        // model.setPin(
                        //   context,
                        //   setPinEntityModel: SetPinEntityModel(pin: pinInput),
                        // );
                      }
                    },
                  ),
                  SizedBox(height: 20.30.h),
                  ButtonWidget(
                    border: 100.r,
                    buttonColor: AppColors.white,
                    buttonText: 'Skip for now',
                    color: AppColors.primary,
                    buttonBorderColor: AppColors.primary,
                    onPressed: () {
                      // if (SharedPreferencesService
                      //             .instance
                      //             .usersData['memberships'][0]['role'] ==
                      //         'OWNER' &&
                      //     SharedPreferencesService
                      //             .instance
                      //             .usersData['memberships'][0]['tenantType'] ==
                      //         'HEALTHCARE_PROVIDER') {
                      //   navigate.navigateTo(Routes.businessProviderDashboard);
                      // } else {
                      //   navigate.navigateTo(
                      //     Routes.specialistsProviderDashboard,
                      //   );
                      // }
                    },
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
}
