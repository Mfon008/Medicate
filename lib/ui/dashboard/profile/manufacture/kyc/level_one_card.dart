// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicate_app/core/config/colors.dart';
import 'package:medicate_app/ui/widget/text.dart';
import '../../../../../core/connect_end/view_model/manufacturer_view_model.dart';
import '../../../../widget/info_item_widget.dart';
import '../dashed_border_painter.dart';

class LevelOneCard extends StatefulWidget {
  LevelOneCard({super.key, this.model});
  ManufacturerViewModel? model;

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
                          Container(
                            width: 14.w,
                            height: 14.w,
                            decoration: const BoxDecoration(
                              color: Color(0xFF58C58A),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.check,
                              size: 9.sp,
                              color: Colors.white,
                            ),
                          ),

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
                              color: const Color(0xFFE8FAF0),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
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
                                ),

                                SizedBox(width: 8.w),

                                Expanded(
                                  child: Text(
                                    'Your KYC has been successfully '
                                    'verified. You can now access '
                                    'some services.',
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
                                  title: 'Distributor/Manufacturer name',
                                  value:
                                      widget
                                          .model
                                          ?.getDistributorKycResponseModel
                                          ?.data
                                          ?.level1
                                          ?.distributorManufacturerName ??
                                      '--',
                                ),

                                SizedBox(height: 13.6.h),

                                InfoItem(
                                  title: 'Phone Number',
                                  value:
                                      widget
                                          .model
                                          ?.getDistributorKycResponseModel
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
                                          ?.getDistributorKycResponseModel
                                          ?.data
                                          ?.level1
                                          ?.registrationNumber ??
                                      '--',
                                ),

                                SizedBox(height: 13.6.h),
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
                                if (widget.model!.getDistributorKycResponseModel !=
                                        null &&
                                    widget
                                        .model!
                                        .getDistributorKycResponseModel!
                                        .data!
                                        .level1!
                                        .businessAddresses!
                                        .isNotEmpty)
                                  ...widget
                                      .model!
                                      .getDistributorKycResponseModel!
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
                                      }),                              ],
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
