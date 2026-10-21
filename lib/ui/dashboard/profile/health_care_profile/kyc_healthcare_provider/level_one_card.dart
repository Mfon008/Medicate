// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medicate_app/core/config/colors.dart';
import 'package:medicate_app/core/connect_end/view_model/health_care_view_model.dart';
import 'package:medicate_app/ui/widget/text.dart';
import '../../../../../core/app_assets/image.dart';
import '../../../../widget/info_item_widget.dart';
import '../../manufacture/dashed_border_painter.dart';

class LevelOneCard extends StatefulWidget {
  LevelOneCard({super.key, this.model});
  HealthCareViewModel? model;

  @override
  State<LevelOneCard> createState() => _LevelOneCardState();
}

class _LevelOneCardState extends State<LevelOneCard> {
  bool isExpanded = true;

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
              color: const Color(0xFFF1F7FE),
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
                      color: !isExpanded
                          ? AppColors.f1
                          : const Color(0xFFF1F7FE),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          widget
                                      .model
                                      ?.getHealthcareProviderKycResponseModel
                                      ?.data
                                      ?.kycLevels?[0]
                                      .status
                                      ?.toLowerCase() ==
                                  'approved'
                              ? Container(
                                  width: 14.w,
                                  height: 14.w,
                                  margin: EdgeInsets.only(top: 1.h),
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF58C58A),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.check,
                                    size: 9.sp,
                                    color: Colors.white,
                                  ),
                                )
                              : !isExpanded
                              ? SvgPicture.asset(AppImage.open_padlock)
                              : SvgPicture.asset(AppImage.open_padlock),

                          SizedBox(width: 8.w),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextView(
                                text: 'Level 1',
                                textStyle: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.reminder1,
                                  fontFamily: 'DMSans',
                                ),
                              ),

                              SizedBox(height: 2.h),

                              TextView(
                                text: 'Account Created',
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
                          // ==================================
                          // KYC MESSAGE
                          // ==================================
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 14.w,
                              vertical: 12.h,
                            ),
                            margin: EdgeInsets.symmetric(
                              horizontal: 14.w,
                              vertical: 22.h,
                            ),
                            decoration: BoxDecoration(
                              color: widget.model!.kycStatusColor(
                                widget
                                    .model
                                    ?.getHealthcareProviderKycResponseModel
                                    ?.data
                                    ?.kycLevels?[0]
                                    .status,
                              ),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                widget
                                            .model!
                                            .getHealthcareProviderKycResponseModel
                                            ?.data
                                            ?.kycLevels?[0]
                                            .status
                                            ?.toLowerCase() ==
                                        'approved'
                                    ? Container(
                                        width: 14.w,
                                        height: 14.w,
                                        margin: EdgeInsets.only(top: 1.h),
                                        decoration: const BoxDecoration(
                                          color: Color(0xFF58C58A),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          Icons.check,
                                          size: 9.sp,
                                          color: Colors.white,
                                        ),
                                      )
                                    : Icon(
                                        Icons.info_outline,
                                        size: 18.90.sp,
                                        color: widget.model!.kycStatusColorIcon(
                                          widget
                                                  .model!
                                                  .getHealthcareProviderKycResponseModel
                                                  ?.data
                                                  ?.kycLevels?[0]
                                                  .status ??
                                              '',
                                        ),
                                      ),

                                SizedBox(width: 8.w),

                                Expanded(
                                  child: Text(
                                    widget.model!.kycStatusText(
                                      widget
                                          .model
                                          ?.getHealthcareProviderKycResponseModel
                                          ?.data
                                          ?.kycLevels?[0]
                                          .status,
                                    ),
                                    style: TextStyle(
                                      fontSize: 12.5.sp,
                                      height: 1.35,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF252525),
                                      fontFamily: 'DMSans',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // ==================================
                          // INFORMATION
                          // ==================================
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 14.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InfoItem(
                                  title: 'Healthcare facility name',
                                  value:
                                      widget
                                          .model
                                          ?.getHealthcareProviderKycResponseModel
                                          ?.data
                                          ?.level1
                                          ?.healthcareFacilityName ??
                                      '--',
                                ),

                                SizedBox(height: 13.6.h),

                                InfoItem(
                                  title: 'Phone Number',
                                  value:
                                      widget
                                          .model
                                          ?.getHealthcareProviderKycResponseModel
                                          ?.data
                                          ?.level1
                                          ?.phoneNumber ??
                                      '--',
                                ),

                                SizedBox(height: 13.6.h),

                                InfoItem(
                                  title: 'Business Registration Number',
                                  value:
                                      widget
                                          .model
                                          ?.getHealthcareProviderKycResponseModel
                                          ?.data
                                          ?.level1
                                          ?.registrationNumber ??
                                      '--',
                                ),

                                SizedBox(height: 13.6.h),

                                InfoItem(
                                  title: 'Type of healthcare provider',
                                  value:
                                      widget
                                          .model
                                          ?.getHealthcareProviderKycResponseModel
                                          ?.data
                                          ?.level1
                                          ?.providerType ??
                                      '--',
                                ),
                                SizedBox(height: 13.6.h),

                                InfoItem(
                                  title: 'Country',
                                  value:
                                      widget
                                          .model
                                          ?.getHealthcareProviderKycResponseModel
                                          ?.data
                                          ?.level1
                                          ?.country ??
                                      '--',
                                ),
                                SizedBox(height: 13.6.h),

                                InfoItem(
                                  title: 'State',
                                  value:
                                      widget
                                          .model
                                          ?.getHealthcareProviderKycResponseModel
                                          ?.data
                                          ?.level1
                                          ?.state ??
                                      '--',
                                ),
                                SizedBox(height: 13.6.h),

                                InfoItem(
                                  title: 'LGA',
                                  value:
                                      widget
                                          .model
                                          ?.getHealthcareProviderKycResponseModel
                                          ?.data
                                          ?.level1
                                          ?.lga ??
                                      '--',
                                ),
                                SizedBox(height: 13.6.h),

                                InfoItem(
                                  title: 'Website',
                                  value:
                                      widget
                                          .model
                                          ?.getHealthcareProviderKycResponseModel
                                          ?.data
                                          ?.level1
                                          ?.website ??
                                      '--',
                                ),

                                SizedBox(height: 13.6.h),

                                Padding(
                                  padding: EdgeInsets.only(bottom: 16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextView(
                                        text: "Selected Services",
                                        textStyle: TextStyle(
                                          fontFamily: 'Arial',
                                          fontSize: 13.6.sp,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.infoGrey,
                                        ),
                                      ),
                                      SizedBox(height: 4.h),

                                      widget.model!.getHealthcareProviderKycResponseModel !=
                                                  null &&
                                              widget
                                                      .model!
                                                      .getHealthcareProviderKycResponseModel!
                                                      .data!
                                                      .level1!
                                                      .servicesOffered !=
                                                  null &&
                                              widget
                                                  .model!
                                                  .getHealthcareProviderKycResponseModel!
                                                  .data!
                                                  .level1!
                                                  .servicesOffered!
                                                  .isNotEmpty
                                          ? Container(
                                              height:
                                                  widget
                                                          .model!
                                                          .getHealthcareProviderKycResponseModel!
                                                          .data!
                                                          .level1!
                                                          .servicesOffered!
                                                          .length >
                                                      3
                                                  ? 166.0.h
                                                  : 120.h,
                                              width: double.infinity,
                                              padding: EdgeInsets.all(16.w),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                color: AppColors.grey,
                                              ),
                                              child: SingleChildScrollView(
                                                child: Wrap(
                                                  runSpacing: 10,
                                                  spacing: 10,
                                                  children: [
                                                    ...widget
                                                        .model!
                                                        .getHealthcareProviderKycResponseModel!
                                                        .data!
                                                        .level1!
                                                        .servicesOffered!
                                                        .map(
                                                          (e) => Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              Container(
                                                                width: 14.w,
                                                                height: 14.w,
                                                                margin:
                                                                    EdgeInsets.only(
                                                                      top: 1.h,
                                                                    ),
                                                                decoration: BoxDecoration(
                                                                  color: AppColors
                                                                      .app_green,
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child: Icon(
                                                                  Icons.check,
                                                                  size: 9.sp,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 2.w,
                                                              ),
                                                              TextView(
                                                                text: '$e ',
                                                                textStyle: TextStyle(
                                                                  fontSize:
                                                                      13.86.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w200,
                                                                  color: AppColors
                                                                      .reminder,
                                                                  fontFamily:
                                                                      'DMSans',
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          : SizedBox(
                                              width: 240.w,
                                              child: TextView(
                                                text: '--',
                                                maxLines: 4,
                                                textOverflow:
                                                    TextOverflow.ellipsis,
                                                textStyle: TextStyle(
                                                  fontFamily: 'Arial',
                                                  fontSize: 15.6.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.reminder1,
                                                ),
                                              ),
                                            ),
                                    ],
                                  ),
                                ),

                                SizedBox(height: 18.22.h),
                                TextView(
                                  text: 'Addresses',
                                  textStyle: TextStyle(
                                    fontSize: 15.86.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.reminder1,
                                    fontFamily: 'DMSans',
                                  ),
                                ),

                                Divider(color: AppColors.f1),
                                SizedBox(height: 12.h),
                                if (widget
                                            .model!
                                            .getHealthcareProviderKycResponseModel !=
                                        null &&
                                    widget
                                        .model!
                                        .getHealthcareProviderKycResponseModel!
                                        .data!
                                        .level1!
                                        .businessAddresses!
                                        .isNotEmpty)
                                  ...widget
                                      .model!
                                      .getHealthcareProviderKycResponseModel!
                                      .data!
                                      .level1!
                                      .businessAddresses!
                                      .asMap()
                                      .entries
                                      .map((entry) {
                                        // final index = entry.key;
                                        final o = entry.value;

                                        return Container(
                                          width: double.infinity,
                                          margin: EdgeInsets.only(bottom: 12.w),
                                          padding: EdgeInsets.all(16.w),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                            color: AppColors.grey,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TextView(
                                                text: o.businessAddress ?? '',
                                                textStyle: TextStyle(
                                                  fontSize: 13.86.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColors.reminder1,
                                                  fontFamily: 'DMSans',
                                                ),
                                              ),
                                              SizedBox(height: 5.2.h),
                                              TextView(
                                                text:
                                                    '${o.lga}, ${o.state} State, ${o.country}',
                                                textStyle: TextStyle(
                                                  fontSize: 12.86.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.infoGrey,
                                                  fontFamily: 'DMSans',
                                                ),
                                              ),

                                              SizedBox(height: 10.h),
                                            ],
                                          ),
                                        );
                                      }),
                                SizedBox(height: 18.22.h),
                                TextView(
                                  text: 'Means of ID',
                                  textStyle: TextStyle(
                                    fontSize: 15.86.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.reminder1,
                                    fontFamily: 'DMSans',
                                  ),
                                ),

                                Divider(color: AppColors.f1),
                                SizedBox(height: 18.22.h),
                                InfoItem(
                                  title: 'Means of ID',
                                  value:
                                      widget
                                          .model
                                          ?.getHealthcareProviderKycResponseModel
                                          ?.data
                                          ?.level1
                                          ?.meansOfIdType ??
                                      '--',
                                ),
                                SizedBox(height: 18.22.h),
                                TextView(
                                  text: 'Contact Details',
                                  textStyle: TextStyle(
                                    fontSize: 15.86.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.reminder1,
                                    fontFamily: 'DMSans',
                                  ),
                                ),

                                Divider(color: AppColors.f1),
                                SizedBox(height: 18.22.h),
                                InfoItem(
                                  title: 'Business Address',
                                  value:
                                      widget
                                          .model
                                          ?.getHealthcareProviderKycResponseModel
                                          ?.data
                                          ?.level1
                                          ?.businessAddress ??
                                      '--',
                                ),

                                SizedBox(height: 14.22.h),
                                InfoItem(
                                  title: 'Business email',
                                  value:
                                      widget
                                          .model
                                          ?.getHealthcareProviderKycResponseModel
                                          ?.data
                                          ?.level1
                                          ?.businessEmail ??
                                      '--',
                                ),
                                SizedBox(height: 18.22.h),
                              ],
                            ),
                          ),
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
