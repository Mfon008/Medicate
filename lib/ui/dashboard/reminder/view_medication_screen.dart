import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicate_app/core/app_assets/image.dart';
import 'package:medicate_app/core/config/colors.dart';
import '../../widget/button.dart';
import '../../widget/text.dart';

class ViewMedicationScreen extends StatelessWidget {
  const ViewMedicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.white,
        toolbarHeight: 80.0,
        title: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GlobalNavigator(),
              TextView(
                text: 'View Medication',
                textStyle: TextStyle(
                  fontFamily: 'GoogleSans',
                  fontSize: 17.2.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.deep,
                ),
              ),
              SizedBox(height: 30.h, width: 30.w),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20.w, horizontal: 16.w),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.w, horizontal: 16.w),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(4.w),
                        decoration: BoxDecoration(
                          color: AppColors.yellow,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      TextView(
                        text: 'Ongoing',
                        textStyle: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.deep,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 56.w),
                  TextView(
                    text: '1/5 days left',
                    textStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.infoGrey,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  vertical: 16.20.w,
                  horizontal: 16.w,
                ),
                decoration: BoxDecoration(
                  color: AppColors.dashboard,
                  borderRadius: BorderRadius.circular(8.2),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextView(
                      text: 'Medication Name',
                      textStyle: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 12.8.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.infoGrey,
                      ),
                    ),
                    SizedBox(height: 4.10.h),
                    TextView(
                      text: 'Medication for Headache',
                      textStyle: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 14.8.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.reminder,
                      ),
                    ),
                    SizedBox(height: 5.10.h),
                    Divider(color: AppColors.infoGrey, thickness: .14),
                    SizedBox(height: 5.10.h),
                    TextView(
                      text: 'Drug Name',
                      textStyle: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 12.8.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.infoGrey,
                      ),
                    ),
                    SizedBox(height: 4.10.h),
                    TextView(
                      text: 'Panadol',
                      textStyle: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 14.8.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.reminder,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 30.w,
                        horizontal: 20..w,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    SizedBox(height: 5.10.h),
                    Divider(color: AppColors.infoGrey, thickness: .14),
                    SizedBox(height: 5.10.h),
                    TextView(
                      text: 'Medication Type',
                      textStyle: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 12.8.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.infoGrey,
                      ),
                    ),
                    SizedBox(height: 6.10.h),
                    Row(
                      children: [
                        SvgPicture.asset(
                          AppImage.pills,
                          color: AppColors.primary,
                        ),
                        SizedBox(width: 6.10.h),
                        TextView(
                          text: 'Pills',
                          textStyle: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 14.8.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.reminder,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.10.h),
                    Divider(color: AppColors.infoGrey, thickness: .14),
                    SizedBox(height: 5.10.h),
                    TextView(
                      text: 'Description',
                      textStyle: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 12.8.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.infoGrey,
                      ),
                    ),
                    SizedBox(height: 4.10.h),
                    TextView(
                      text: 'Pain Relief',
                      textStyle: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 14.8.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.reminder,
                      ),
                    ),
                    SizedBox(height: 10.h),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              TextView(
                text: 'SET SCHEDULE AND DOSAGE',
                textStyle: TextStyle(
                  fontFamily: 'GoogleSans',
                  fontSize: 13.6.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.grey1,
                ),
              ),
              SizedBox(height: 10.h),
              Divider(color: AppColors.infoGrey, thickness: .2),
              SizedBox(height: 5.10.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  vertical: 16.20.w,
                  horizontal: 16.w,
                ),
                decoration: BoxDecoration(
                  color: AppColors.dashboard,
                  borderRadius: BorderRadius.circular(8.2),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextView(
                      text: 'Dosage',
                      textStyle: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 12.8.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.infoGrey,
                      ),
                    ),
                    SizedBox(height: 4.10.h),
                    TextView(
                      text: '2 tablets',
                      textStyle: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 14.8.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.reminder,
                      ),
                    ),
                    SizedBox(height: 5.10.h),
                    Divider(color: AppColors.infoGrey, thickness: .14),
                    SizedBox(height: 5.10.h),
                    TextView(
                      text: 'Start Date & Time',
                      textStyle: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 12.8.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.infoGrey,
                      ),
                    ),
                    SizedBox(height: 4.10.h),
                    TextView(
                      text: '13 Feb, 2025 10:30 AM',
                      textStyle: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 14.8.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.reminder,
                      ),
                    ),
                    SizedBox(height: 5.10.h),
                    Divider(color: AppColors.infoGrey, thickness: .14),
                    SizedBox(height: 5.10.h),
                    TextView(
                      text: 'Duration',
                      textStyle: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 12.8.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.infoGrey,
                      ),
                    ),
                    SizedBox(height: 4.10.h),
                    Row(
                      children: [
                        TextView(
                          text: '1/5 days',
                          letterSpacing: 1,
                          textStyle: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 14.8.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.reminder,
                          ),
                        ),
                        SizedBox(width: 6.10.h),
                        TextView(
                          text: 'Show more',
                          textStyle: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 12.8.sp,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w400,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.10.h),
                    Divider(color: AppColors.infoGrey, thickness: .14),
                    SizedBox(height: 5.10.h),
                    TextView(
                      text: 'End Date',
                      textStyle: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 12.8.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.infoGrey,
                      ),
                    ),
                    SizedBox(height: 4.10.h),
                    TextView(
                      text: '18 Feb, 2025',
                      textStyle: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 14.8.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.reminder,
                      ),
                    ),
                    SizedBox(height: 5.10.h),
                    Divider(color: AppColors.infoGrey, thickness: .14),
                    SizedBox(height: 5.10.h),
                    TextView(
                      text: 'No of times to be taken',
                      textStyle: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 12.8.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.infoGrey,
                      ),
                    ),
                    SizedBox(height: 4.10.h),
                    TextView(
                      text: 'Thrice Daily',
                      textStyle: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 14.8.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.reminder,
                      ),
                    ),
                    SizedBox(height: 5.10.h),
                    Divider(color: AppColors.infoGrey, thickness: .14),
                    SizedBox(height: 5.10.h),
                    TextView(
                      text: 'Add Note',
                      textStyle: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 12.8.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.infoGrey,
                      ),
                    ),
                    SizedBox(height: 4.10.h),
                    TextView(
                      text: 'Always eat before you take the drugs.',
                      textStyle: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 14.8.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.reminder,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              TextView(
                text: 'NOTIFICATION CHANNEL',
                textStyle: TextStyle(
                  fontFamily: 'GoogleSans',
                  fontSize: 13.6.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.grey1,
                ),
              ),
              SizedBox(height: 5.10.h),
              Divider(color: AppColors.infoGrey, thickness: .2),
              SizedBox(height: 5.10.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  vertical: 10.w,
                  horizontal: 22.0.w,
                ),
                decoration: BoxDecoration(
                  color: AppColors.dashboard,
                  borderRadius: BorderRadius.circular(8.2),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.h),
                    ...['EMAIL', 'SMS', 'Push', 'Whatsapp', 'Phone Call'].map(
                      (e) => Padding(
                        padding: EdgeInsets.only(bottom: 20.w),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(2.w),
                              decoration: BoxDecoration(
                                color: AppColors.black,
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: 12.w),
                            TextView(
                              text: e,
                              textStyle: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.0.h),
              ButtonWidget(
                border: 100.r,
                buttonColor: AppColors.primary,
                buttonText: 'Edit Medication',
                color: AppColors.white,
                buttonBorderColor: AppColors.transparent,
                onPressed: () {},
                fontSize: 14.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
