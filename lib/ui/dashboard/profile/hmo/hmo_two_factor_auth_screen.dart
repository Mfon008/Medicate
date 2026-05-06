import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medicate_app/main.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/app_assets/image.dart';
import '../../../../core/config/colors.dart';
import '../../../../core/connect_end/view_model/hmo_view_model.dart';
import '../../../../core/core_folder/app/app.locator.dart';
import '../../../../core/core_folder/app/app.router.dart';
import '../../../widget/button.dart';
import '../../../widget/text.dart';

class HMOTwoFactorAuthScreen extends StatelessWidget {
  const HMOTwoFactorAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HMOViewModel>.reactive(
      viewModelBuilder: () => locator<HMOViewModel>(),
      onViewModelReady: (model) {},
      disposeViewModel: false,
      builder: (_, HMOViewModel model, _) {
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
              text: '2FA',
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
                      SizedBox(height: 40.h),
                      SvgPicture.asset(AppImage.two_fa_ui),
                      SizedBox(height: 20.h),
                      TextView(
                        text: 'Two-step verification',
                        textStyle: TextStyle(
                          fontFamily: 'GoogleSans',
                          fontSize: 20.20.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      TextView(
                        text:
                            'Create a PIN for extra security. Use the PIN to access your account.',
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
                        onTap: () => navigate.navigateTo(
                          Routes.hmoTwoFactorAuthVerificationFirstScreen,
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 12.w,
                            horizontal: 54.w,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            color: AppColors.primary,
                          ),
                          child: TextView(
                            text: 'Turn On',
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
