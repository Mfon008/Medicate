import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import '../../../../../core/app_assets/app_validation.dart';
import '../../../../../core/app_assets/image.dart';
import '../../../../../core/config/colors.dart';
import '../../../../../core/connect_end/view_model/pharm_auth_view_model.dart';
import '../../../../../core/core_folder/app/app.locator.dart';
import '../../../../widget/button.dart';
import '../../../../widget/text.dart';
import '../../../../widget/text_form_widget.dart';

class KycScreen extends StatelessWidget {
  const KycScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          text: 'KYC',
          textStyle: TextStyle(
            fontSize: 17.2.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 30.w, horizontal: 20.h),
        child: ViewModelBuilder<PharmViewModel>.reactive(
          viewModelBuilder: () => locator<PharmViewModel>(),
          onViewModelReady: (model) {},
          disposeViewModel: false,
          builder: (_, PharmViewModel model, __) {
            return Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 22.w,
                    horizontal: 24.w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 12.w,
                          horizontal: 22.w,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.fadedyellow,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(AppImage.info),
                            SizedBox(width: 10.w),
                            TextView(
                              text:
                                  'Kindly upload and submit KYC for\nverification to obtain full access to\nplatform features.',
                              textStyle: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 13.2.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),
                      TextFormWidget(
                        hint: 'Means of ID',
                        hintSize: 14,
                        borderColor: AppColors.transparent,
                        borderTopLeft: 10.r,
                        borderTopRight: 10.r,
                        borderBottomLeft: 10.r,
                        borderBottomRight: 10.r,
                        readOnly: true,
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Arial',
                          fontSize: 14.2.sp,
                          color: AppColors.infoGrey,
                        ),
                        fillColor: AppColors.grey,
                        isFilled: true,
                        suffixWidget: Padding(
                          padding: EdgeInsets.all(14.20.w),
                          child: GestureDetector(
                            child: SvgPicture.asset(AppImage.arrow_down),
                          ),
                        ),
                        // controller: nameController,
                        validator: AppValidator.validateString(),
                        onChange: (p0) {
                          // setState(() {});
                        },
                      ),
                      SizedBox(height: 20.h),
                      SizedBox(
                        width: double.infinity,
                        child: DottedBorder(
                          options: RoundedRectDottedBorderOptions(
                            dashPattern: [10, 10],
                            strokeWidth: .94,
                            radius: Radius.circular(10),
                            color: AppColors.primary,
                          ),
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                              vertical: 16.20.w,
                              horizontal: 22.0.w,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: AppColors.white,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(AppImage.upload_doc),
                                SizedBox(width: 10.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextView(
                                      text: 'Upload Document',
                                      textStyle: TextStyle(
                                        fontFamily: 'GoogleSans',
                                        fontSize: 14.2.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.reminder,
                                      ),
                                    ),
                                    SizedBox(height: 2.0.h),
                                    TextView(
                                      text:
                                          'Max file size: 2MB (.jpg, .jpeg,\n.png, or .pdf supported)',
                                      textStyle: TextStyle(
                                        fontFamily: 'Arial',
                                        fontSize: 13.6.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.fineGrey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          TextView(
                            text: 'CAC',
                            textStyle: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 14.2.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.reminder,
                            ),
                          ),
                          Positioned(
                            right: -12.10,
                            child: TextView(
                              text: '*',
                              textStyle: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.20.h),
                      SizedBox(
                        width: double.infinity,
                        child: DottedBorder(
                          options: RoundedRectDottedBorderOptions(
                            dashPattern: [10, 10],
                            strokeWidth: .94,
                            radius: Radius.circular(10),
                            color: AppColors.primary,
                          ),
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                              vertical: 16.20.w,
                              horizontal: 22.0.w,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: AppColors.white,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(AppImage.upload_doc),
                                SizedBox(width: 10.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextView(
                                      text: 'Upload Document',
                                      textStyle: TextStyle(
                                        fontFamily: 'GoogleSans',
                                        fontSize: 14.2.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.reminder,
                                      ),
                                    ),
                                    SizedBox(height: 2.0.h),
                                    TextView(
                                      text:
                                          'Max file size: 2MB (.jpg, .jpeg,\n.png, or .pdf supported)',
                                      textStyle: TextStyle(
                                        fontFamily: 'Arial',
                                        fontSize: 13.6.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.fineGrey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          TextView(
                            text: 'Pharmacy license',
                            textStyle: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 14.2.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.reminder,
                            ),
                          ),
                          Positioned(
                            right: -12.10,
                            child: TextView(
                              text: '*',
                              textStyle: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.20.h),
                      SizedBox(
                        width: double.infinity,
                        child: DottedBorder(
                          options: RoundedRectDottedBorderOptions(
                            dashPattern: [10, 10],
                            strokeWidth: .94,
                            radius: Radius.circular(10),
                            color: AppColors.primary,
                          ),
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                              vertical: 16.20.w,
                              horizontal: 22.0.w,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: AppColors.white,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(AppImage.upload_doc),
                                SizedBox(width: 10.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextView(
                                      text: 'Upload Document',
                                      textStyle: TextStyle(
                                        fontFamily: 'GoogleSans',
                                        fontSize: 14.2.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.reminder,
                                      ),
                                    ),
                                    SizedBox(height: 2.0.h),
                                    TextView(
                                      text:
                                          'Max file size: 2MB (.jpg, .jpeg,\n.png, or .pdf supported)',
                                      textStyle: TextStyle(
                                        fontFamily: 'Arial',
                                        fontSize: 13.6.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.fineGrey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          TextView(
                            text: 'Tax identification number',
                            textStyle: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 14.2.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.reminder,
                            ),
                          ),
                          Positioned(
                            right: -12.10,
                            child: TextView(
                              text: '*',
                              textStyle: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.20.h),
                      SizedBox(
                        width: double.infinity,
                        child: DottedBorder(
                          options: RoundedRectDottedBorderOptions(
                            dashPattern: [10, 10],
                            strokeWidth: .94,
                            radius: Radius.circular(10),
                            color: AppColors.primary,
                          ),
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                              vertical: 16.20.w,
                              horizontal: 22.0.w,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: AppColors.white,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(AppImage.upload_doc),
                                SizedBox(width: 10.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextView(
                                      text: 'Upload Document',
                                      textStyle: TextStyle(
                                        fontFamily: 'GoogleSans',
                                        fontSize: 14.2.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.reminder,
                                      ),
                                    ),
                                    SizedBox(height: 2.0.h),
                                    TextView(
                                      text:
                                          'Max file size: 2MB (.jpg, .jpeg,\n.png, or .pdf supported)',
                                      textStyle: TextStyle(
                                        fontFamily: 'Arial',
                                        fontSize: 13.6.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.fineGrey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 50.h),
                      ButtonWidget(
                        border: 100.r,
                        buttonColor: AppColors.primary,
                        fontSize: 14.sp,
                        buttonText: 'Submit for Verification',
                        color: AppColors.white,
                        isLoading: model.isLoading,
                        buttonBorderColor: AppColors.transparent,
                        onPressed: () {},
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),

                SizedBox(height: 50.h),
              ],
            );
          },
        ),
      ),
    );
  }
}
