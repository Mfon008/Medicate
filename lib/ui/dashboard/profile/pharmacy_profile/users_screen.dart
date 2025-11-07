import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medicate_app/core/app_assets/image.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/config/colors.dart';
import '../../../../core/connect_end/view_model/pharm_auth_view_model.dart';
import '../../../../core/core_folder/app/app.locator.dart';
import '../../../widget/button.dart';
import '../../../widget/text.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

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
              text: 'Users',
              textStyle: TextStyle(
                fontFamily: 'GoogleSans',
                fontSize: 17.2.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.black,
              ),
            ),
            centerTitle: true,
          ),
          body: Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 20.w, horizontal: 16.w),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 120.w),
              child: Column(
                children: [
                  SvgPicture.asset(AppImage.no_user_data),
                  SizedBox(height: 20.h),
                  TextView(
                    text: 'No Sub User Added',
                    textStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 15.2.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.reminder,
                    ),
                  ),
                  SizedBox(height: 4.20.h),
                  TextView(
                    text: 'Tap on the plus button to add one',
                    textStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 13.2.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.faintedGrey,
                    ),
                  ),
                  SizedBox(height: 26.0.h),
                  GestureDetector(
                    onTap: () => model.modalBottomSheetMenuAddUser(context:context),
                    child: Container(
                      padding: EdgeInsets.all(8.10.w),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primary,
                      ),
                      child: Icon(
                        Icons.add,
                        color: AppColors.white,
                        size: 24.30.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
