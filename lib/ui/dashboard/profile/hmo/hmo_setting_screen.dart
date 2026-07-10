import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/app_assets/image.dart';
import '../../../../core/config/colors.dart';
import '../../../../core/connect_end/view_model/hmo_view_model.dart';
import '../../../../core/core_folder/app/app.locator.dart';
import '../../../../core/core_folder/app/app.router.dart';
import '../../../../main.dart';
import '../../../widget/button.dart';
import '../../../widget/text.dart';

class HMOSettingScreen extends StatelessWidget {
  const HMOSettingScreen({super.key});

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
              text: 'Settings',
              textStyle: TextStyle(
                fontFamily: 'GoogleSans',
                fontSize: 17.2.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.black,
              ),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 20.w, horizontal: 16.20.w),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  TextView(
                    text: 'ACCOUNT SECURITY',
                    textStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.infoGrey,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  profileContainer(
                    icon: AppImage.key,
                    text: 'Login & Security',
                    topLeft: 12,
                    topRight: 12,
                    onTap: () =>
                        navigate.navigateTo(Routes.pharmacyResetPinPadScreen),
                  ),
                  SizedBox(height: 1.0.h),
                  profileContainer(
                    icon: AppImage.fa,
                    text: '2FA',
                    bottomLeft: 12,
                    bottomRight: 12,
                    onTap: () =>
                        navigate.navigateTo(Routes.hMOTwoFactorAuthScreen),
                  ),
                  SizedBox(height: 30.h),
                  TextView(
                    text: 'BANK INFORMATION',
                    textStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.infoGrey,
                    ),
                  ),
                  SizedBox(height: 20.0.h),
                  profileContainer(
                    icon: AppImage.bank,
                    text: 'Bank Accounts',
                    topLeft: 12,
                    topRight: 12,
                    bottomLeft: 12,
                    bottomRight: 12,
                    // onTap: () => navigate.navigateTo(Routes.walletScreen),
                  ),
                  SizedBox(height: 30.h),
                  TextView(
                    text: 'WALLET MANAGEMENT',
                    textStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.infoGrey,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  profileContainer(
                    icon: AppImage.users,
                    text: 'Wallet',
                    topLeft: 12,
                    topRight: 12,
                    bottomLeft: 12,
                    bottomRight: 12,
                    onTap: () => navigate.navigateTo(Routes.walletScreen),
                  ),
                  SizedBox(height: 30.0.h),
                  TextView(
                    text: 'PLAN MANAGEMENT',
                    textStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.infoGrey,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  profileContainer(
                    icon: AppImage.med,
                    text: 'Plan Tiers',
                    topLeft: 12,
                    topRight: 12,
                    bottomLeft: 12,
                    bottomRight: 12,
                    onTap: () => navigate.navigateTo(
                      Routes.hmoPlanTiersManagementScreen,
                    ),
                  ),
                  SizedBox(height: 30.0.h),

                  TextView(
                    text: 'USER MANAGEMENT',
                    textStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.infoGrey,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  profileContainer(
                    icon: AppImage.users,
                    text: 'Users',
                    topLeft: 12,
                    topRight: 12,
                    onTap: () => navigate.navigateTo(Routes.hMOUsersScreen),
                  ),
                  SizedBox(height: 1.0.h),
                  profileContainer(
                    icon: AppImage.role,
                    bottomLeft: 12,
                    bottomRight: 12,
                    text: 'Roles and Permissions',
                    onTap: () =>
                        navigate.navigateTo(Routes.hMORolesAndPermissionScreen),
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  GestureDetector profileContainer({
    String? icon,
    String? text,
    double topLeft = 0,
    double topRight = 0,
    double bottomLeft = 0,
    double bottomRight = 0,
    Function()? onTap,
  }) => GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(topLeft.r),
          topRight: Radius.circular(topRight.r),
          bottomLeft: Radius.circular(bottomLeft.r),
          bottomRight: Radius.circular(bottomRight.r),
        ),
      ),
      child: Row(
        children: [
          Container(
            height: 42.0.h,
            width: 42.0.w,
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: AppColors.primaryLight.withValues(alpha: .1),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: SvgPicture.asset(icon!, height: 20.2.h, width: 20.2.w),
          ),
          SizedBox(width: 20.w),
          TextView(
            text: text ?? '',
            textStyle: TextStyle(
              fontFamily: 'Arial',
              fontSize: 16.2.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.black,
            ),
          ),
          Spacer(),
          SvgPicture.asset(AppImage.arrow_forward, color: AppColors.infoGrey),
        ],
      ),
    ),
  );
}
