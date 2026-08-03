// ignore_for_file: deprecated_member_use, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/app_assets/image.dart';
import '../../../../core/config/colors.dart';
import '../../../widget/button.dart';
import '../../../widget/text.dart';

class SpecialistsProviderViewProductScreen extends StatelessWidget {
  SpecialistsProviderViewProductScreen({super.key});
  int currentPage = 0;

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
          text: 'View product',
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
                children: [
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 262.h,
                        decoration: BoxDecoration(
                          color: AppColors.grey,
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(
                            color: const Color.fromARGB(255, 236, 237, 237),
                          ),
                        ),
                        child: Image.asset(
                          AppImage.med_image,
                          height: 262.h,
                          width: 242.w,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Positioned(
                        top: 130,
                        right: 6.0,
                        child: Container(
                          padding: EdgeInsets.all(10.w),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primary,
                          ),
                          child: SvgPicture.asset(
                            AppImage.arrow_right,
                            color: AppColors.white,
                            height: 12.h,
                            width: 12.h,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 130,
                        left: 10,
                        child: Container(
                          padding: EdgeInsets.all(8.0.w),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.primary,
                              width: 1.6,
                            ),
                          ),
                          child: SvgPicture.asset(
                            AppImage.arrow_left,
                            color: AppColors.primary,
                            height: 12.h,
                            width: 11.2.h,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 1,
                        bottom: 1,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.80.w,
                            vertical: 6.w,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(6.r),
                              bottomLeft: Radius.circular(10.r),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: List.generate(
                              2,
                              (index) => AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                margin: EdgeInsets.symmetric(horizontal: 3.2.w),
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: currentPage == index
                                      ? AppColors.primary
                                      : AppColors.infoGrey,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 2.60.w,
                          horizontal: 12.8.w,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.skyBlue,
                          borderRadius: BorderRadius.circular(20.r),
                          border: Border.all(
                            color: AppColors.cool_blue,
                            width: 1.2,
                          ),
                        ),
                        child: TextView(
                          text: 'ANTIBIOTICS',
                          textStyle: TextStyle(
                            fontFamily: 'GoogleSans',
                            fontSize: 14.20.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 2.60.w,
                          horizontal: 12.8.w,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          border: Border.all(
                            color: AppColors.infoGrey1,
                            width: 1.2,
                          ),
                        ),
                        child: TextView(
                          text: 'SKU: AMX-500-C100',
                          textStyle: TextStyle(
                            fontFamily: 'GoogleSans',
                            fontSize: 14.20.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.reminder,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 2.60.w,
                          horizontal: 12.8.w,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          border: Border.all(
                            color: AppColors.app_green,
                            width: 1.2,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              AppImage.validate,
                              height: 14.6.h,
                              width: 12.w,
                            ),
                            SizedBox(width: 6.2.w),
                            TextView(
                              text: 'Validated',
                              textStyle: TextStyle(
                                fontFamily: 'GoogleSans',
                                fontSize: 15.20.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.app_green,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Column(
                    children: [
                      TextView(
                        text: 'Amoxicillin 500mg (Carton of 100 packs)',
                        textStyle: TextStyle(
                          fontFamily: 'GoogleSans',
                          fontSize: 18.20.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.reminder,
                          letterSpacing: -0.21,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextView(
                            text: 'Manufacturer: ',
                            textStyle: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 14.20.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.infoGrey,
                            ),
                          ),
                          TextView(
                            text: 'Fidson',
                            textStyle: TextStyle(
                              fontFamily: 'GoogleSans',
                              fontSize: 14.20.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.reminder,
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.reminder,
                              decorationThickness: 0.60,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 13.0.h),
                      Row(
                        children: [
                          TextView(
                            text: '₦17,500',
                            textStyle: TextStyle(
                              fontFamily: 'GoogleSans',
                              fontSize: 19.80.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                            ),
                          ),
                          TextView(
                            text: '/carton',
                            textStyle: TextStyle(
                              fontFamily: 'GoogleSans',
                              fontSize: 14.80.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.infoGrey,
                            ),
                          ),
                          Spacer(),
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 2.60.w,
                              horizontal: 12.8.w,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              border: Border.all(
                                color: AppColors.infoGrey1,
                                width: 1.2,
                              ),
                            ),
                            child: TextView(
                              text: 'Min. Order: 2 Cartons',
                              textStyle: TextStyle(
                                fontFamily: 'GoogleSans',
                                fontSize: 12.90.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.reminder,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Divider(color: AppColors.infoGrey1),
                      SizedBox(height: 10.h),
                      TextView(
                        text:
                            'Broad-spectrum antibiotic capsules. Effective against a wide range of gram-positive and gram-negative bacterial infections.',
                        textStyle: TextStyle(
                          fontFamily: 'GoogleSans',
                          fontSize: 15.80.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.reminder,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Container(
                        margin: EdgeInsets.only(bottom: 10.w),
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 8.w,
                        ),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.infoGrey1),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.all(10.w),
                              decoration: BoxDecoration(
                                color: AppColors.grey,
                                shape: BoxShape.circle,
                              ),
                              child: SvgPicture.asset(
                                AppImage.stack_pack,
                                color: AppColors.grey1,
                                height: 20.h,
                                width: 20.6.w,
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextView(
                                  text: 'Pack Size',
                                  textStyle: TextStyle(
                                    fontFamily: 'GoogleSans',
                                    fontSize: 14.80.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.infoGrey,
                                  ),
                                ),
                                TextView(
                                  text: '100 / carton',
                                  textStyle: TextStyle(
                                    fontFamily: 'GoogleSans',
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.reminder1,
                                    letterSpacing: -0.21,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10.w),
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 8.w,
                        ),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.infoGrey1),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.all(10.w),
                              decoration: BoxDecoration(
                                color: AppColors.grey,
                                shape: BoxShape.circle,
                              ),
                              child: SvgPicture.asset(
                                AppImage.validate,
                                color: AppColors.grey1,
                                height: 17.20.h,
                                width: 17.6.w,
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextView(
                                  text: 'Stock Status',
                                  textStyle: TextStyle(
                                    fontFamily: 'GoogleSans',
                                    fontSize: 14.80.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.infoGrey,
                                  ),
                                ),
                                TextView(
                                  text: '120 available',
                                  textStyle: TextStyle(
                                    fontFamily: 'GoogleSans',
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.app_green,
                                    letterSpacing: -0.21,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(16.w),
                        decoration: BoxDecoration(
                          color: AppColors.grey,
                          borderRadius: BorderRadius.circular(8.0.r),
                          border: Border.all(
                            color: const Color.fromARGB(255, 236, 237, 237),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextView(
                              text: 'Volume Pricing',
                              textStyle: TextStyle(
                                fontFamily: 'GoogleSans',
                                fontSize: 14.90.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.black,
                              ),
                            ),
                            SizedBox(height: 10.h),

                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 6.60.w,
                                horizontal: 12.w,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.appWhite,
                                borderRadius: BorderRadius.circular(20.r),
                                border: Border.all(
                                  color: const Color.fromARGB(
                                    255,
                                    236,
                                    237,
                                    237,
                                  ),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextView(
                                    text: '≥ 6:',
                                    textStyle: TextStyle(
                                      fontFamily: 'Arial',
                                      fontSize: 15.60.sp,
                                      fontWeight: FontWeight.w300,
                                      color: AppColors.black,
                                    ),
                                  ),
                                  // SizedBox(width: 50.h),
                                  TextView(
                                    text: '₦17,500',
                                    textStyle: TextStyle(
                                      fontFamily: 'GoogleSans',
                                      fontSize: 15.80.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10.w),
                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 6.60.w,
                                horizontal: 12.w,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.appWhite,
                                borderRadius: BorderRadius.circular(20.r),
                                border: Border.all(
                                  color: const Color.fromARGB(
                                    255,
                                    236,
                                    237,
                                    237,
                                  ),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextView(
                                    text: '≥ 20:',
                                    textStyle: TextStyle(
                                      fontFamily: 'Arial',
                                      fontSize: 15.60.sp,
                                      fontWeight: FontWeight.w300,
                                      color: AppColors.black,
                                    ),
                                  ),

                                  //
                                  TextView(
                                    text: '₦16,500',
                                    textStyle: TextStyle(
                                      fontFamily: 'GoogleSans',
                                      fontSize: 15.80.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: 5.10.w),
                          ],
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 6.2.w,
                          horizontal: 5.68.w,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(color: AppColors.infoGrey1),
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(14.w),
                              decoration: BoxDecoration(
                                color: AppColors.grey,
                                borderRadius: BorderRadius.circular(8.0.r),
                              ),
                              child: TextView(
                                text: 'Batch & Registration Details',
                                textStyle: TextStyle(
                                  fontFamily: 'GoogleSans',
                                  fontSize: 14.90.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.68.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Divider(color: AppColors.infoGrey1),
                                  SizedBox(height: 5.10.h),
                                  TextView(
                                    text: 'NAFDAC Reg No:',
                                    textStyle: TextStyle(
                                      fontFamily: 'GoogleSans',
                                      fontSize: 12.90.sp,
                                      fontWeight: FontWeight.w300,
                                      color: AppColors.infoGrey,
                                    ),
                                  ),
                                  SizedBox(height: 2.h),
                                  TextView(
                                    text: '04-1290',
                                    textStyle: TextStyle(
                                      fontFamily: 'GoogleSans',
                                      fontSize: 15.90.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.black,
                                    ),
                                  ),
                                  SizedBox(height: 12.h),
                                  TextView(
                                    text: 'Batch Number:',
                                    textStyle: TextStyle(
                                      fontFamily: 'GoogleSans',
                                      fontSize: 12.90.sp,
                                      fontWeight: FontWeight.w300,
                                      color: AppColors.infoGrey,
                                    ),
                                  ),
                                  SizedBox(height: 2.h),
                                  TextView(
                                    text: 'FD-AMX-2026A',
                                    textStyle: TextStyle(
                                      fontFamily: 'GoogleSans',
                                      fontSize: 15.90.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.black,
                                    ),
                                  ),
                                  SizedBox(height: 12.h),
                                  TextView(
                                    text: 'Manufacturer',
                                    textStyle: TextStyle(
                                      fontFamily: 'GoogleSans',
                                      fontSize: 12.90.sp,
                                      fontWeight: FontWeight.w300,
                                      color: AppColors.infoGrey,
                                    ),
                                  ),
                                  SizedBox(height: 2.h),
                                  TextView(
                                    text: 'Fidson',
                                    textStyle: TextStyle(
                                      fontFamily: 'GoogleSans',
                                      fontSize: 15.90.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.black,
                                    ),
                                  ),
                                  SizedBox(height: 12.h),
                                  TextView(
                                    text: 'Serial Number:',
                                    textStyle: TextStyle(
                                      fontFamily: 'GoogleSans',
                                      fontSize: 12.90.sp,
                                      fontWeight: FontWeight.w300,
                                      color: AppColors.infoGrey,
                                    ),
                                  ),
                                  SizedBox(height: 2.h),
                                  TextView(
                                    text: 'SN-AMOX-500-AMX',
                                    textStyle: TextStyle(
                                      fontFamily: 'GoogleSans',
                                      fontSize: 15.90.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.black,
                                    ),
                                  ),
                                  SizedBox(height: 12.h),
                                  TextView(
                                    text: 'Manufactured Date',
                                    textStyle: TextStyle(
                                      fontFamily: 'GoogleSans',
                                      fontSize: 12.90.sp,
                                      fontWeight: FontWeight.w300,
                                      color: AppColors.infoGrey,
                                    ),
                                  ),
                                  SizedBox(height: 2.h),
                                  TextView(
                                    text: '12/2025',
                                    textStyle: TextStyle(
                                      fontFamily: 'GoogleSans',
                                      fontSize: 15.90.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.black,
                                    ),
                                  ),
                                  SizedBox(height: 12.h),
                                  TextView(
                                    text: 'Expiry Date:',
                                    textStyle: TextStyle(
                                      fontFamily: 'GoogleSans',
                                      fontSize: 12.90.sp,
                                      fontWeight: FontWeight.w300,
                                      color: AppColors.infoGrey,
                                    ),
                                  ),
                                  SizedBox(height: 2.h),
                                  TextView(
                                    text: '11/2028',
                                    textStyle: TextStyle(
                                      fontFamily: 'GoogleSans',
                                      fontSize: 15.90.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.red,
                                    ),
                                  ),
                                  SizedBox(height: 12.h),
                                  TextView(
                                    text: 'Status:',
                                    textStyle: TextStyle(
                                      fontFamily: 'GoogleSans',
                                      fontSize: 12.90.sp,
                                      fontWeight: FontWeight.w300,
                                      color: AppColors.infoGrey,
                                    ),
                                  ),
                                  SizedBox(height: 2.h),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(3.4.w),
                                        decoration: BoxDecoration(
                                          color: AppColors.app_green,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          Icons.check,
                                          size: 12.sp,
                                          color: AppColors.white,
                                          weight: 2,
                                        ),
                                      ),
                                      SizedBox(width: 5.0.w),
                                      TextView(
                                        text: 'Approved',
                                        textStyle: TextStyle(
                                          fontFamily: 'GoogleSans',
                                          fontSize: 14.90.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.app_green,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 12.h),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Divider(color: AppColors.infoGrey1),
                      SizedBox(height: 5.10.h),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextView(
                            text: 'Quantity',
                            textStyle: TextStyle(
                              fontFamily: 'GoogleSans',
                              fontSize: 19.80.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                            ),
                          ),
                          Spacer(),
                          Container(
                            height: 44.0.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7.92.r),
                              border: Border.all(
                                color: const Color.fromARGB(255, 236, 237, 237),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.remove,
                                    size: 14.0.sp,
                                    color: AppColors.infoGrey,
                                  ),
                                ),
                                SizedBox(width: 20.w),
                                TextView(
                                  text: '2',
                                  textStyle: TextStyle(
                                    fontFamily: 'GoogleSans',
                                    fontSize: 14.80.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.reminder,
                                  ),
                                ),
                                SizedBox(width: 20.w),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.add,
                                    size: 14.0.sp,
                                    color: AppColors.reminder,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          vertical: 10.w,
                          horizontal: 12.40.w,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.grey,
                          border: Border.all(color: AppColors.infoGrey1),
                          borderRadius: BorderRadius.circular(8.0.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextView(
                              text: 'Line total',
                              textStyle: TextStyle(
                                fontFamily: 'GoogleSans',
                                fontSize: 14.90.sp,
                                fontWeight: FontWeight.w300,
                                color: AppColors.black,
                              ),
                            ),
                            TextView(
                              text: '₦18,500',
                              textStyle: TextStyle(
                                fontFamily: 'GoogleSans',
                                fontSize: 22.40.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 10.w),
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.primary,width: 1.42),
                                borderRadius: BorderRadius.circular(40.r),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    AppImage.cart,
                                    height: isTablet(context) ? 38.40.h : 20.h,
                                    width: isTablet(context) ? 38.40.w : 20.w,
                                    color: AppColors.primary,
                                  ),
                                  SizedBox(width: 7.10.w),
                                  TextView(
                                    text: 'Add to Cart',
                                    textStyle: TextStyle(
                                      fontFamily: 'DMSans',
                                      fontSize: 16.90.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(width: 12.w),

                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(vertical: 10.w),
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(40.r),
                              ),
                              child: TextView(
                                text: 'Buy Now',
                                textStyle: TextStyle(
                                  fontFamily: 'DMSans',
                                  fontSize: 16.90.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
