import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medicate_app/core/app_assets/image.dart';
import 'package:stacked/stacked.dart';
import '../../../core/config/colors.dart';
import '../../../core/connect_end/model/resend_otp_entity_model.dart';
import '../../../core/connect_end/view_model/auth_view_model.dart';
import '../../../core/core_folder/app/app.locator.dart';
import '../../../core/core_folder/manager/shared_preference.dart';
import '../../widget/button.dart';
import '../../widget/text.dart';

class ResetPinPadScreen extends StatelessWidget {
  const ResetPinPadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
      viewModelBuilder: () => locator<AuthViewModel>(),
      onViewModelReady: (model) {},
      disposeViewModel: false,
      builder: (_, AuthViewModel model, _) {
        return Scaffold(
          backgroundColor: AppColors.dashboard,
          appBar: AppBar(
            backgroundColor: AppColors.appWhite,
            surfaceTintColor: Colors.transparent, // removes Material3 tint
            elevation: 0,
            leading: Padding(
              padding: EdgeInsets.all(14.w),
              child: GlobalNavigator(),
            ),
            title: TextView(
              text: 'Login & Security',
              textStyle: TextStyle(
                fontSize: 17.2.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.black,
              ),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 30.w, horizontal: 30.h),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 32.w,
                    horizontal: 22.20.w,
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 100.h),
                      SvgPicture.asset(AppImage.padlock),
                      SizedBox(height: 20.h),
                      TextView(
                        text: 'Reset PIN',
                        textStyle: TextStyle(
                          fontFamily: 'GoogleSans',
                          fontSize: 20.20.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      TextView(
                        text:
                            'To reset your PIN, you’ll need to verify with a verification code sent to your phone number',
                        textAlign: TextAlign.center,
                        textStyle: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 16.20.sp,

                          fontWeight: FontWeight.w500,
                          color: AppColors.black,
                        ),
                      ),
                      SizedBox(height: 50.h),
                      GestureDetector(
                        onTap: () => model.forgotPassword(
                          context,
                          forgotPassword: ResendOtpEntityModel(
                            phone: SharedPreferencesService
                                .instance
                                .usersData['user']['phone'],
                          ),
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 12.w,
                            horizontal: 24.w,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            color: AppColors.primary,
                          ),
                          child: TextView(
                            text: 'Send Code',
                            textAlign: TextAlign.center,
                            textStyle: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 16.20.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 50.h),
                    ],
                  ),
                ),

                SizedBox(height: 50.h),
              ],
            ),
          ),
        );
      },
    );
  }
}
