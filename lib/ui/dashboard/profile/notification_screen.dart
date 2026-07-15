// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import '../../../core/app_assets/image.dart';
import '../../../core/config/colors.dart';
import '../../../core/connect_end/view_model/auth_view_model.dart';
import '../../widget/button.dart';
import '../../widget/text.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final ScrollController _scrollController = ScrollController();

  AuthViewModel? _model;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        _model?.loadMoreNotifications();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
      viewModelBuilder: () => AuthViewModel(),
      onViewModelReady: (model) async {
        _model = model;
        await model.getAllNotifications();
        model.markAllAsReadNotification();
      },
      disposeViewModel: false,
      builder: (_, AuthViewModel model, _) {
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
              text: 'Notification',
              textStyle: TextStyle(
                fontFamily: 'GoogleSans',
                fontSize: 17.2.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.black,
              ),
            ),
            centerTitle: true,
          ),
          body: model.isLoading
    ? Center(
        child: SpinKitThreeBounce(
          color: AppColors.primary.withOpacity(.5),
          size: 34,
        ),
      )
    : model.items.isEmpty
        ? Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(22.4.w, 160.w, 22.4.w, 60.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppImage.empty_notification,
                    height: 100.h,
                    width: 100.w,
                  ),
                  SizedBox(height: 20.h),
                  TextView(
                    text: 'No Notifications at the moment',
                    textStyle: TextStyle(
                      fontSize: 18.10.sp,
                      fontFamily: 'GoogleSans',
                      fontWeight: FontWeight.w700,
                      color: AppColors.deep,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  TextView(
                    text: 'You’ll be notified when you get one',
                    textStyle: TextStyle(
                      fontSize: 14.90.sp,
                      fontFamily: 'Arial',
                      fontWeight: FontWeight.w400,
                      color: AppColors.reminder1,
                    ),
                  ),
                ],
              ),
            ),
          )
        : ListView.builder(
            controller: _scrollController,
            padding: EdgeInsets.symmetric(
              vertical: 30.w,
              horizontal: 15.w,
            ),
            itemCount: model.items.length + (model.isFetchingMore ? 1 : 0),
            itemBuilder: (context, index) {
              if (index == model.items.length) {
                return Padding(
                  padding: EdgeInsets.all(22.w),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primary1,
                    ),
                  ),
                );
              }

              final item = model.items[index];

              if (item is String) {
                return Padding(
                  padding: EdgeInsets.only(top: 16.h, bottom: 10.h),
                  child: TextView(
                    text: DateFormat(
                      'dd MMM, yyyy',
                    ).format(DateTime.parse(item)),
                    // ...
                  ),
                );
              }

              final isFirst = model.isFirstNotification(index);
              final isLast = model.isLastNotification(index);

              
                return profileContainer(
                topLeft: isFirst ? 12 : 0,
                topRight: isFirst ? 12 : 0,
                bottomLeft: isLast ? 12 : 0,
                bottomRight: isLast ? 12 : 0,
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10.0.w),
                      decoration: BoxDecoration(
                        color: AppColors.faintedGold.withOpacity(.1),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: SvgPicture.asset(
                        AppImage.timer,
                        height: 13.9.h,
                        width: 13.9.w,
                        color: AppColors.faintedGold,
                      ),
                    ),
                    SizedBox(width: 14.20.w),

                    // Title + Time
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextView(
                          text: item.title ?? '',
                          textStyle: TextStyle(
                            fontSize: 14.90.sp,
                            fontFamily: 'GoogleSans',
                            fontWeight: FontWeight.w500,
                            color: AppColors.reminder1,
                          ),
                        ),
                        SizedBox(
                          width: 200.w,
                          child: TextView(
                            text: item.body ?? '',
                            textStyle: TextStyle(
                              fontSize: 11.98.sp,
                              fontFamily: 'Arial',
                              fontWeight: FontWeight.w400,
                              color: AppColors.reminder,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 10),
                    TextView(
                      text: DateFormat(
                        'h:mm a',
                      ).format(DateTime.parse(item.updatedAt.toString())),
                      textStyle: TextStyle(
                        fontSize: 11.90.sp,
                        color: AppColors.infoGrey,
                      ),
                    ),
                  ],
                ),
        
              );
            },
          ),
          // ListView.builder(
          //   controller: _scrollController,
          //   padding: EdgeInsets.symmetric(vertical: 30.w, horizontal: 15.w),
          //   itemCount: model.items.length + (model.isFetchingMore ? 1 : 0),
          //   itemBuilder: (context, index) {
          //     if (model.isLoading) {
          //       return SpinKitThreeBounce(
          //         color: AppColors.primary.withOpacity(.5),
          //         size: 34,
          //       );
          //     }
          //     if (index == model.items.length) {
          //       return Padding(
          //         padding: EdgeInsets.all(22.w),
          //         child: Center(
          //           child: CircularProgressIndicator(color: AppColors.primary1),
          //         ),
          //       );
          //     }
          //     final item = model.items[index];

          //     if (item is String) {
          //       return Padding(
          //         padding: EdgeInsets.only(top: 16.h, bottom: 10.h),
          //         child: TextView(
          //           text: DateFormat(
          //             'dd MMM, yyyy',
          //           ).format(DateTime.parse(item)),
          //           textStyle: TextStyle(
          //             fontFamily: 'GoogleSans',
          //             fontSize: 13.5.sp,
          //             fontWeight: FontWeight.w400,
          //             color: AppColors.infoGrey,
          //           ),
          //         ),
          //       );
          //     } else if (model.items.isEmpty) {
          //       return Center(
          //         child: Padding(
          //           padding: EdgeInsets.fromLTRB(22.4.w, 160.w, 22.4.w, 60.w),
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.center,
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: [
          //               SvgPicture.asset(
          //                 AppImage.empty_notification,
          //                 height: 100.h,
          //                 width: 100.w,
          //               ),
          //               SizedBox(height: 20.h),
          //               TextView(
          //                 text: 'No Notifications at the moment',
          //                 textStyle: TextStyle(
          //                   fontSize: 18.10.sp,
          //                   fontFamily: 'GoogleSans',
          //                   fontWeight: FontWeight.w700,
          //                   color: AppColors.deep,
          //                 ),
          //               ),
          //               SizedBox(height: 10.h),
          //               TextView(
          //                 text: 'You’ll be notified when you get one',
          //                 textStyle: TextStyle(
          //                   fontSize: 14.90.sp,
          //                   fontFamily: 'Arial',
          //                   fontWeight: FontWeight.w400,
          //                   color: AppColors.reminder1,
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //       );
          //     }
          //     final isFirst = model.isFirstNotification(index);
          //     final isLast = model.isLastNotification(index);
              // return profileContainer(
              //   topLeft: isFirst ? 12 : 0,
              //   topRight: isFirst ? 12 : 0,
              //   bottomLeft: isLast ? 12 : 0,
              //   bottomRight: isLast ? 12 : 0,
              //   child: Row(
              //     children: [
              //       Container(
              //         padding: EdgeInsets.all(10.0.w),
              //         decoration: BoxDecoration(
              //           color: AppColors.faintedGold.withOpacity(.1),
              //           borderRadius: BorderRadius.circular(8.r),
              //         ),
              //         child: SvgPicture.asset(
              //           AppImage.timer,
              //           height: 13.9.h,
              //           width: 13.9.w,
              //           color: AppColors.faintedGold,
              //         ),
              //       ),
              //       SizedBox(width: 14.20.w),

              //       // Title + Time
              //       Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           TextView(
              //             text: item.title ?? '',
              //             textStyle: TextStyle(
              //               fontSize: 14.90.sp,
              //               fontFamily: 'GoogleSans',
              //               fontWeight: FontWeight.w500,
              //               color: AppColors.reminder1,
              //             ),
              //           ),
              //           SizedBox(
              //             width: 200.w,
              //             child: TextView(
              //               text: item.body ?? '',
              //               textStyle: TextStyle(
              //                 fontSize: 11.98.sp,
              //                 fontFamily: 'Arial',
              //                 fontWeight: FontWeight.w400,
              //                 color: AppColors.reminder,
              //               ),
              //             ),
              //           ),
              //         ],
              //       ),
              //       SizedBox(width: 10),
              //       TextView(
              //         text: DateFormat(
              //           'h:mm a',
              //         ).format(DateTime.parse(item.updatedAt.toString())),
              //         textStyle: TextStyle(
              //           fontSize: 11.90.sp,
              //           color: AppColors.infoGrey,
              //         ),
              //       ),
              //     ],
              //   ),
              // );
          //   },
          // ),
        
        );
      },
    );
  }

  GestureDetector profileContainer({
    double topLeft = 0,
    double topRight = 0,
    double bottomLeft = 0,
    double bottomRight = 0,
    Widget? child,
    Function()? onTap,
  }) => GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(12.8.w),
      margin: EdgeInsets.all(1.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(topLeft.r),
          topRight: Radius.circular(topRight.r),
          bottomLeft: Radius.circular(bottomLeft.r),
          bottomRight: Radius.circular(bottomRight.r),
        ),
      ),
      child: child,
    ),
  );
}
