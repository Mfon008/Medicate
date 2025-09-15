// ignore_for_file: must_be_immutable, unused_field

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicate_app/core/app_assets/image.dart';
import 'package:medicate_app/core/config/colors.dart';

import '../../../widget/button.dart';
import '../../../widget/text.dart';

class ProviderClass {
  String? image;
  String? text;
  ProviderClass({this.image, this.text});
}

class FundWalletPayScreen extends StatefulWidget {
  FundWalletPayScreen({super.key, this.screenName, this.amount});
  String? screenName;
  String? amount;

  @override
  State<FundWalletPayScreen> createState() => _FundWalletPayScreenState();
}

class _FundWalletPayScreenState extends State<FundWalletPayScreen> {
  final List<ProviderClass> providerInfo = [
    ProviderClass(image: AppImage.momo, text: 'Momo'),
    ProviderClass(image: AppImage.smart_cash, text: 'Smart Cash'),
    ProviderClass(image: AppImage.glo, text: 'GloMo'),
    ProviderClass(image: AppImage.paga, text: 'Paga'),
  ];

  String _tap = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey,
      appBar: AppBar(
        backgroundColor: AppColors.appWhite,
        surfaceTintColor: Colors.transparent, // removes Material3 tint
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.all(14.w),
          child: GlobalNavigator(),
        ),
        title: TextView(
          text: 'Pay with ${widget.screenName}',
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
        padding: EdgeInsets.symmetric(vertical: 30.w, horizontal: 16.20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 12.w, horizontal: 15.6.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: AppColors.appWhite,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                    text: 'Amount',
                    textStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 15.2.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: 10.h),

                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      vertical: 23.0.w,
                      horizontal: 20.w,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: AppColors.skyBlue,
                    ),
                    child: Center(
                      child: TextView(
                        text: '₦${widget.amount}',
                        textStyle: TextStyle(
                          // fontFamily: 'GoogleSans',
                          fontSize: 21.6.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            TextView(
              text: 'Select Provider',
              textStyle: TextStyle(
                fontFamily: 'GoogleSans',
                fontSize: 17.2.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
            ),
            SizedBox(height: 15.20.h),

            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 20.w, horizontal: 15.6.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: AppColors.appWhite,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...providerInfo.map(
                      (e) => selectProvider(image: e.image, text: e.text),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 130.h),
            SizedBox(
              width: double.infinity,
              child: DottedBorder(
                options: RoundedRectDottedBorderOptions(
                  dashPattern: [5, 5],
                  strokeWidth: 1,
                  radius: Radius.circular(10),
                  color: AppColors.yellow,
                ),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    vertical: 20.w,
                    horizontal: 11.20.w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: AppColors.fadedyellow,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.info_outline,
                            color: AppColors.yellow,
                            size: 20.sp,
                          ),
                          SizedBox(width: 10.w),
                          SizedBox(
                            width: 280.w,
                            child: TextView(
                              text:
                                  'Please ensure you have the following ready to fund your wallet',
                              maxLines: 2,
                              textStyle: TextStyle(
                                fontFamily: 'GoogleSans',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.deep,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: 10.w),
                          Container(
                            padding: EdgeInsets.all(2.w),
                            decoration: BoxDecoration(
                              color: AppColors.deep,
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(width: 12.w),
                          SizedBox(
                            width: 280.w,
                            child: TextView(
                              text:
                                  'You are registered with any of the above mobile money provider',
                              maxLines: 2,
                              textStyle: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.reminder,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: 10.w),
                          Container(
                            padding: EdgeInsets.all(2.w),
                            decoration: BoxDecoration(
                              color: AppColors.deep,
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(width: 12.w),
                          SizedBox(
                            width: 280.w,
                            child: TextView(
                              text:
                                  'Your mobile money wallet has enough balance.',
                              maxLines: 2,
                              textStyle: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.reminder,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: 10.w),
                          Container(
                            padding: EdgeInsets.all(2.w),
                            decoration: BoxDecoration(
                              color: AppColors.deep,
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(width: 12.w),
                          SizedBox(
                            width: 280.w,
                            child: TextView(
                              text: 'You have the correct transaction PIN.',
                              maxLines: 2,
                              textStyle: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.reminder,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.h),

            ButtonWidget(
              border: 100.r,
              buttonColor: AppColors.primary,
              buttonText: 'Pay with ${widget.screenName}',
              color: AppColors.white,
              buttonBorderColor: AppColors.primary,
              onPressed: () {
                // if (formKey.currentState!.validate()) {
                //   navigate.navigateTo(Routes.welcomeScreen);
                // }
              },
            ),
            SizedBox(height: 16.30.h),
          ],
        ),
      ),
    );
  }

  selectProvider({required image, required text}) => GestureDetector(
    onTap: () {
      _tap = text;
      setState(() {});
    },
    child: Container(
      padding: text == 'Smart Cash'
          ? EdgeInsets.only(top: 22.w, bottom: 22.w, right: 12.w, left: 12.w)
          : EdgeInsets.all(22.w),
      margin: EdgeInsets.only(right: text == 'Paga' ? 2.0.w : 10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          width: 1.52,
          color: _tap == text ? AppColors.primary : AppColors.skyBlue,
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: text == 'Paga'
                ? EdgeInsets.only(
                    top: 22.34.w,
                    bottom: 22.34.w,
                    right: 10.w,
                    left: 10.w,
                  )
                : EdgeInsets.all(10.w),

            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.skyBlue,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                50,
              ), // Half of the image's width/height for a circle
              child: Image.asset(
                image,
                width: 34
                    .r, // Ensure width and height are equal for a perfect circle
                height: text == 'Paga' ? 10.42.r : 34.r,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 12.20.h),
          TextView(
            text: text,
            textStyle: TextStyle(
              fontFamily: 'Arial',
              fontSize: 13.2.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.reminder,
            ),
          ),
        ],
      ),
    ),
  );
}
