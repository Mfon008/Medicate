// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medicate_app/ui/widget/text_form_widget.dart';
import '../../../core/app_assets/image.dart';
import '../../../core/config/colors.dart';
import '../../../core/connect_end/model/pharm_dash_mode_model.dart';
import '../../../core/core_folder/app/app.router.dart';
import '../../../core/core_folder/manager/shared_preference.dart';
import '../../../main.dart';
import '../../widget/text.dart';

class PharmacyHomeScreen extends StatefulWidget {
  const PharmacyHomeScreen({super.key});

  @override
  State<PharmacyHomeScreen> createState() => _PharmacyHomeScreenState();
}

class _PharmacyHomeScreenState extends State<PharmacyHomeScreen> {
  String onTappedBox = 'Active Patients';
  List<PharmDashModeModel> onTappedBoxList = [
    PharmDashModeModel(icon: AppImage.active_patients, text: 'Active Patients'),
    PharmDashModeModel(
      icon: AppImage.month_order,
      text: 'This Month\'s Orders',
    ),
    PharmDashModeModel(icon: AppImage.not_set_up, text: 'Notifications Set Up'),
  ];
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
                  color: AppColors.inactive.withOpacity(.1),
                  border: Border.all(color: AppColors.inactive.withOpacity(.4)),
                ),
                child: IconButton(
                  icon: SvgPicture.asset(
                    AppImage.burger,
                    color: AppColors.primary,
                    height: isTablet(context) ? 32.h : 12.h,
                    width: isTablet(context) ? 32.w : 12.w,
                  ),
                  onPressed: () => navigate.navigateTo(
                    Routes.pharmMoreScreen,
                  ), // makes ripple effect round
                ),
              ),
              SvgPicture.asset(AppImage.applogoSvg, height: 28.h, width: 28.w),
              Container(
                margin: EdgeInsets.only(right: 2.4.w),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.inactive.withOpacity(.1),
                  border: Border.all(color: AppColors.inactive.withOpacity(.4)),
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
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.8.w, vertical: 22.w),
        child: Column(
          children: [
            GestureDetector(
              onTap: () => navigate.navigateTo(Routes.profileScreen),
              child: Container(
                // margin: EdgeInsets.symmetric(horizontal: 4.0.w),
                padding: EdgeInsets.symmetric(
                  vertical: 12.w,
                  horizontal: 11.4.w,
                ),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(
                    color:
                        SharedPreferencesService
                                    .instance
                                    .usersData['memberships'] !=
                                null &&
                            SharedPreferencesService
                                    .instance
                                    .usersData['memberships'][0]['profileCompletionPercentage'] ==
                                100
                        ? AppColors.app_green
                        : AppColors.yellow,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      color:
                          SharedPreferencesService
                                      .instance
                                      .usersData['memberships'] !=
                                  null &&
                              SharedPreferencesService
                                      .instance
                                      .usersData['memberships'][0]['profileCompletionPercentage'] ==
                                  100
                          ? AppColors.app_green
                          : AppColors.yellow,
                      size: 20.sp,
                    ),
                    SizedBox(width: 10.12.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextView(
                          text:
                              SharedPreferencesService
                                          .instance
                                          .usersData['memberships'] !=
                                      null &&
                                  SharedPreferencesService
                                          .instance
                                          .usersData['memberships'][0] ==
                                      100
                              ? 'Completed'
                              : 'Complete Registration',
                          textStyle: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 15.2.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black,
                          ),
                        ),
                        TextView(
                          text:
                              SharedPreferencesService
                                          .instance
                                          .usersData['memberships'] !=
                                      null &&
                                  SharedPreferencesService
                                          .instance
                                          .usersData['memberships'][0]['profileCompletionPercentage'] !=
                                      null
                              ? 'Your registration is ${SharedPreferencesService.instance.usersData['memberships'][0]['profileCompletionPercentage']}% completed'
                              : 'Please enter your new PIN.',
                          textStyle: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 13.2.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.infoGrey,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    SvgPicture.asset(
                      AppImage.arrow_forward,
                      width: 14.20.w,
                      height: 14.20.w,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.4.h),

            ...onTappedBoxList.map(
              (e) => GestureDetector(
                onTap: () {
                  setState(() {
                    onTappedBox = e.text!;
                  });
                },
                child: Container(
                  width: double.infinity,
                  height: 60.2.h,
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  margin: EdgeInsets.only(bottom: 12.w),
                  decoration: BoxDecoration(
                    color: AppColors.appWhite,
                    border: Border.all(
                      color: onTappedBox == e.text!
                          ? AppColors.primary
                          : AppColors.infoGrey1,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(e.icon!, height: 20.h, width: 24.w),
                      SizedBox(width: 10.w),
                      TextView(
                        text: e.text!,
                        textStyle: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 14.2.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.reminder,
                        ),
                      ),
                      Spacer(),
                      TextView(
                        text: '10',
                        textStyle: TextStyle(
                          fontFamily: 'GoogleSans',
                          fontSize: 20.2.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.reminder,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 24.h),
            Container(
              constraints: BoxConstraints(
                minHeight:
                    MediaQuery.of(context).size.height *
                    .20, // Minimum height the container will have
                maxHeight:
                    MediaQuery.of(context).size.height *
                    .65, // Maximum height the container will have
              ),
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              margin: EdgeInsets.only(bottom: 12.w),
              decoration: BoxDecoration(
                color: AppColors.appWhite,
                border: Border.all(color: AppColors.infoGrey1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextView(
                      text: onTappedBox,
                      textStyle: TextStyle(
                        fontFamily: 'GoogleSans',
                        fontSize: 16.50.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.reminder,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormWidget(
                            prefixWidget: Padding(
                              padding: EdgeInsets.only(
                                left: 16.w,
                                top: 4.w,
                                bottom: 4.w,
                                right: 4.w,
                              ),
                              child: SvgPicture.asset(
                                AppImage.search,
                                color: AppColors.infoGrey,
                              ),
                            ),
                            borderBottomLeft: 12,
                            borderBottomRight: 12,
                            borderTopLeft: 12,
                            borderTopRight: 12,
                            fillColor: AppColors.grey,
                            isFilled: true,
                            label: 'Search user',
                            labelStyle: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 14.50.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.infoGrey,
                            ),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Container(
                          width: 46.0.w,
                          height: 46.50.h,
                          padding: EdgeInsets.all(15.4),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.infoGrey1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: SvgPicture.asset(AppImage.earth),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    ...[1, 1, 1].map((e) => getContainDisplayWidget()),
                    SizedBox(height: 20.h),
                    Divider(color: AppColors.grey),
                    SizedBox(height: 12.20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_back,
                            size: 22.sp,
                            color: AppColors.primary,
                          ),
                        ),
                        SizedBox(width: 36.0.w),
                        TextView(
                          text: 'Page 1 of 10',
                          textStyle: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 13.2.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black,
                          ),
                        ),

                        SizedBox(width: 36.0.w),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_forward,
                            size: 22.sp,
                            color: AppColors.primary1,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.end,
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   children: [
            //     SizedBox(width: 4.0.w),
            //     Container(
            //       padding: EdgeInsets.all(16.w),
            //       decoration: BoxDecoration(
            //         shape: BoxShape.circle,
            //         color: AppColors.white,
            //       ),
            //       child: SvgPicture.asset(
            //         AppImage.big_logo,
            //         width: 20.w,
            //         height: 20.w,
            //       ),
            //     ),
            //     SizedBox(width: 22.w),
            //     Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         SizedBox(
            //           width: 250.w,
            //           child: TextView(
            //             text:
            //                 'Good Morning, ${SharedPreferencesService.instance.usersData['user']['fullName'] ?? ''}',
            //             maxLines: 2,
            //             textOverflow: TextOverflow.ellipsis,
            //             textStyle: TextStyle(
            //               fontFamily: 'Arial',
            //               fontSize: 15.2.sp,
            //               fontWeight: FontWeight.w400,
            //               color: AppColors.infoGrey,
            //             ),
            //           ),
            //         ),
            //         TextView(
            //           text: 'How can i help you?',
            //           textStyle: TextStyle(
            //             fontFamily: 'Arial',
            //             fontSize: 18.2.sp,
            //             fontWeight: FontWeight.w500,
            //             color: AppColors.black,
            //           ),
            //         ),
            //         SizedBox(height: 5.10.h),
            //       ],
            //     ),
            //   ],
            // ),
            // SizedBox(height: 36.10.h),
            // Row(
            //   children: [
            //     Expanded(
            //       child: conContainerReminder(
            //         icon: AppImage.bell_small,
            //         text: 'Create Reminder',
            //         ontapAi: () {
            //           isTappToChat = !isTappToChat;
            //           chatText = 'Create Reminder';
            //           setState(() {});
            //         },
            //       ),
            //     ),
            //     SizedBox(width: 12.w),
            //     Expanded(
            //       child: conContainer(
            //         icon: AppImage.purchase,
            //         text: 'Purchase Meds',
            //         ontap: () {
            //           isTappToChat = !isTappToChat;
            //           chatText = 'Purchase Meds';
            //           setState(() {});
            //         },
            //       ),
            //     ),
            //   ],
            // ),

            // SizedBox(height: 22.10.h),
            // Row(
            //   children: [
            //     Expanded(
            //       child: conContainer(
            //         icon: AppImage.level,
            //         text: 'Stock Levels',
            //         ontap: () {
            //           isTappToChat = !isTappToChat;
            //           chatText = 'Stock Levels';
            //           setState(() {});
            //         },
            //       ),
            //     ),
            //     SizedBox(width: 12.w),
            //     Expanded(
            //       child: conContainer(
            //         icon: AppImage.cart,
            //         text: 'Orders',
            //         ontap: () {
            //           isTappToChat = !isTappToChat;
            //           chatText = 'Orders';
            //           setState(() {});
            //         },
            //       ),
            //     ),
            //   ],
            // ),
            // SizedBox(height: 22.10.h),
            // Row(
            //   children: [
            //     Expanded(
            //       child: conContainer(
            //         icon: AppImage.track_reminder,
            //         text: 'Track Reminders',
            //         ontap: () {
            //           isTappToChat = !isTappToChat;
            //           chatText = 'Track Reminder';
            //           setState(() {});
            //         },
            //       ),
            //     ),
            //     SizedBox(width: 12.w),
            //     Expanded(
            //       child: conContainer(
            //         icon: AppImage.appointment,
            //         text: 'Appointment',
            //         ontap: () {
            //           isTappToChat = !isTappToChat;
            //           chatText = 'Appointment';
            //           setState(() {});
            //         },
            //       ),
            //     ),
            //   ],
            // ),
            // SizedBox(height: 60.10.h),

            // Align(
            //   alignment: Alignment.bottomCenter,
            //   child: Container(
            //     width: double.infinity.w,
            //     padding: EdgeInsets.only(
            //       top: 2.4.w,
            //       bottom: 8.w,
            //       left: 10.w,
            //       right: 10.w,
            //     ),
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(18.22.r),
            //       color: AppColors.white,
            //     ),
            //     child: Form(
            //       key: formKey,
            //       child: Column(
            //         mainAxisSize: MainAxisSize.min,
            //         children: [
            //           AiTextFormWidget(
            //             label: 'Chat with Medicate AI....',
            //             validator: AppValidator.validateString(),
            //             onChange: (p0) {
            //               setState(() {
            //                 chatText = p0;
            //               });
            //             },
            //             labelStyle: TextStyle(
            //               fontFamily: 'Arial',
            //               fontSize: 15.2.sp,
            //               fontWeight: FontWeight.w400,
            //               color: AppColors.infoGrey,
            //             ),
            //           ),
            //           Row(
            //             children: [
            //               SvgPicture.asset(
            //                 AppImage.audio,
            //                 width: 22.w,
            //                 height: 22.h,
            //               ),
            //               Spacer(),
            //               SvgPicture.asset(
            //                 AppImage.clipper,
            //                 color: AppColors.black,
            //                 width: 22.w,
            //                 height: 22.h,
            //               ),
            //               SizedBox(width: 20.w),
            //               GestureDetector(
            //                 onTap: () {
            //                   if (formKey.currentState!
            //                       .validate()) {
            //                     isTappToChat = !isTappToChat;
            //                     chatText = chatText;
            //                     setState(() {});
            //                   }
            //                 },
            //                 child: Container(
            //                   padding: EdgeInsets.all(14.w),
            //                   decoration: BoxDecoration(
            //                     shape: BoxShape.circle,
            //                     color: AppColors.primary,
            //                   ),
            //                   child: SvgPicture.asset(
            //                     AppImage.arrow_up,
            //                     width: 20.w,
            //                     height: 17.20.h,
            //                     color: AppColors.white,
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),

            // SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }

  Widget getContainDisplayWidget() {
    if (onTappedBox == 'Active Patients') {
      return activePatientWidget();
    }
    if (onTappedBox == 'This Month\'s Orders') {
      return monthOrderWidget();
    }
    return notificationSetupWidget();
  }

  Widget notificationSetupWidget() => Container(
    padding: EdgeInsets.all(12.w),
    margin: EdgeInsets.only(bottom: 12.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: AppColors.infoGrey1),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextView(
              text: '2023-12-10',
              textStyle: TextStyle(
                fontFamily: 'Arial',
                fontSize: 12.50.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.infoGrey,
              ),
            ),
            SizedBox(height: 4.20.h),
            TextView(
              text: 'Bob Smith',
              textStyle: TextStyle(
                fontFamily: 'GoogleSans',
                fontSize: 14.50.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.reminder,
              ),
            ),
            SizedBox(height: 4.20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 11.4.w,
                    vertical: 4.2.w,
                  ),
                  margin: EdgeInsets.only(right: 10.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(color: AppColors.infoGrey1)
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(AppImage.sms,height: 18.h,width: 19.2.w,),
                      SizedBox(width: 6.8.w,),
                      TextView(
                        text: 'SMS',
                        textStyle: TextStyle(
                          fontFamily: 'GoogleSans',
                          fontSize: 12.50.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.reminder,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 11.4.w,
                    vertical: 4.2.w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(color: AppColors.infoGrey1)
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(AppImage.phone,height: 16.h,width: 16.w,color: AppColors.infoGrey,),
                      SizedBox(width: 6.8.w,),
                      TextView(
                        text: 'Phone Call',
                        textStyle: TextStyle(
                          fontFamily: 'GoogleSans',
                          fontSize: 12.50.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.reminder,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextView(
              text: 'Ongoing',
              textStyle: TextStyle(
                fontFamily: 'GoogleSans',
                fontSize: 12.50.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.yellow,
              ),
            ),
            SizedBox(height: 4.20.h),
            TextView(
              text: '₦125,000',
              textStyle: TextStyle(
                fontFamily: 'GoogleSans',
                fontSize: 16.50.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.thickGrey,
              ),
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ],
    ),
  );
  

  Widget monthOrderWidget() => Container(
    padding: EdgeInsets.all(12.w),
    margin: EdgeInsets.only(bottom: 12.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: AppColors.infoGrey1),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextView(
              text: '2023-12-10',
              textStyle: TextStyle(
                fontFamily: 'Arial',
                fontSize: 12.50.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.infoGrey,
              ),
            ),
            SizedBox(height: 4.20.h),
            TextView(
              text: 'Bob Smith',
              textStyle: TextStyle(
                fontFamily: 'GoogleSans',
                fontSize: 14.50.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.reminder,
              ),
            ),
            SizedBox(height: 4.20.h),
            TextView(
              text: '07123456789',
              textStyle: TextStyle(
                fontFamily: 'Arial',
                fontSize: 12.50.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.reminder,
              ),
            ),
            SizedBox(height: 8.20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextView(
                  text: 'Items: ',
                  textStyle: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 13.50.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.infoGrey,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 11.4.w,
                    vertical: 1.2.w,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: TextView(
                    text: '2',
                    textStyle: TextStyle(
                      fontFamily: 'GoogleSans',
                      fontSize: 12.50.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextView(
              text: 'In transit',
              textStyle: TextStyle(
                fontFamily: 'GoogleSans',
                fontSize: 12.50.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.yellow,
              ),
            ),
            SizedBox(height: 4.20.h),
            TextView(
              text: '₦125,000',
              textStyle: TextStyle(
                fontFamily: 'GoogleSans',
                fontSize: 16.50.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.thickGrey,
              ),
            ),
            SizedBox(height: 12.20.h),
            SvgPicture.asset(AppImage.arrow_forward),
          ],
        ),
      ],
    ),
  );
  
  Widget activePatientWidget() => Container(
    padding: EdgeInsets.all(12.w),
    margin: EdgeInsets.only(bottom: 12.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: AppColors.infoGrey1),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextView(
              text: '2023-12-10',
              textStyle: TextStyle(
                fontFamily: 'Arial',
                fontSize: 12.50.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.infoGrey,
              ),
            ),
            SizedBox(height: 4.20.h),
            TextView(
              text: 'Bob Smith',
              textStyle: TextStyle(
                fontFamily: 'GoogleSans',
                fontSize: 14.50.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.reminder,
              ),
            ),
            SizedBox(height: 4.20.h),
            TextView(
              text: '07123456789',
              textStyle: TextStyle(
                fontFamily: 'Arial',
                fontSize: 12.50.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.reminder,
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextView(
              text: 'Active Reminders',
              textStyle: TextStyle(
                fontFamily: 'Arial',
                fontSize: 13.50.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.infoGrey,
              ),
            ),
            SizedBox(height: 4.20.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 2.w),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(22),
              ),
              child: TextView(
                text: '2',
                textStyle: TextStyle(
                  fontFamily: 'GoogleSans',
                  fontSize: 12.50.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );

  // Widget conContainer({
  //   required String icon,
  //   required String text,
  //   required Function()? ontap,
  // }) => GestureDetector(
  //   onTap: ontap,
  //   child: Container(
  //     padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 14.w),
  //     decoration: BoxDecoration(
  //       color: AppColors.white,
  //       border: Border.all(color: AppColors.inactive),
  //       borderRadius: BorderRadius.circular(22.r),
  //     ),
  //     child: Row(
  //       children: [
  //         SvgPicture.asset(
  //           AppImage.curved_arrow,
  //           width: 10.20.w,
  //           height: 10.20.h,
  //         ),
  //         SizedBox(width: 6.10.w),
  //         SvgPicture.asset(
  //           icon,
  //           width: 16.20.w,
  //           height: 16.20.h,
  //           color: AppColors.lightBlue,
  //         ),
  //         SizedBox(width: 6.10.w),
  //         Flexible(
  //           child: TextView(
  //             text: text,
  //             textStyle: TextStyle(
  //               fontFamily: 'Arial',
  //               fontSize: 14.2.sp,
  //               fontWeight: FontWeight.w400,
  //               color: AppColors.black,
  //             ),
  //             maxLines: 1,
  //             textOverflow: TextOverflow.ellipsis,
  //           ),
  //         ),
  //       ],
  //     ),
  //   ),
  // );

  // Widget conContainerReminder({
  //   required String icon,
  //   required String text,
  //   required Function()? ontapAi,
  // }) => ViewModelBuilder<PharmViewModel>.reactive(
  //   viewModelBuilder: () => PharmViewModel(),
  //   onViewModelReady: (model) {},
  //   disposeViewModel: false,
  //   onDispose: (viewModel) {},
  //   builder: (_, PharmViewModel model, _) {
  //     return PopupMenuButton(
  //       color: AppColors.white,
  //       offset: const Offset(0, 50),
  //       padding: EdgeInsets.symmetric(horizontal: 18.22.w, vertical: 18.20.w),
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(20.w),
  //       ),
  //       onSelected: (String value) {},
  //       itemBuilder: (BuildContext context) {
  //         return [
  //           PopupMenuItem(
  //             value: 'setup yourself',
  //             padding: EdgeInsets.symmetric(
  //               horizontal: 18.22.w,
  //               vertical: 12.w,
  //             ),
  //             onTap: () => model
  //                 .showCreateAddPhoneDialog(
  //                   context,
  //                 ),
  //             // },
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.start,
  //               children: [
  //                 SvgPicture.asset(AppImage.person_plus),
  //                 SizedBox(width: 6.10.w),
  //                 TextView(
  //                   text: 'Set up Yourself',
  //                   textStyle: TextStyle(
  //                     fontFamily: 'Arial',
  //                     fontSize: 13.2.sp,
  //                     fontWeight: FontWeight.w400,
  //                     color: AppColors.reminder,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //           PopupMenuItem(
  //             value: 'ai setup',
  //             padding: EdgeInsets.symmetric(
  //               horizontal: 18.22.w,
  //               vertical: 12.w,
  //             ),
  //             onTap: ontapAi,
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.start,
  //               children: [
  //                 SvgPicture.asset(AppImage.ai_star),
  //                 SizedBox(width: 6.10.w),
  //                 TextView(
  //                   text: 'AI Setup',
  //                   textStyle: TextStyle(
  //                     fontFamily: 'Arial',
  //                     fontSize: 13.2.sp,
  //                     fontWeight: FontWeight.w400,
  //                     color: AppColors.reminder,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ];
  //       },
  //       child: Container(
  //         padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 14.w),
  //         decoration: BoxDecoration(
  //           color: AppColors.white,
  //           border: Border.all(color: AppColors.inactive),
  //           borderRadius: BorderRadius.circular(22.r),
  //         ),
  //         child: Row(
  //           children: [
  //             SvgPicture.asset(
  //               AppImage.curved_arrow,
  //               width: 10.20.w,
  //               height: 10.20.h,
  //             ),
  //             SizedBox(width: 6.10.w),
  //             SvgPicture.asset(
  //               icon,
  //               width: 16.20.w,
  //               height: 16.20.h,
  //               color: AppColors.lightBlue,
  //             ),
  //             SizedBox(width: 6.10.w),
  //             Flexible(
  //               child: TextView(
  //                 text: text,
  //                 textStyle: TextStyle(
  //                   fontFamily: 'Arial',
  //                   fontSize: 14.2.sp,
  //                   fontWeight: FontWeight.w400,
  //                   color: AppColors.black,
  //                 ),
  //                 maxLines: 1,
  //                 textOverflow: TextOverflow.ellipsis,
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     );
  //   },
  // );
}
