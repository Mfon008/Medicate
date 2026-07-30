// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/app_assets/image.dart';
import '../../../../core/config/colors.dart';
import '../../../../core/core_folder/app/app.router.dart';
import '../../../../main.dart';
import '../../../widget/text.dart';
import '../../../widget/text_form_widget.dart';

class BusinessProviderWholesaleScreen extends StatelessWidget {
  BusinessProviderWholesaleScreen({super.key});
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    bool isTablet(BuildContext context) =>
        MediaQuery.of(context).size.shortestSide >= 600;
    return Scaffold(
      backgroundColor: AppColors.dashboard,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        automaticallyImplyLeading: false,
        toolbarHeight: 80.0,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 1.0.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.inactive.withValues(alpha: .1),
                  border: Border.all(
                    color: AppColors.inactive.withValues(alpha: .4),
                  ),
                ),
                child: IconButton(
                  icon: SvgPicture.asset(
                    AppImage.burger,
                    color: AppColors.primary,
                    height: isTablet(context) ? 32.h : 12.h,
                    width: isTablet(context) ? 32.w : 12.w,
                  ),
                  onPressed: () => navigate.navigateTo(
                    Routes.specialistsProvidersMoreScreen,
                  ), // makes ripple effect round
                ),
              ),
              SvgPicture.asset(AppImage.applogoSvg, height: 28.h, width: 28.w),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 2.4.w),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.inactive.withOpacity(.1),
                      border: Border.all(
                        color: AppColors.inactive.withOpacity(.4),
                      ),
                    ),
                    child: IconButton(
                      icon: SvgPicture.asset(
                        AppImage.cart,
                        height: isTablet(context) ? 40.h : 20.h,
                        width: isTablet(context) ? 40.w : 20.w,
                        color: AppColors.primary,
                      ),
                      onPressed: () {},
                      // navigate.navigateTo(Routes.emptyNotification),
                      splashRadius: 28,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Container(
                    margin: EdgeInsets.only(right: 2.4.w),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.inactive.withOpacity(.1),
                      border: Border.all(
                        color: AppColors.inactive.withOpacity(.4),
                      ),
                    ),
                    child: IconButton(
                      icon: SvgPicture.asset(
                        AppImage.bell,
                        height: isTablet(context) ? 40.h : 20.h,
                        width: isTablet(context) ? 40.w : 20.w,
                        color: AppColors.primary,
                      ),
                      onPressed: () {},
                      // navigate.navigateTo(Routes.emptyNotification),
                      splashRadius: 28,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextView(
              text: 'Marketplace',
              textStyle: TextStyle(
                fontFamily: 'Arial',
                fontSize: 18.20.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
            ),
            SizedBox(height: 10.h),
            TextView(
              text:
                  'Order directly from partnered manufacturers and distributors. Tiered pricing, MOQ discounts, and scheduled or instant delivery.',
              textStyle: TextStyle(
                fontFamily: 'GoogleSans',
                fontSize: 14.20.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.black,
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(
                  child: TextFormWidget(
                    label: 'Search products, manufactures, SKU...',
                    labelStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 14.60.sp,
                      color: AppColors.fineGrey,
                      fontWeight: FontWeight.w400,
                    ),
                    isFilled: true,
                    borderTopLeft: 10.r,
                    borderTopRight: 10.r,
                    borderBottomLeft: 10.r,
                    borderBottomRight: 10.r,
                    fillColor: AppColors.white,
                    prefixWidget: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 12.6.w,
                      ),
                      child: SvgPicture.asset(AppImage.search),
                    ),
                    onChange: (value) {},
                  ),
                ),
                SizedBox(width: 22.40.w),
                SvgPicture.asset(
                  AppImage.filter,
                  color: AppColors.grey1,
                  height: 15.20.h,
                  width: 15.20.w,
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(8.10.w),
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
                        height: 198.h,
                        decoration: BoxDecoration(
                          color: AppColors.grey,
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(
                            color: const Color.fromARGB(255, 236, 237, 237),
                          ),
                        ),
                        child: Image.asset(
                          AppImage.med_image,
                          height: 170.h,
                          width: 170.w,
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
                  SizedBox(height: 10.h),
                  Padding(
                    padding: EdgeInsets.all(12.w),
                    child: Column(
                      children: [
                        TextView(
                          text: 'Amoxicillin 500mg (Carton of 100 packs)',
                          textStyle: TextStyle(
                            fontFamily: 'GoogleSans',
                            fontSize: 17.20.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.reminder,
                            letterSpacing: -0.21,
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Divider(color: AppColors.infoGrey1),
                        SizedBox(height: 6.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextView(
                              text: 'Pack Size:',
                              textStyle: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 14.20.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.infoGrey,
                              ),
                            ),
                            TextView(
                              text: '100 / carton',
                              textStyle: TextStyle(
                                fontFamily: 'GoogleSans',
                                fontSize: 14.20.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.reminder,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextView(
                              text: 'Available Stock:',
                              textStyle: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 14.20.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.infoGrey,
                              ),
                            ),
                            TextView(
                              text: '120 units',
                              textStyle: TextStyle(
                                fontFamily: 'GoogleSans',
                                fontSize: 14.20.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.app_green,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextView(
                              text: 'MOQ:',
                              textStyle: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 14.20.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.infoGrey,
                              ),
                            ),
                            TextView(
                              text: '2 cartons',
                              textStyle: TextStyle(
                                fontFamily: 'GoogleSans',
                                fontSize: 14.20.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.reminder,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextView(
                              text: 'NAFDAC Reg No:',
                              textStyle: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 14.20.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.infoGrey,
                              ),
                            ),
                            TextView(
                              text: '04-1290',
                              textStyle: TextStyle(
                                fontFamily: 'GoogleSans',
                                fontSize: 15.20.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.reminder,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextView(
                              text: 'Expiry Date:',
                              textStyle: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 14.20.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.infoGrey,
                              ),
                            ),
                            TextView(
                              text: '11/2028',
                              textStyle: TextStyle(
                                fontFamily: 'GoogleSans',
                                fontSize: 15.20.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.reminder,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 6.h),
                        Divider(color: AppColors.infoGrey1),
                        SizedBox(height: 6.h),
                        Divider(color: AppColors.infoGrey1),
                        SizedBox(height: 10.h),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(10.w),
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
                                  fontSize: 14.20.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.black,
                                ),
                              ),
                              SizedBox(height: 10.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 6.60.w,
                                        horizontal: 8.w,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColors.appWhite,
                                        borderRadius: BorderRadius.circular(
                                          20.r,
                                        ),
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
                                  ),
                                  SizedBox(width: 10.w),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 6.60.w,
                                        horizontal: 8.w,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColors.appWhite,
                                        borderRadius: BorderRadius.circular(
                                          20.r,
                                        ),
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

                                          //
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
                                  ),
                                ],
                              ),
                              SizedBox(height: 5.10.w),
                            ],
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Divider(color: AppColors.infoGrey1),
                        SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
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
                              height: 30.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7.92.r),
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
                                  TextView(
                                    text: '2',
                                    textStyle: TextStyle(
                                      fontFamily: 'GoogleSans',
                                      fontSize: 14.80.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.reminder,
                                    ),
                                  ),
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
                        SizedBox(height: 23.0.h),
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 8.w,
                            horizontal: 12.w,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(40.r),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                AppImage.cart,
                                height: isTablet(context) ? 38.40.h : 20.h,
                                width: isTablet(context) ? 38.40.w : 20.w,
                                color: AppColors.white,
                              ),
                              SizedBox(width: 10.w),
                              TextView(
                                text: 'Add to Cart',
                                textStyle: TextStyle(
                                  fontFamily: 'GoogleSans',
                                  fontSize: 16.90.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8.10.h),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
