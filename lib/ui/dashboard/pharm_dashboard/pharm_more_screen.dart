// ignore_for_file: deprecated_member_use, must_be_immutable, strict_top_level_inference

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicate_app/core/app_assets/image.dart';
import 'package:medicate_app/core/config/colors.dart';
import 'package:medicate_app/core/core_folder/app/app.locator.dart';
import 'package:medicate_app/core/core_folder/app/app.router.dart';
import 'package:medicate_app/main.dart';
import 'package:stacked/stacked.dart';
import '../../../core/app_assets/app_validation.dart';
import '../../../core/connect_end/view_model/pharm_auth_view_model.dart';
import '../../widget/button.dart';
import '../../widget/text.dart';
import '../../widget/text_form_widget.dart';

class PharmMoreScreen extends StatefulWidget {
  const PharmMoreScreen({super.key});

  @override
  State<PharmMoreScreen> createState() => _PharmMoreScreenState();
}

class _PharmMoreScreenState extends State<PharmMoreScreen> {
  
  List<String> textHistoryList = [
    'Today’s Medication',
    'Good Morning! To keep you on track, here’s your morning medication schedule:',
  ];

  String selectHistory = '';

  GlobalKey<FormState> formKeyValidate = GlobalKey<FormState>();

  TextEditingController monthController = TextEditingController();
  TextEditingController yearController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: ViewModelBuilder<PharmViewModel>.reactive(
        viewModelBuilder: () => locator<PharmViewModel>(),
        onViewModelReady: (model) {
        },
        disposeViewModel: false,
        builder: (_, PharmViewModel model, _) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 50.w, horizontal: 16.20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextView(
                      text: 'More',
                      textStyle: TextStyle(
                        fontSize: 16.2.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.black,
                      ),
                    ),
                    IconButton(
                      onPressed: () => navigate.back(),
                      icon: SvgPicture.asset(AppImage.cancel),
                    ),
                  ],
                ),
                Divider(color: AppColors.f1),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    moreContainer(
                      context,
                      icon: AppImage.settings,
                      text: 'Settings',
                      onTap: () =>
                          navigate.navigateTo(Routes.pharmacySettingScreen),
                    ),
                    SizedBox(width: 20.w),
                    moreContainer(
                      context,
                      icon: AppImage.profile,
                      text: 'Profile',
                      onTap: () =>
                          navigate.navigateTo(Routes.pharmacyProfileScreen),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    moreContainer(
                      context,
                      icon: AppImage.appointment,
                      text: 'Appointment',
                    ),
                    SizedBox(width: 20.w),
                    moreContainer(
                      context,
                      icon: AppImage.cart,
                      text: 'Order History',
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    moreContainer(
                      context,
                      icon: AppImage.timer,
                      text: 'Reminder History',
                    ),
                    SizedBox(width: 20.w),
                    moreContainer(
                      context,
                      icon: AppImage.providers,
                      text: 'Providers',
                    ),
                  ],
                ),
                SizedBox(height: 100.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextView(
                      text: 'History',
                      textStyle: TextStyle(
                        fontSize: 16.2.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _modalBottomSheetMenu(),
                      child: SvgPicture.asset(
                        AppImage.filter,
                        height: 16.20.h,
                        width: 12.22.w,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                TextView(
                  text: 'Today',
                  textStyle: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 14.2.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.infoGrey,
                  ),
                ),
                SizedBox(height: 2.20.h),
                ...textHistoryList.map(
                  (e) => GestureDetector(
                    onTap: () {
                      selectHistory = e;
                      setState(() {});
                    },
                    child: Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 6.10.w),
                      padding: EdgeInsets.symmetric(
                        vertical: 10.w,
                        horizontal: 12.w,
                      ),

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: selectHistory == e
                            ? AppColors.inactive.withOpacity(.3)
                            : AppColors.transparent,
                      ),
                      child: TextView(
                        text: e,
                        maxLines: 1,
                        textOverflow: TextOverflow.ellipsis,
                        textStyle: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 14.2.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Center(
                  child: TextView(
                    text: 'Show all',
                    textStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 14.2.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primary,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Expanded moreContainer(
    context, {
    String? icon,
    String? text,
    Function()? onTap,
  }) => Expanded(
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 34.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: AppColors.dashboard,
        ),
        child: Column(
          children: [
            SvgPicture.asset(
              icon!,
              color: AppColors.primary,
              height: 26.h,
              width: 26.w,
            ),
            SizedBox(height: 12.h),
            TextView(
              text: text ?? '',
              textAlign: TextAlign.center,
              textStyle: TextStyle(
                fontFamily: 'Arial',
                fontSize: 13.2.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
            ),
          ],
        ),
      ),
    ),
  );

  void _modalBottomSheetMenu() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: AppColors.white,
      constraints: BoxConstraints(maxWidth: double.infinity),
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false, // 👈 allows proper layout
          builder: (context, scrollController) {
            return SafeArea(
              child: SingleChildScrollView(
                controller: scrollController, // 👈 critical
                padding: EdgeInsets.symmetric(
                  vertical: 13.20.w,
                  horizontal: 20.w,
                ),
                child: Form(
                  key: formKeyValidate,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // --- your content ---
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(width: 50.w),
                          TextView(
                            text: 'Filter Search',
                            textStyle: TextStyle(
                              fontSize: 16.2.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.black,
                            ),
                          ),
                          IconButton(
                            onPressed: () => navigate.back(),
                            icon: SvgPicture.asset(AppImage.cancel),
                          ),
                        ],
                      ),
                      SizedBox(height: 30.h),

                      // --- Month & Year inputs ---
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            // 👈 use Flexible instead of Expanded
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextView(
                                  text: 'Month',
                                  textStyle: TextStyle(
                                    fontSize: 16.2.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.black,
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                TextFormWidget(
                                  label: 'Month',
                                  borderTopLeft: 10.r,
                                  borderTopRight: 10.r,
                                  borderBottomLeft: 10.r,
                                  borderBottomRight: 10.r,
                                  fillColor: AppColors.dashboard,
                                  isFilled: true,
                                  controller: monthController,
                                  validator: AppValidator.validateString(),
                                  suffixWidget: Padding(
                                    padding: EdgeInsets.all(14.20.w),
                                    child: SvgPicture.asset(
                                      AppImage.arrow_down,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 20.w),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextView(
                                  text: 'Year',
                                  textStyle: TextStyle(
                                    fontSize: 16.2.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.black,
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                TextFormWidget(
                                  label: 'Year',
                                  borderTopLeft: 10.r,
                                  borderTopRight: 10.r,
                                  borderBottomLeft: 10.r,
                                  borderBottomRight: 10.r,
                                  fillColor: AppColors.dashboard,
                                  isFilled: true,
                                  controller: yearController,
                                  validator: AppValidator.validateString(),
                                  suffixWidget: Padding(
                                    padding: EdgeInsets.all(14.20.w),
                                    child: SvgPicture.asset(
                                      AppImage.arrow_down,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),

                      // --- Reset link ---
                      TextView(
                        text: 'Reset filter',
                        textStyle: TextStyle(
                          fontSize: 14.2.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.primary,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.primary,
                        ),
                      ),
                      SizedBox(height: 50.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: ButtonWidget(
                              border: 100.r,
                              buttonColor: AppColors.dashboard,
                              buttonText: 'Cancel',
                              color: AppColors.black,
                              buttonBorderColor: AppColors.transparent,
                              onPressed: () => navigate.back(),
                            ),
                          ),
                          SizedBox(width: 20.w),
                          Flexible(
                            child: ButtonWidget(
                              border: 100.r,
                              buttonColor: AppColors.primary,
                              buttonText: 'Apply',
                              color: AppColors.white,
                              buttonBorderColor: AppColors.transparent,
                              onPressed: () {
                                // if (formKeyValidate.currentState!.validate()) {
                                //   navigate.navigateTo(Routes.setupPinScreen);
                                // }
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
