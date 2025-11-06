import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/app_assets/image.dart';
import '../../../../core/config/colors.dart';
import '../../../../core/connect_end/view_model/pharm_auth_view_model.dart';
import '../../../../core/core_folder/app/app.locator.dart';
import '../../../widget/button.dart';
import '../../../widget/text.dart';

class PharmacySettingScreen extends StatelessWidget {
  const PharmacySettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PharmViewModel>.reactive(
      viewModelBuilder: () => locator<PharmViewModel>(),
      onViewModelReady: (model) {},
      disposeViewModel: false,
      builder: (_, PharmViewModel model, __) {
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
                    // onTap: () => navigate.navigateTo(Routes.profileInfoScreen),
                  ),
                  SizedBox(height: 1.0.h),
                  profileContainer(
                    icon: AppImage.fa,
                    text: '2FA',
                    bottomLeft: 12,
                    bottomRight: 12,
                    // onTap: () => navigate.navigateTo(Routes.resetPinPadScreen),
                  ),
                  SizedBox(height: 30.h),
                  TextView(
                    text: 'USER MANAGEMENT',
                    textStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.infoGrey,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(height: 20.h),
                  profileContainer(
                    icon: AppImage.users,
                    text: 'Users',
                    topLeft: 12,
                    topRight: 12,
                    // onTap: () => navigate.navigateTo(Routes.profileInfoScreen),
                  ),
                  SizedBox(height: 1.0.h),
                  profileContainer(
                    icon: AppImage.role,
                    bottomLeft: 12,
                    bottomRight: 12,
                    text: 'Roles and Permissions',
                    // onTap: () => navigate.navigateTo(Routes.resetPinPadScreen),
                  ),
                  SizedBox(height: 30.h),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  profileContainer({
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
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: AppColors.primaryLight.withOpacity(.1),
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
