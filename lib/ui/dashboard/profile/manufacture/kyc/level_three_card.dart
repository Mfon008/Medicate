import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicate_app/core/app_assets/image.dart';
import 'package:medicate_app/core/config/colors.dart';
import 'package:medicate_app/ui/widget/text.dart';
import '../../../../../core/app_assets/app_validation.dart';
import '../../../../widget/button.dart';
import '../../../../widget/text_form_widget.dart';
import '../dashed_border_painter.dart';

class LevelThreeCard extends StatefulWidget {
  const LevelThreeCard({super.key});

  @override
  State<LevelThreeCard> createState() => _LevelThreeCardState();
}

class _LevelThreeCardState extends State<LevelThreeCard> {
  bool isExpanded = false;
  bool isSwitched = false;

  TextEditingController cacRegNoController = TextEditingController();

  TextEditingController cacRegNoManufacturerController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: CustomPaint(
        painter: DashedBorderPainter(
          color: !isExpanded ? AppColors.transparent : AppColors.primary1,
          strokeWidth: 1.90,
          dashWidth: 4,
          dashSpace: 0,
          radius: 16.r,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: AnimatedSize(
            duration: const Duration(milliseconds: 350),
            curve: Curves.easeInOut,
            alignment: Alignment.topCenter,
            child: Container(
              color: AppColors.f1,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // ==========================================
                  // HEADER
                  // ==========================================
                  InkWell(
                    onTap: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: 15.w,
                        vertical: 13.h,
                      ),
                      color: AppColors.f1,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          !isExpanded
                              ? SvgPicture.asset(AppImage.locked_padlock)
                              : SvgPicture.asset(AppImage.open_padlock),

                          SizedBox(width: 8.w),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextView(
                                text: 'Level 3',
                                textStyle: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.reminder1,
                                  fontFamily: 'DMSans',
                                ),
                              ),

                              SizedBox(height: 2.h),

                              TextView(
                                text: 'Settlement bank details',
                                textStyle: TextStyle(
                                  fontSize: 13.22.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.reminder1,
                                  fontFamily: 'DMSans',
                                ),
                              ),
                            ],
                          ),

                          const Spacer(),

                          AnimatedRotation(
                            turns: isExpanded ? 0.5 : 0,
                            duration: const Duration(milliseconds: 300),
                            child: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              size: 21.sp,
                              color: const Color(0xFF333333),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // ==========================================
                  // EXPANDED CONTENT
                  // ==========================================
                  if (isExpanded)
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        vertical: 10.w,
                        horizontal: 18.w,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.white,

                        // Curved top corners
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.r),
                          topRight: Radius.circular(20.r),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 12.h),

                          TextFormWidget(
                            hint: 'Bank Name',
                            label: '--Select--',
                            rightPos: -14,
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
                              padding: EdgeInsets.all(14.w),
                              child: SvgPicture.asset(
                                AppImage.arrow_down,
                                height: 8.0.h,
                                width: 8.0.w,
                              ),
                            ),
                            validator: AppValidator.validateString(),
                            controller: cacRegNoController,
                          ),
                          SizedBox(height: 20.h),
                          TextFormWidget(
                            hint: 'Account Name',
                            rightPos: -14,
                            hintSize: 14,
                            borderColor: AppColors.transparent,
                            borderTopLeft: 10.r,
                            borderTopRight: 10.r,
                            borderBottomLeft: 10.r,
                            borderBottomRight: 10.r,
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Arial',
                              fontSize: 14.2.sp,
                              color: AppColors.infoGrey,
                            ),
                            fillColor: AppColors.grey,
                            isFilled: true,
                            validator: AppValidator.validateString(),
                            controller: cacRegNoController,
                          ),
                          SizedBox(height: 20.h),
                          TextFormWidget(
                            hint: 'Account Number',
                            rightPos: -14,
                            hintSize: 14,
                            borderColor: AppColors.transparent,
                            borderTopLeft: 10.r,
                            borderTopRight: 10.r,
                            borderBottomLeft: 10.r,
                            borderBottomRight: 10.r,
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Arial',
                              fontSize: 14.2.sp,
                              color: AppColors.infoGrey,
                            ),
                            fillColor: AppColors.grey,
                            isFilled: true,
                            validator: AppValidator.validateString(),
                            controller: cacRegNoController,
                          ),
                          SizedBox(height: 20.h),
                          TextFormWidget(
                            hint: 'BVN (optional)',
                            isShowHint: true,
                            rightPos: -14,
                            hintSize: 14,
                            borderColor: AppColors.transparent,
                            borderTopLeft: 10.r,
                            borderTopRight: 10.r,
                            borderBottomLeft: 10.r,
                            borderBottomRight: 10.r,
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Arial',
                              fontSize: 14.2.sp,
                              color: AppColors.infoGrey,
                            ),
                            fillColor: AppColors.grey,
                            isFilled: true,
                            validator: AppValidator.validateString(),
                            controller: cacRegNoController,
                          ),
                          SizedBox(height: 30.h),
                          ButtonWidget(
                            border: 100.r,
                            buttonColor: AppColors.primary,
                            fontSize: 14.sp,
                            buttonText: 'Submit for Verification',
                            color: AppColors.white,
                            // isLoading: model.isLoading,
                            buttonBorderColor: AppColors.transparent,
                            onPressed: () {},
                          ),
                          SizedBox(height: 10.h),
                        ],
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
}
