import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/app_assets/image.dart';
import '../../../../core/config/colors.dart';
import '../../../../core/connect_end/view_model/pharm_auth_view_model.dart';
import '../../../../core/core_folder/app/app.locator.dart';
import '../../../widget/button.dart';
import '../../../widget/text.dart';
import '../../../widget/text_form_widget.dart';

class RolesAndPermissionScreen extends StatelessWidget {
  const RolesAndPermissionScreen({super.key});

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
              text: 'Roles & Permissions',
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
            padding: EdgeInsets.symmetric(vertical: 20.w, horizontal: 16.w),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  // margin:
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(
                      vertical: !model.onTapToAddRole! ? 120.w : 20.w,
                    ),
                    child: !model.onTapToAddRole!
                        ? Column(
                            children: [
                              SvgPicture.asset(AppImage.no_user_data),
                              SizedBox(height: 20.h),
                              TextView(
                                text: 'Add a Role',
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
                                onTap: () async {
                                  model.modalBottomSheetMenuAddRole(
                                    context: context,
                                  );
                                  await Future.delayed(Duration(seconds: 2));
                                  model.onTapToAddRole = true;
                                  model.notifyListeners();
                                },
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
                          )
                        : Padding(
                            padding: const EdgeInsets.all(22.0),
                            child: Column(
                              children: [
                                TextFormWidget(
                                  borderColor: AppColors.f1,
                                  borderTopLeft: 10.r,
                                  borderTopRight: 10.r,
                                  borderBottomLeft: 10.r,
                                  borderBottomRight: 10.r,
                                  label: 'Search',
                                  labelStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Arial',
                                    fontSize: 14.sp,
                                    color: AppColors.infoGrey,
                                  ),
                                  fillColor: AppColors.transparent,
                                  isFilled: true,
                                  prefixWidget: Padding(
                                    padding: EdgeInsets.all(11.6.w),
                                    child: SvgPicture.asset(
                                      AppImage.search,
                                      height: 20.h,
                                      width: 20.w,
                                    ),
                                  ),
                                  onChange: (p0) {},
                                ),
                                SizedBox(height: 20.h),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 180.w,
                                              child: TextView(
                                                text: 'Inventory Management',
                                                maxLines: 1,
                                                textOverflow:
                                                    TextOverflow.ellipsis,
                                                textStyle: TextStyle(
                                                  fontFamily: 'GoogleSans',
                                                  fontSize: 14.2.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColors.reminder,
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 3.10.h),
                                            SizedBox(
                                              width: 150.w,
                                              child: TextView(
                                                text:
                                                    'Responsible for managing and overseeing drug inventories.',
                                                maxLines: 4,
                                                textOverflow:
                                                    TextOverflow.ellipsis,
                                                textStyle: TextStyle(
                                                  fontFamily: 'Arial',
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.reminder,
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 2.10.h),
                                            TextView(
                                              text: 'Edit',
                                              textStyle: TextStyle(
                                                fontFamily: 'Arial',
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.primary,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Spacer(),
                                        GestureDetector(
                                          onTap: () => model
                                              .showRemoveUserDialog(context),
                                          child: SvgPicture.asset(
                                            AppImage.delete,
                                            color: AppColors.red,
                                          ),
                                        ),
                                        SizedBox(width: 14.80.w),

                                        SvgPicture.asset(
                                          AppImage.arrow_forward,
                                          color: AppColors.infoGrey,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10.h),
                                    Divider(color: AppColors.f1),
                                    SizedBox(height: 10.h),
                                  ],
                                ),
                              ],
                            ),
                          ),
                  ),
                ),
                SizedBox(height: model.onTapToAddUser! ? 70.h : 0.h),
                model.onTapToAddUser!
                    ? ButtonWidget(
                        border: 100.r,
                        buttonColor: AppColors.primary,
                        buttonText: 'Add User',
                        fontSize: 16.8.sp,
                        color: AppColors.white,
                        // isLoading: _isLoading,
                        buttonBorderColor: AppColors.transparent,
                        onPressed: () {},
                      )
                    : SizedBox.shrink(),
                SizedBox(height: model.onTapToAddUser! ? 20.h : 0.h),
              ],
            ),
          ),
        );
      },
    );
  }
}
