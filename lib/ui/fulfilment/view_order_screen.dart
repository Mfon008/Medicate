// ignore_for_file: deprecated_member_use, must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/app_assets/constant.dart';
import '../../core/app_assets/image.dart';
import '../../core/config/colors.dart';
import '../widget/button.dart';
import '../widget/text.dart';

class ViewOrderScreen extends StatelessWidget {
  ViewOrderScreen({super.key});

  String imageUrl =
      'https://medicate-bucket.s3.us-east-1.amazonaws.com/wholesale/distributors/6ab9557a9b1fb455a41b2475/products/draft/eedab139-56bc-42fc-8dc1-8b4dea4e589e.jpeg';

  @override
  Widget build(BuildContext context) {
    bool isTablet(BuildContext context) =>
        MediaQuery.of(context).size.shortestSide >= 600;
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
          text: 'View Order',
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
        padding: EdgeInsets.symmetric(horizontal: 16.20.w, vertical: 20.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(14.20.w),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 4.w,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18.r),
                      color: AppColors.red_bar.withValues(alpha: .1),
                      // border: Border.all(color: AppColors.red_bar),
                    ),
                    child: TextView(
                      text: 'Rejected',
                      textStyle: TextStyle(
                        fontFamily: 'DMSans',
                        fontSize: 11.82.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.red_bar,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),

                  TextView(
                    text: 'Order WO-260712-aa8408',
                    textStyle: TextStyle(
                      fontFamily: 'DMSans',
                      fontSize: 15.82.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.reminder,
                    ),
                  ),
                  SizedBox(height: 2.0.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextView(
                        text: 'Assigned: ',
                        textStyle: TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 13.02.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black,
                        ),
                      ),
                      TextView(
                        text: 'Jul 12, 2026, 1:44:13 PM',
                        textStyle: TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 13.02.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.infoGrey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.0.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextView(
                        text: 'Delivery deadline: ',
                        textStyle: TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 13.02.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black,
                        ),
                      ),
                      TextView(
                        text: 'Jul 12, 2026, 1:44:13 PM',
                        textStyle: TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 13.02.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.infoGrey,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20.h),
                  TextView(
                    text: 'Items (2)',
                    textStyle: TextStyle(
                      fontFamily: 'DMSans',
                      fontSize: 15.82.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.reminder,
                    ),
                  ),
                  SizedBox(height: 15.30.h),
                  // Column(
                  //         children: [
                  //           // if (model
                  //           //     .getIncomingOrderDdetailResponseModel!
                  //           //     .data!
                  //           //     .order!
                  //           //     .deliveries![model.deliveryIndexSplit - 1]
                  //           //     .items!
                  //           //     .isNotEmpty)
                  //             ...model
                  //                 .getIncomingOrderDdetailResponseModel!
                  //                 .data!
                  //                 .order!
                  //                 .deliveries![model.deliveryIndexSplit -
                  //                     1]
                  //                 .items!
                  //                 .asMap()
                  //                 .entries
                  //                 .map((e) {
                  //                   return Column(
                  //                     crossAxisAlignment:
                  //                         CrossAxisAlignment.start,
                  //                     children: [
                  //                       Container(
                  //                         margin: EdgeInsets.only(
                  //                           bottom: 13.10.w,
                  //                         ),
                  //                         padding: EdgeInsets.all(
                  //                           12.20.w,
                  //                         ),
                  //                         decoration: BoxDecoration(
                  //                           borderRadius:
                  //                               BorderRadius.circular(
                  //                                 12.r,
                  //                               ),
                  //                           border: Border.all(
                  //                             color: AppColors.infoGrey1,
                  //                           ),
                  //                         ),
                  //                         child: Row(
                  //                           children: [
                  //                             Container(
                  //                               width: 52.w,
                  //                               height: 52.h,
                  //                               padding: EdgeInsets.all(
                  //                                 2.0.w,
                  //                               ),
                  //                               decoration: BoxDecoration(
                  //                                 color: AppColors.grey,
                  //                                 borderRadius:
                  //                                     BorderRadius.circular(
                  //                                       10.r,
                  //                                     ),
                  //                                 border: Border.all(
                  //                                   color:
                  //                                       const Color.fromARGB(
                  //                                         255,
                  //                                         236,
                  //                                         237,
                  //                                         237,
                  //                                       ),
                  //                                 ),
                  //                               ),
                  //                               child: Container(
                  //                                 padding: EdgeInsets.all(
                  //                                   4.0.w,
                  //                                 ),
                  //                                 decoration: BoxDecoration(
                  //                                   color:
                  //                                       AppColors.white,
                  //                                   borderRadius:
                  //                                       BorderRadius.circular(
                  //                                         10.r,
                  //                                       ),
                  //                                   border: Border.all(
                  //                                     color:
                  //                                         AppColors.grey2,
                  //                                   ),
                  //                                 ),
                  //                                 child: Container(
                  //                                   decoration:
                  //                                       BoxDecoration(
                  //                                         shape: BoxShape
                  //                                             .circle,
                  //                                         color: AppColors
                  //                                             .grey2,
                  //                                       ),
                  //                                   child: ClipOval(
                  //                                     child: CachedNetworkImage(
                  //                                       imageUrl:
                  //                                           e
                  //                                               .value
                  //                                               .imageUrl ??
                  //                                           '',
                  //                                       height:
                  //                                           isTablet(
                  //                                             context,
                  //                                           )
                  //                                           ? 58.0.h
                  //                                           : 38.8.h,
                  //                                       width:
                  //                                           isTablet(
                  //                                             context,
                  //                                           )
                  //                                           ? 58.0.w
                  //                                           : 38.8.w,
                  //                                       errorWidget:
                  //                                           (
                  //                                             context,
                  //                                             url,
                  //                                             error,
                  //                                           ) => SvgPicture.asset(
                  //                                             AppImage
                  //                                                 .box_cart,
                  //                                             height:
                  //                                                 isTablet(
                  //                                                   context,
                  //                                                 )
                  //                                                 ? 48.0.h
                  //                                                 : 38.h,
                  //                                             width:
                  //                                                 isTablet(
                  //                                                   context,
                  //                                                 )
                  //                                                 ? 48.0.w
                  //                                                 : 38.w,
                  //                                             color: AppColors
                  //                                                 .infoGrey,
                  //                                           ),
                  //                                       fit: BoxFit.cover,
                  //                                     ),
                  //                                   ),
                  //                                 ),
                  //                               ),
                  //                             ),
                  //                             SizedBox(width: 12.w),
                  //                             Expanded(
                  //                               child: Column(
                  //                                 crossAxisAlignment:
                  //                                     CrossAxisAlignment
                  //                                         .start,
                  //                                 mainAxisSize:
                  //                                     MainAxisSize.min,
                  //                                 children: [
                  //                                   TextView(
                  //                                     text:
                  //                                         e
                  //                                             .value
                  //                                             .productName ??
                  //                                         '',
                  //                                     textStyle: TextStyle(
                  //                                       fontFamily:
                  //                                           'GoogleSans',
                  //                                       fontSize:
                  //                                           16.20.sp,
                  //                                       fontWeight:
                  //                                           FontWeight
                  //                                               .w500,
                  //                                       color: AppColors
                  //                                           .reminder,
                  //                                     ),
                  //                                   ),

                  //                                   SizedBox(
                  //                                     height: 2.10.h,
                  //                                   ),
                  //                                   TextView(
                  //                                     text:
                  //                                         'Qty ${e.value.quantity} of ${e.value.minimumOrderQuantity}',
                  //                                     textStyle: TextStyle(
                  //                                       fontFamily:
                  //                                           'GoogleSans',
                  //                                       fontSize:
                  //                                           13.20.sp,
                  //                                       fontWeight:
                  //                                           FontWeight
                  //                                               .w400,
                  //                                       color: AppColors
                  //                                           .infoGrey,
                  //                                       letterSpacing:
                  //                                           -0.1,
                  //                                     ),
                  //                                   ),
                  //                                 ],
                  //                               ),
                  //                             ),
                  //                             TextView(
                  //                               text: formatNairaDouble(
                  //                                 e.value.lineTotal!
                  //                                     .toDouble(),
                  //                               ),
                  //                               textStyle: TextStyle(
                  //                                 fontFamily:
                  //                                     'GoogleSans',
                  //                                 fontSize: 15.20.sp,
                  //                                 fontWeight:
                  //                                     FontWeight.w500,
                  //                                 color:
                  //                                     AppColors.reminder,
                  //                               ),
                  //                             ),
                  //                           ],
                  //                         ),
                  //                       ),
                  //                       SizedBox(height: 14.0.h),
                  //                     ],
                  //                   );
                  //                 }),
                  //         ],
                  //       )
                  //     :
                  Column(
                    children: [
                      ...[1, 2].asMap().entries.map(
                        (e) => Container(
                          margin: EdgeInsets.only(bottom: 10.w),
                          padding: EdgeInsets.all(12.20.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(color: AppColors.infoGrey1),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 52.w,
                                height: 52.h,
                                padding: EdgeInsets.all(2.0.w),
                                decoration: BoxDecoration(
                                  color: AppColors.grey,
                                  borderRadius: BorderRadius.circular(10.r),
                                  border: Border.all(
                                    color: const Color.fromARGB(
                                      255,
                                      236,
                                      237,
                                      237,
                                    ),
                                  ),
                                ),
                                child: Container(
                                  padding: EdgeInsets.all(4.0.w),
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(10.r),
                                    border: Border.all(color: AppColors.grey2),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.grey2,
                                    ),
                                    child: ClipOval(
                                      child: CachedNetworkImage(
                                        imageUrl: imageUrl,
                                        height: isTablet(context)
                                            ? 58.0.h
                                            : 38.8.h,
                                        width: isTablet(context)
                                            ? 58.0.w
                                            : 38.8.w,
                                        errorWidget: (context, url, error) =>
                                            SvgPicture.asset(
                                              AppImage.box_cart,
                                              height: isTablet(context)
                                                  ? 48.0.h
                                                  : 38.h,
                                              width: isTablet(context)
                                                  ? 48.0.w
                                                  : 38.w,
                                              color: AppColors.infoGrey,
                                            ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 12.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextView(
                                    text: 'Amoxicillin',
                                    textStyle: TextStyle(
                                      fontFamily: 'GoogleSans',
                                      fontSize: 16.20.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.reminder,
                                    ),
                                  ),

                                  SizedBox(height: 2.10.h),
                                  TextView(
                                    text:
                                        'Qty 4 | ${formatNairaDouble(18500.0)}',
                                    textStyle: TextStyle(
                                      fontFamily: 'GoogleSans',
                                      fontSize: 13.20.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.infoGrey,
                                      letterSpacing: -0.1,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.h),
                      TextView(
                        text: 'Pickup',
                        textStyle: TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 16.20.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.reminder,
                        ),
                      ),
                      SizedBox(height: 14.20.h),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          vertical: 14.w,
                          horizontal: 16.w,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.cooool,
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(color: AppColors.infoGrey2),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextView(
                              text: 'Sample Pharmacy 6',
                              textStyle: TextStyle(
                                fontFamily: 'DMSans',
                                fontSize: 16.20.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.reminder,
                              ),
                            ),
                            SizedBox(height: 14.20.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  AppImage.locator,
                                  height: 14.h,
                                  width: 10.w,
                                  color: AppColors.primary,
                                ),
                                SizedBox(width: 10.h),
                                Flexible(
                                  child: TextView(
                                    text: '6 Sample Delivery Road, Ikeja',
                                    textStyle: TextStyle(
                                      fontFamily: 'DMSans',
                                      fontSize: 15.32.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.reminder,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  AppImage.time,
                                  height: 14.h,
                                  width: 10.w,
                                  color: AppColors.primary,
                                ),
                                SizedBox(width: 10.h),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextView(
                                      text: 'Time window',
                                      textStyle: TextStyle(
                                        fontFamily: 'DMSans',
                                        fontSize: 14.2.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.infoGrey,
                                      ),
                                    ),
                                    TextView(
                                      text: '09:00–17:00 WAT',
                                      textStyle: TextStyle(
                                        fontFamily: 'DMSans',
                                        fontSize: 15.32.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.reminder,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  AppImage.ref_clip,
                                  height: 14.h,
                                  width: 10.w,
                                  color: AppColors.primary,
                                ),
                                SizedBox(width: 10.h),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextView(
                                      text: 'Pickup reference',
                                      textStyle: TextStyle(
                                        fontFamily: 'DMSans',
                                        fontSize: 14.2.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.infoGrey,
                                      ),
                                    ),
                                    TextView(
                                      text: 'DEMO-PICKUP-NFS-6',
                                      textStyle: TextStyle(
                                        fontFamily: 'DMSans',
                                        fontSize: 15.32.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.reminder,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            SizedBox(height: 20.h),

                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                vertical: 6.w,
                                horizontal: 12.w,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.primary),
                                borderRadius: BorderRadius.circular(24.r),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    AppImage.direction_img,
                                    height: 14.h,
                                    width: 10.w,
                                    color: AppColors.primary,
                                  ),
                                  SizedBox(width: 10.h),
                                  TextView(
                                    text: 'Get Directions',
                                    textStyle: TextStyle(
                                      fontFamily: 'DMSans',
                                      fontSize: 15.32.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),
                      TextView(
                        text: 'Delivery',
                        textStyle: TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 16.20.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.reminder,
                        ),
                      ),
                      SizedBox(height: 14.20.h),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          vertical: 14.w,
                          horizontal: 16.w,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.cooool,
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(color: AppColors.infoGrey2),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextView(
                              text: 'Apex Medical Clinic',
                              textStyle: TextStyle(
                                fontFamily: 'DMSans',
                                fontSize: 16.20.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.reminder,
                              ),
                            ),
                            SizedBox(height: 14.20.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  AppImage.locator,
                                  height: 14.h,
                                  width: 10.w,
                                  color: AppColors.primary,
                                ),
                                SizedBox(width: 10.h),
                                Flexible(
                                  child: TextView(
                                    text: '6 Sample Delivery Road, Ikeja',
                                    textStyle: TextStyle(
                                      fontFamily: 'DMSans',
                                      fontSize: 15.32.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.reminder,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  AppImage.time,
                                  height: 14.h,
                                  width: 10.w,
                                  color: AppColors.primary,
                                ),
                                SizedBox(width: 10.h),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextView(
                                      text: 'Time window',
                                      textStyle: TextStyle(
                                        fontFamily: 'DMSans',
                                        fontSize: 14.2.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.infoGrey,
                                      ),
                                    ),
                                    TextView(
                                      text: '09:00–17:00 WAT',
                                      textStyle: TextStyle(
                                        fontFamily: 'DMSans',
                                        fontSize: 15.32.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.reminder,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h),

                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                vertical: 6.w,
                                horizontal: 12.w,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.primary),
                                borderRadius: BorderRadius.circular(24.r),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    AppImage.direction_img,
                                    height: 14.h,
                                    width: 10.w,
                                    color: AppColors.primary,
                                  ),
                                  SizedBox(width: 10.h),
                                  TextView(
                                    text: 'Get Directions',
                                    textStyle: TextStyle(
                                      fontFamily: 'DMSans',
                                      fontSize: 15.32.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),
                      TextView(
                        text: 'Delivery Instructions',
                        textStyle: TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 16.20.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.reminder,
                        ),
                      ),
                      SizedBox(height: 14.20.h),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          vertical: 14.w,
                          horizontal: 16.w,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.cooool,
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(color: AppColors.infoGrey2),
                        ),
                        child: TextView(
                          text:
                              'Sample delivery for testing only. Use test photos or signatures; do not dispatch goods.',
                          textStyle: TextStyle(
                            fontFamily: 'DMSans',
                            fontSize: 16.20.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.reminder,
                          ),
                        ),
                      ),

                      SizedBox(height: 20.h),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextView(
                            text: 'Fulfilment Timeline',
                            textStyle: TextStyle(
                              fontFamily: 'DMSans',
                              fontSize: 15.80.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.reminder,
                            ),
                          ),
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            spacing: 10,
                            runSpacing: 3.72,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: AppColors.app_green,
                                  shape: BoxShape.circle,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(10.w),
                                  child: TextView(
                                    text: '1',
                                    textStyle: TextStyle(
                                      fontFamily: 'DMSans',
                                      fontSize: 14.20.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                              ),
                              TextView(
                                text: 'Confirm',
                                textStyle: TextStyle(
                                  fontFamily: 'DMSans',
                                  fontSize: 15.20.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.app_green,
                                ),
                                letterSpacing: -0.21,
                              ),

                              SvgPicture.asset(
                                AppImage.arrow_right,
                                color: AppColors.app_green,
                                height: 12.h,
                                width: 10.w,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: AppColors.app_green,
                                  shape: BoxShape.circle,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(10.w),
                                  child: TextView(
                                    text: '2',
                                    textStyle: TextStyle(
                                      fontFamily: 'DMSans',
                                      fontSize: 14.20.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                              ),
                              TextView(
                                text: 'Processing',
                                textStyle: TextStyle(
                                  fontFamily: 'DMSans',
                                  fontSize: 15.20.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.app_green,
                                  letterSpacing: -0.21,
                                ),
                              ),
                              SvgPicture.asset(
                                AppImage.arrow_right,
                                color: AppColors.app_green,
                                height: 12.h,
                                width: 10.w,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: AppColors.app_green,
                                  shape: BoxShape.circle,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(10.w),
                                  child: TextView(
                                    text: '3',
                                    textStyle: TextStyle(
                                      fontFamily: 'DMSans',
                                      fontSize: 14.20.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                              ),

                              TextView(
                                text: 'Shipped',
                                textStyle: TextStyle(
                                  fontFamily: 'DMSans',
                                  fontSize: 15.20.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.app_green,
                                  letterSpacing: -0.21,
                                ),
                              ),
                              SvgPicture.asset(
                                AppImage.arrow_right,
                                color: AppColors.app_green,
                                height: 12.h,
                                width: 10.w,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: AppColors.app_green,
                                  shape: BoxShape.circle,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(10.w),
                                  child: TextView(
                                    text: '4',
                                    textStyle: TextStyle(
                                      fontFamily: 'DMSans',
                                      fontSize: 14.20.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                              ),
                              TextView(
                                text: 'Delivered',
                                textStyle: TextStyle(
                                  fontFamily: 'DMSans',
                                  fontSize: 15.20.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.green,
                                  letterSpacing: -0.21,
                                ),
                              ),
                              SvgPicture.asset(
                                AppImage.arrow_right,
                                color: AppColors.app_green,
                                height: 12.h,
                                width: 10.w,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IntrinsicWidth(
                            child: GestureDetector(
                              // onTap: () => model.rejectIncomingOrderDialog(
                              //   context: context,
                              //   model: model,
                              //   orderId: id,
                              //   delivery: model
                              //       .getIncomingOrderDdetailResponseModel!
                              //       .data!
                              //       .order!
                              //       .deliveries![0]
                              //       .deliveryNumber
                              //       .toString(),
                              //   requestId:
                              //       requestId,
                              //   expectedRevision: model
                              //       .getIncomingOrderDdetailResponseModel!
                              //       .data!
                              //       .order!
                              //       .revision
                              //       .toString(),
                              //   wholesaleGroupId:
                              //       wholesaleGroupId,
                              // ),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 12.w,
                                  horizontal: 22.w,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColors.primary,
                                    width: 1.42,
                                  ),
                                  borderRadius: BorderRadius.circular(40.r),
                                ),
                                child: TextView(
                                  text: 'Reject Order',
                                  textStyle: TextStyle(
                                    fontFamily: 'DMSans',
                                    fontSize: 15.20.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.primary,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          IntrinsicWidth(
                            child: GestureDetector(
                              // onTap: () => model.advanceDetailedIncomingOrderDialog(
                              //   context: context,
                              //   orderId: id,
                              //   delivery: model
                              //       .getIncomingOrderDdetailResponseModel!
                              //       .data!
                              //       .order!
                              //       .deliveries![0]
                              //       .deliveryNumber
                              //       .toString(),
                              //   requestId:
                              //       requestId,
                              //   expectedRevision: model
                              //       .getIncomingOrderDdetailResponseModel!
                              //       .data!
                              //       .order!
                              //       .revision
                              //       .toString(),
                              //   wholesaleFulfillmentsGroupId:
                              //       wholesaleGroupId,
                              //   text: model
                              //       .returnFulfillmentIncomingOrderText(
                              //         model
                              //             .getIncomingOrderDdetailResponseModel!
                              //             .data!
                              //             .order!
                              //             .status!,
                              //       ),
                              //   model: model,
                              // ),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 14.w,
                                  horizontal: 28.w,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius: BorderRadius.circular(40.r),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      AppImage.van,
                                      height: isTablet(context)
                                          ? 28.40.h
                                          : 14.20.h,
                                      width: isTablet(context)
                                          ? 28.40.w
                                          : 14.20.w,
                                      color: AppColors.white,
                                    ),
                                    SizedBox(width: 7.10.w),
                                    TextView(
                                      text: 'Advance',
                                      textStyle: TextStyle(
                                        fontFamily: 'DMSans',
                                        fontSize: 15.60.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),

                  // Container(
                  //   width: double.infinity,
                  //   padding: EdgeInsets.symmetric(
                  //     horizontal: 12.w,
                  //     vertical: 10.w,
                  //   ),
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(10.r),
                  //     color: AppColors.red_bar.withOpacity(.1),
                  //     border: Border.all(color: AppColors.red_bar),
                  //   ),
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       TextView(
                  //         text: 'Comment',
                  //         textStyle: TextStyle(
                  //           fontFamily: 'DMSans',
                  //           fontSize: 15.2.sp,
                  //           fontWeight: FontWeight.w500,
                  //           color: AppColors.red_bar,
                  //         ),
                  //       ),
                  //       SizedBox(height: 6.10.h),
                  //       TextView(
                  //         text: '',
                  //         textStyle: TextStyle(
                  //           fontFamily: 'DMSans',
                  //           fontSize: 15.0.sp,
                  //           fontWeight: FontWeight.w500,
                  //           color: AppColors.reminder,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
