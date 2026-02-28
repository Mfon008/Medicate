// ignore_for_file: deprecated_member_use, strict_top_level_inference, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:medicate_app/core/app_assets/constant.dart';
import 'package:medicate_app/core/connect_end/model/get_reminder_for_tenant_response_model/payment.dart';
import 'package:medicate_app/core/connect_end/view_model/pharm_auth_view_model.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/app_assets/image.dart';
import '../../../../core/config/colors.dart';
import '../../../../core/connect_end/model/get_reminder_for_tenant_response_model/reminder.dart';
import '../../../../core/core_folder/app/app.router.dart';
import '../../../../main.dart';
import '../../../widget/text.dart';
import '../../../widget/text_form_widget.dart';

class PharmacyReminderScreen extends StatefulWidget {
  const PharmacyReminderScreen({super.key});

  @override
  State<PharmacyReminderScreen> createState() => _PharmacyReminderScreenState();
}

class _PharmacyReminderScreenState extends State<PharmacyReminderScreen> {
  @override
  Widget build(BuildContext context) {
    bool isTablet(BuildContext context) =>
        MediaQuery.of(context).size.shortestSide >= 600;
    return ViewModelBuilder<PharmViewModel>.reactive(
      viewModelBuilder: () => PharmViewModel(),
      onViewModelReady: (model) {
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          // await model.getTodaysReminder(
          //   context,
          //   period: model.timePeriod,
          //   date: DateFormat('yyyy-MM-dd').format(DateTime.now()),
          // );
          await model.getReminder(
            context,
            status: model.isReminderStatus,
            page: model.pageOngoing.toString(),
          );
        });
      },
      disposeViewModel: false,
      onDispose: (viewModel) {},
      builder: (_, PharmViewModel model, _) {
        return Scaffold(
          backgroundColor: AppColors.dashboard,
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            backgroundColor: AppColors.primary1,
            shape: const CircleBorder(),
            child: PopupMenuButton(
              color: AppColors.white,
              offset: const Offset(-50, -70),
              padding: EdgeInsets.symmetric(
                horizontal: 18.22.w,
                vertical: 18.20.w,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.w),
              ),
              onSelected: (String value) {},
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    value: 'setup yourself',
                    padding: EdgeInsets.symmetric(
                      horizontal: 18.22.w,
                      vertical: 12.w,
                    ),
                    onTap: () => model.showReminderModal(context),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(AppImage.person_plus),
                        SizedBox(width: 6.10.w),
                        TextView(
                          text: 'Set up Yourself',
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
                  PopupMenuItem(
                    value: 'ai setup',
                    padding: EdgeInsets.symmetric(
                      horizontal: 18.22.w,
                      vertical: 12.w,
                    ),
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(AppImage.ai_star),
                        SizedBox(width: 6.10.w),
                        TextView(
                          text: 'AI Setup',
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
                ];
              },
              child: Icon(Icons.add, color: AppColors.white, size: 25.sp),
            ),
          ),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.white,
            toolbarHeight: 80.0,
            title: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.inactive.withOpacity(.1),
                      border: Border.all(
                        color: AppColors.inactive.withOpacity(.4),
                      ),
                    ),
                    child: IconButton(
                      icon: SvgPicture.asset(
                        AppImage.burger,
                        color: AppColors.primary,
                        height: isTablet(context) ? 34.h : 14.h,
                        width: isTablet(context) ? 34.w : 14.w,
                      ),
                      onPressed: () =>
                          navigate.navigateTo(Routes.pharmMoreScreen),
                    ),
                  ),
                  TextView(
                    text: 'Reminder',
                    textStyle: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.black,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.inactive.withOpacity(.1),
                      border: Border.all(
                        color: AppColors.inactive..withOpacity(.4),
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
                      splashRadius: 28,
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              vertical: model.checkReminderEmpty() ? 20.w : 50.w,
              horizontal: 16.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // model.checkReminderEmpty()
                //     ? Container(
                //         width: double.infinity,
                //         padding: EdgeInsets.all(10.w),
                //         decoration: BoxDecoration(
                //           color: AppColors.white,
                //           borderRadius: BorderRadius.circular(32.r),
                //         ),
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //           children: [
                //             Expanded(
                //               child: GestureDetector(
                //                 onTap: () async {
                //                   model.getReminderResponseModel!.data!.data!
                //                       .clear();
                //                   await Future.delayed(
                //                     Duration(milliseconds: 500),
                //                   );
                //                   model.isReminderStatus = 'today';
                //                   model.getTodaysReminder(
                //                     context,
                //                     period: model.timePeriod,
                //                     date: DateFormat(
                //                       'yyyy-MM-dd',
                //                     ).format(DateTime.now()),
                //                   );
                //                   setState(() {});
                //                 },
                //                 child: Container(
                //                   padding: EdgeInsets.symmetric(vertical: 10.w),
                //                   decoration: model.isReminderStatus == 'today'
                //                       ? BoxDecoration(
                //                           color: AppColors.primary.withOpacity(
                //                             .04,
                //                           ),
                //                           borderRadius: BorderRadius.circular(
                //                             22.r,
                //                           ),
                //                         )
                //                       : BoxDecoration(),
                //                   alignment: Alignment.center,
                //                   child: TextView(
                //                     text: 'Today’s Med',
                //                     textStyle: TextStyle(
                //                       fontSize: 14.sp,
                //                       fontWeight: FontWeight.w500,
                //                       color: model.isReminderStatus == 'today'
                //                           ? AppColors.primary
                //                           : AppColors.grey1,
                //                     ),
                //                   ),
                //                 ),
                //               ),
                //             ),
                //             SizedBox(width: 8.w),
                //             Expanded(
                //               child: GestureDetector(
                //                 onTap: () async {
                //                   model.getReminderResponseModel!.data!.data!
                //                       .clear();
                //                   await Future.delayed(
                //                     Duration(milliseconds: 500),
                //                   );
                //                   model.isReminderStatus = 'all';
                //                   model.getReminder(
                //                     context,
                //                     page: model.pageOngoing.toString(),
                //                   );
                //                   setState(() {});
                //                 },
                //                 child: Container(
                //                   padding: EdgeInsets.symmetric(vertical: 10.w),
                //                   decoration: model.isReminderStatus == 'all'
                //                       ? BoxDecoration(
                //                           color: AppColors.primary.withOpacity(
                //                             .04,
                //                           ),
                //                           borderRadius: BorderRadius.circular(
                //                             22.r,
                //                           ),
                //                         )
                //                       : BoxDecoration(),
                //                   alignment: Alignment.center,
                //                   child: TextView(
                //                     text: 'My Reminders',
                //                     textStyle: TextStyle(
                //                       fontSize: 14.sp,
                //                       fontWeight: FontWeight.w500,
                //                       color:
                //                           model.isReminderStatus == 'all' ||
                //                               model.isReminderStatus ==
                //                                   'ongoing' ||
                //                               model.isReminderStatus ==
                //                                   'completed'
                //                           ? AppColors.primary
                //                           : AppColors.grey1,
                //                     ),
                //                   ),
                //                 ),
                //               ),
                //             ),
                //           ],
                //         ),
                //       )
                //     : SizedBox.shrink(),

                // model.isReminderStatus == 'all' ||
                //         model.isReminderStatus == 'ongoing' ||
                //         model.isReminderStatus == 'completed'
                //     ? Align(
                //         alignment: Alignment.topLeft,
                // child: PopupMenuButton<String>(
                //   color: AppColors.white,
                //   child: Container(
                //     width: double.infinity,
                //     padding: EdgeInsets.symmetric(
                //       vertical: 3.2.w,
                //       horizontal: 12.w,
                //     ),
                //     margin: EdgeInsets.symmetric(vertical: 20.w),
                //     decoration: BoxDecoration(
                //       color: AppColors.primary.withOpacity(.04),
                //       borderRadius: BorderRadius.circular(32.r),
                //       border: Border.all(color: AppColors.primary),
                //     ),
                //     alignment: Alignment.center,
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         TextView(
                //           text: model.isReminderStatus.capitalize(),
                //           textStyle: TextStyle(
                //             fontSize: 14.sp,
                //             fontWeight: FontWeight.w500,
                //             color: AppColors.primary,
                //           ),
                //         ),
                //         Padding(
                //           padding: EdgeInsets.all(14.20.w),
                //           child: SvgPicture.asset(AppImage.arrow_down),
                //         ),
                //       ],
                //     ),
                //   ),

                //   onSelected: (String result) async {
                //     model.isReminderStatus = result;
                //     await Future.delayed(Duration(milliseconds: 400));
                //     model.getReminder(
                //       context,
                //       status: model.isReminderStatus,
                //       page: model.pageOngoing.toString(),
                //     );
                //     setState(() {});
                //     model.notifyListeners();
                //   },
                //   itemBuilder: (BuildContext context) =>
                //       <PopupMenuItem<String>>[
                //         PopupMenuItem<String>(
                //           value: 'all',
                //           child: TextView(
                //             text: 'All',
                //             textStyle: TextStyle(
                //               fontWeight: FontWeight.w400,
                //               fontFamily: 'Arial',
                //               fontSize: 15.2.sp,
                //               color: AppColors.black,
                //             ),
                //           ),
                //         ),
                //         PopupMenuItem<String>(
                //           value: 'ongoing',
                //           child: TextView(
                //             text: 'Ongoing',
                //             textStyle: TextStyle(
                //               fontWeight: FontWeight.w400,
                //               fontFamily: 'Arial',
                //               fontSize: 15.2.sp,
                //               color: AppColors.black,
                //             ),
                //           ),
                //         ),
                //         PopupMenuItem<String>(
                //           value: 'completed',
                //           child: TextView(
                //             text: 'Completed',
                //             textStyle: TextStyle(
                //               fontWeight: FontWeight.w400,
                //               fontFamily: 'Arial',
                //               fontSize: 15.2.sp,
                //               color: AppColors.black,
                //             ),
                //           ),
                //         ),
                //       ],
                // ),
                //       )
                //     : SizedBox.shrink(),

                // model.isReminderStatus == 'all' ||
                //         model.isReminderStatus == 'ongoing' ||
                //         model.isReminderStatus == 'completed'
                // ? TextFormWidget(
                //     borderColor: AppColors.f1,
                //     borderTopLeft: 32.0.r,
                //     borderTopRight: 32.0.r,
                //     borderBottomLeft: 32.0.r,
                //     borderBottomRight: 32.0.r,
                //     label: 'Search by medication name',
                //     labelStyle: TextStyle(
                //       fontWeight: FontWeight.w400,
                //       fontFamily: 'Arial',
                //       fontSize: 14.sp,
                //       color: AppColors.infoGrey,
                //     ),
                //     fillColor: AppColors.white,
                //     isFilled: true,
                //     prefixWidget: Padding(
                //       padding: EdgeInsets.all(16.w),
                //       child: SvgPicture.asset(
                //         AppImage.search,
                //         height: 20.h,
                //         width: 20.w,
                //       ),
                //     ),
                //     onChange: (p0) {
                //       model.searchuserByPharmReminder = p0;
                //       model.notifyListeners();
                //     },
                //   )
                // : SizedBox.shrink(),

                // model.isReminderStatus == 'all' ||
                //         model.isReminderStatus == 'ongoing' ||
                //         model.isReminderStatus == 'completed'
                //     ? SizedBox(height: 14.h)
                //     : SizedBox.shrink(),

                // model.isReminderStatus == 'today'
                //     ? Center(
                //         child: SizedBox(
                //           height: MediaQuery.of(context).size.height * .62,
                //           child: RefreshIndicator(
                //             onRefresh: () async {
                //               model.getTodaysReminder(
                //                 context,
                //                 period: model.timePeriod,
                //                 date: DateFormat(
                //                   'yyyy-MM-dd',
                //                 ).format(DateTime.now()),
                //               );
                //             },
                //             child: SingleChildScrollView(
                //               physics: AlwaysScrollableScrollPhysics(),
                //               child: Column(
                //                 children: [
                //                   SizedBox(height: 30.h),
                //                   if (model.isReminderStatus == 'today' &&
                //                       model.getTodaysReminderModel != null)
                //                     Container(
                //                       padding: EdgeInsets.symmetric(
                //                         vertical: 14.w,
                //                         horizontal: 20.w,
                //                       ),
                //                       margin: EdgeInsets.only(bottom: 16.w),
                //                       width: double.infinity,
                //                       decoration: BoxDecoration(
                //                         color: AppColors.white,
                //                         borderRadius: BorderRadius.circular(
                //                           10.r,
                //                         ),
                //                       ),
                //                       child: Column(
                //                         crossAxisAlignment:
                //                             CrossAxisAlignment.start,
                //                         children: [
                //                           TextView(
                //                             text: 'Today’s Medications',
                //                             textStyle: TextStyle(
                //                               fontFamily: 'Arial',
                //                               fontSize: 13.2.sp,
                //                               fontWeight: FontWeight.w400,
                //                               color: AppColors.infoGrey,
                //                             ),
                //                           ),
                //                           SizedBox(height: 4.h),
                //                           Row(
                //                             mainAxisAlignment:
                //                                 MainAxisAlignment.start,
                //                             children: [
                //                               SvgPicture.asset(
                //                                 AppImage.calendar,
                //                                 height: 18.h,
                //                                 width: 18.w,
                //                                 color: AppColors.infoGrey,
                //                               ),
                //                               SizedBox(width: 10.h),
                //                               TextView(
                //                                 text: DateFormat(
                //                                   'EEEE, MMMM dd',
                //                                 ).format(DateTime.now()),
                //                                 textStyle: TextStyle(
                //                                   fontFamily: 'GoogleSans',
                //                                   fontSize: 15.2.sp,
                //                                   fontWeight: FontWeight.w700,
                //                                   color: AppColors.black,
                //                                 ),
                //                               ),
                //                             ],
                //                           ),
                //                           SizedBox(height: 18.20.h),
                //                           TextFormWidget(
                //                             borderColor: AppColors.f1,
                //                             borderTopLeft: 32.0.r,
                //                             borderTopRight: 32.0.r,
                //                             borderBottomLeft: 32.0.r,
                //                             borderBottomRight: 32.0.r,
                //                             label: 'Search by medication type',
                //                             labelStyle: TextStyle(
                //                               fontWeight: FontWeight.w400,
                //                               fontFamily: 'Arial',
                //                               fontSize: 14.sp,
                //                               color: AppColors.infoGrey,
                //                             ),
                //                             fillColor: AppColors.f1,
                //                             isFilled: true,
                //                             prefixWidget: Padding(
                //                               padding: EdgeInsets.all(16.w),
                //                               child: SvgPicture.asset(
                //                                 AppImage.search,
                //                                 height: 20.h,
                //                                 width: 20.w,
                //                               ),
                //                             ),
                //                             onChange: (p0) {
                //                               model.searchuserByPharm = p0;
                //                               model.notifyListeners();
                //                             },
                //                           ),
                //                           SizedBox(height: 10.h),
                //                           Divider(
                //                             thickness: .4,
                //                             color: AppColors.infoGrey,
                //                           ),
                //                           SizedBox(height: 14.h),
                //                           Row(
                //                             children: [
                //                               GestureDetector(
                //                                 onTap: () async {
                //                                   model.timePeriod = 'morning';
                //                                   await Future.delayed(
                //                                     Duration(milliseconds: 100),
                //                                   );
                //                                   model.getTodaysReminder(
                //                                     context,
                //                                     period: model.timePeriod,
                //                                     date: DateFormat(
                //                                       'yyyy-MM-dd',
                //                                     ).format(DateTime.now()),
                //                                   );
                //                                   model.notifyListeners();
                //                                 },
                //                                 child: Container(
                //                                   padding: EdgeInsets.symmetric(
                //                                     vertical: 8.w,
                //                                     horizontal: 24.0.w,
                //                                   ),
                //                                   decoration: BoxDecoration(
                //                                     border: Border.all(
                //                                       color:
                //                                           model.timePeriod ==
                //                                               'morning'
                //                                           ? AppColors.primary
                //                                           : AppColors.f1,
                //                                     ),
                //                                     borderRadius:
                //                                         BorderRadius.circular(
                //                                           22.0,
                //                                         ),
                //                                   ),
                //                                   child: Row(
                //                                     children: [
                //                                       SvgPicture.asset(
                //                                         AppImage.set,
                //                                       ),
                //                                       SizedBox(width: 6.w),
                //                                       TextView(
                //                                         text: 'Morning',
                //                                         textStyle: TextStyle(
                //                                           fontFamily: 'Arial',
                //                                           fontSize: 13.2.sp,
                //                                           fontWeight:
                //                                               FontWeight.w400,
                //                                           color: AppColors
                //                                               .infoGrey,
                //                                         ),
                //                                       ),
                //                                     ],
                //                                   ),
                //                                 ),
                //                               ),
                //                               SizedBox(width: 10.4.h),
                //                               GestureDetector(
                //                                 onTap: () async {
                //                                   model.timePeriod =
                //                                       'afternoon';

                //                                   await Future.delayed(
                //                                     Duration(milliseconds: 100),
                //                                   );
                //                                   model.getTodaysReminder(
                //                                     context,
                //                                     period: model.timePeriod,
                //                                     date: DateFormat(
                //                                       'yyyy-MM-dd',
                //                                     ).format(DateTime.now()),
                //                                   );
                //                                   model.notifyListeners();
                //                                 },
                //                                 child: Container(
                //                                   padding: EdgeInsets.symmetric(
                //                                     vertical: 8.w,
                //                                     horizontal: 24.0.w,
                //                                   ),
                //                                   decoration: BoxDecoration(
                //                                     border: Border.all(
                //                                       color:
                //                                           model.timePeriod ==
                //                                               'afternoon'
                //                                           ? AppColors.primary
                //                                           : AppColors.f1,
                //                                     ),
                //                                     borderRadius:
                //                                         BorderRadius.circular(
                //                                           22.0,
                //                                         ),
                //                                   ),
                //                                   child: Row(
                //                                     children: [
                //                                       SvgPicture.asset(
                //                                         AppImage.noon,
                //                                       ),
                //                                       SizedBox(width: 6.w),
                //                                       TextView(
                //                                         text: 'Afternoon',
                //                                         textStyle: TextStyle(
                //                                           fontFamily: 'Arial',
                //                                           fontSize: 13.2.sp,
                //                                           fontWeight:
                //                                               FontWeight.w400,
                //                                           color: AppColors
                //                                               .infoGrey,
                //                                         ),
                //                                       ),
                //                                     ],
                //                                   ),
                //                                 ),
                //                               ),
                //                             ],
                //                           ),
                //                           SizedBox(height: 10.h),
                //                           GestureDetector(
                //                             onTap: () async {
                //                               model.timePeriod = 'evening';
                //                               await Future.delayed(
                //                                 Duration(milliseconds: 100),
                //                               );
                //                               model.getTodaysReminder(
                //                                 context,
                //                                 period: model.timePeriod,
                //                                 date: DateFormat(
                //                                   'yyyy-MM-dd',
                //                                 ).format(DateTime.now()),
                //                               );
                //                               model.notifyListeners();
                //                             },
                //                             child: Container(
                //                               width: 130.0.w,
                //                               padding: EdgeInsets.symmetric(
                //                                 vertical: 8.w,
                //                                 horizontal: 24.0.w,
                //                               ),
                //                               decoration: BoxDecoration(
                //                                 border: Border.all(
                //                                   color:
                //                                       model.timePeriod ==
                //                                           'evening'
                //                                       ? AppColors.primary
                //                                       : AppColors.f1,
                //                                 ),
                //                                 borderRadius:
                //                                     BorderRadius.circular(22.0),
                //                               ),
                //                               child: Row(
                //                                 children: [
                //                                   SvgPicture.asset(
                //                                     AppImage.dawn,
                //                                   ),
                //                                   SizedBox(width: 6.w),
                //                                   TextView(
                //                                     text: 'Evening',
                //                                     textStyle: TextStyle(
                //                                       fontFamily: 'Arial',
                //                                       fontSize: 13.2.sp,
                //                                       fontWeight:
                //                                           FontWeight.w400,
                //                                       color: AppColors.infoGrey,
                //                                     ),
                //                                   ),
                //                                 ],
                //                               ),
                //                             ),
                //                           ),
                //                           SizedBox(height: 30.h),
                //                           if (model.searchuserByPharm != '')
                //                             ...model
                //                                 .getTodaysReminderModel!
                //                                 .data!
                //                                 .asMap()
                //                                 .entries
                //                                 .where(
                //                                   (e) =>
                //                                       e.value.medicationType
                //                                           ?.toLowerCase().contains(model.searchuserByPharm
                //                                           !.toLowerCase())??false,
                //                                 )
                //                                 .map((entry) {
                //                                   final index = entry.key;
                //                                   final o = entry.value;
                //                                   final isLast =
                //                                       index ==
                //                                       model
                //                                               .getTodaysReminderModel!
                //                                               .data!
                //                                               .length -
                //                                           1;
                //                                   return Column(
                //                                     children: [
                //                                       GestureDetector(
                //                                         // onTap: () => model
                //                                         //     .showUpdateDoseDialog(
                //                                         //       context,
                //                                         //       o: o,
                //                                         //     ),
                //                                         child: Container(
                //                                           color: AppColors
                //                                               .transparent,
                //                                           child: Row(
                //                                             children: [
                //                                               Container(
                //                                                 padding:
                //                                                     EdgeInsets.all(
                //                                                       14.w,
                //                                                     ),
                //                                                 decoration: BoxDecoration(
                //                                                   color: AppColors
                //                                                       .skyBlue,
                //                                                   shape: BoxShape
                //                                                       .circle,
                //                                                 ),
                //                                                 child: SvgPicture.asset(
                //                                                   model.isMedTypeView(
                //                                                     o.medicationType,
                //                                                   ),
                //                                                   color: AppColors
                //                                                       .primary,
                //                                                   height: 18.h,
                //                                                   width: 18.w,
                //                                                 ),
                //                                               ),
                //                                               SizedBox(
                //                                                 width: 20.w,
                //                                               ),
                //                                               Column(
                //                                                 crossAxisAlignment:
                //                                                     CrossAxisAlignment
                //                                                         .start,
                //                                                 children: [
                //                                                   TextView(
                //                                                     text:
                //                                                         o.medicationType
                //                                                             ?.capitalize() ??
                //                                                         '',
                //                                                     textStyle: TextStyle(
                //                                                       fontFamily:
                //                                                           'Arial',
                //                                                       fontSize:
                //                                                           13.2.sp,
                //                                                       fontWeight:
                //                                                           FontWeight
                //                                                               .w400,
                //                                                       color: AppColors
                //                                                           .grey1,
                //                                                     ),
                //                                                   ),
                //                                                   SizedBox(
                //                                                     width:
                //                                                         120.w,
                //                                                     child: TextView(
                //                                                       text:
                //                                                           o.medicationName ??
                //                                                           '',
                //                                                       textOverflow:
                //                                                           TextOverflow
                //                                                               .ellipsis,
                //                                                       maxLines:
                //                                                           1,
                //                                                       textStyle: TextStyle(
                //                                                         fontFamily:
                //                                                             'GoogleSans',
                //                                                         fontSize:
                //                                                             15.2.sp,
                //                                                         fontWeight:
                //                                                             FontWeight.w500,
                //                                                         color: AppColors
                //                                                             .deep,
                //                                                       ),
                //                                                     ),
                //                                                   ),
                //                                                 ],
                //                                               ),
                //                                               Spacer(),
                //                                               Row(
                //                                                 children: [
                //                                                   TextView(
                //                                                     text:
                //                                                         '${o.time} ${model.checkTimePeriod(o.time)}',
                //                                                     textStyle: TextStyle(
                //                                                       fontFamily:
                //                                                           'GoogleSans',
                //                                                       fontSize:
                //                                                           18.2.sp,
                //                                                       fontWeight:
                //                                                           FontWeight
                //                                                               .w400,
                //                                                       color: AppColors
                //                                                           .reminder,
                //                                                     ),
                //                                                   ),
                //                                                   SizedBox(
                //                                                     width: 10.w,
                //                                                   ),
                //                                                   Container(
                //                                                     padding:
                //                                                         EdgeInsets.all(
                //                                                           1.2.w,
                //                                                         ),
                //                                                     decoration: BoxDecoration(
                //                                                       color: model
                //                                                           .checkMedsStatusColor(
                //                                                             o.status,
                //                                                           ),
                //                                                       shape: BoxShape
                //                                                           .circle,
                //                                                     ),
                //                                                     child: model
                //                                                         .checkMedsStatusWidget(
                //                                                           o.status,
                //                                                         ),
                //                                                   ),
                //                                                 ],
                //                                               ),
                //                                             ],
                //                                           ),
                //                                         ),
                //                                       ),
                //                                       SizedBox(height: 10.30.h),
                //                                       if (!isLast)
                //                                         Divider(
                //                                           color: AppColors
                //                                               .infoGrey,
                //                                           thickness: .14,
                //                                         ),
                //                                     ],
                //                                   );
                //                                 })
                //                           else
                //                             ...model.getTodaysReminderModel!.data!.asMap().entries.map((
                //                               entry,
                //                             ) {
                //                               final index = entry.key;
                //                               final o = entry.value;
                //                               final isLast =
                //                                   index ==
                //                                   model
                //                                           .getTodaysReminderModel!
                //                                           .data!
                //                                           .length -
                //                                       1;
                //                               return Column(
                //                                 children: [
                //                                   GestureDetector(
                //                                     // onTap: () => model
                //                                     //     .showUpdateDoseDialog(
                //                                     //       context,
                //                                     //       o: o,
                //                                     //     ),
                //                                     child: Container(
                //                                       color:
                //                                           AppColors.transparent,
                //                                       child: Row(
                //                                         children: [
                //                                           Container(
                //                                             padding:
                //                                                 EdgeInsets.all(
                //                                                   14.w,
                //                                                 ),
                //                                             decoration:
                //                                                 BoxDecoration(
                //                                                   color: AppColors
                //                                                       .skyBlue,
                //                                                   shape: BoxShape
                //                                                       .circle,
                //                                                 ),
                //                                             child: SvgPicture.asset(
                //                                               model.isMedTypeView(
                //                                                 o.medicationType,
                //                                               ),
                //                                               color: AppColors
                //                                                   .primary,
                //                                               height: 18.h,
                //                                               width: 18.w,
                //                                             ),
                //                                           ),
                //                                           SizedBox(width: 20.w),
                //                                           Column(
                //                                             crossAxisAlignment:
                //                                                 CrossAxisAlignment
                //                                                     .start,
                //                                             children: [
                //                                               TextView(
                //                                                 text:
                //                                                     o.medicationType
                //                                                         ?.capitalize() ??
                //                                                     '',
                //                                                 textStyle: TextStyle(
                //                                                   fontFamily:
                //                                                       'Arial',
                //                                                   fontSize:
                //                                                       13.2.sp,
                //                                                   fontWeight:
                //                                                       FontWeight
                //                                                           .w400,
                //                                                   color:
                //                                                       AppColors
                //                                                           .grey1,
                //                                                 ),
                //                                               ),
                //                                               SizedBox(
                //                                                 width: 120.w,
                //                                                 child: TextView(
                //                                                   text:
                //                                                       o.medicationName ??
                //                                                       '',
                //                                                   textOverflow:
                //                                                       TextOverflow
                //                                                           .ellipsis,
                //                                                   maxLines: 1,
                //                                                   textStyle: TextStyle(
                //                                                     fontFamily:
                //                                                         'GoogleSans',
                //                                                     fontSize:
                //                                                         15.2.sp,
                //                                                     fontWeight:
                //                                                         FontWeight
                //                                                             .w500,
                //                                                     color:
                //                                                         AppColors
                //                                                             .deep,
                //                                                   ),
                //                                                 ),
                //                                               ),
                //                                             ],
                //                                           ),
                //                                           Spacer(),
                //                                           Row(
                //                                             children: [
                //                                               TextView(
                //                                                 text:
                //                                                     '${o.time} ${model.checkTimePeriod(o.time)}',
                //                                                 textStyle: TextStyle(
                //                                                   fontFamily:
                //                                                       'GoogleSans',
                //                                                   fontSize:
                //                                                       18.2.sp,
                //                                                   fontWeight:
                //                                                       FontWeight
                //                                                           .w400,
                //                                                   color: AppColors
                //                                                       .reminder,
                //                                                 ),
                //                                               ),
                //                                               SizedBox(
                //                                                 width: 10.w,
                //                                               ),
                //                                               Container(
                //                                                 padding:
                //                                                     EdgeInsets.all(
                //                                                       1.2.w,
                //                                                     ),
                //                                                 decoration: BoxDecoration(
                //                                                   color: model
                //                                                       .checkMedsStatusColor(
                //                                                         o.status,
                //                                                       ),
                //                                                   shape: BoxShape
                //                                                       .circle,
                //                                                 ),
                //                                                 child: model
                //                                                     .checkMedsStatusWidget(
                //                                                       o.status,
                //                                                     ),
                //                                               ),
                //                                             ],
                //                                           ),
                //                                         ],
                //                                       ),
                //                                     ),
                //                                   ),
                //                                   SizedBox(height: 10.30.h),
                //                                   if (!isLast)
                //                                     Divider(
                //                                       color: AppColors.infoGrey,
                //                                       thickness: .14,
                //                                     ),
                //                                 ],
                //                               );
                //                             }),
                //                         ],
                //                       ),
                //                     ),

                //                   SizedBox(height: 30.h),
                //                 ],
                //               ),
                //             ),
                //           ),
                //         ),
                //       )
                //     :
                Center(
                  child:
                      model.getReminderResponseModel != null &&
                          model.getReminderResponseModel!.data!.reminders != null &&
                          model.getReminderResponseModel!.data!.reminders!.isNotEmpty
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10.h),
                            TextView(
                              text: 'Reminders',
                              textStyle: TextStyle(
                                fontFamily: 'GoogleSans',
                                fontSize: 16.2.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.reminder,
                              ),
                            ),
                            SizedBox(height: 4.0.h),
                            TextView(
                              text: 'Manage Reminders Created',
                              textStyle: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 14.2.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.reminder,
                              ),
                            ),

                            SizedBox(height: 20.h),
                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 20.w,
                                horizontal: 12.w,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: SizedBox(
                                height:
                                    model
                                            .getReminderResponseModel!
                                            .data!
                                            .reminders!
                                            .length >
                                        4
                                    ? MediaQuery.of(context).size.height * .65
                                    : MediaQuery.of(context).size.height * .35,
                                child: SingleChildScrollView(
                                  physics: AlwaysScrollableScrollPhysics(),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: TextFormWidget(
                                              borderColor: AppColors.f1,
                                              borderTopLeft: 12.0.r,
                                              borderTopRight: 12.0.r,
                                              borderBottomLeft: 12.0.r,
                                              borderBottomRight: 12.0.r,
                                              label: 'Search user',
                                              labelStyle: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'Arial',
                                                fontSize: 14.sp,
                                                color: AppColors.infoGrey,
                                              ),
                                              fillColor: AppColors.grey,
                                              isFilled: true,
                                              prefixWidget: Padding(
                                                padding: EdgeInsets.all(16.w),
                                                child: SvgPicture.asset(
                                                  AppImage.search,
                                                  height: 20.h,
                                                  width: 20.w,
                                                  color: AppColors.infoGrey,
                                                ),
                                              ),
                                              onChange: (p0) {
                                                model.searchuserByPharmReminder =
                                                    p0;
                                                model.notifyListeners();
                                              },
                                            ),
                                          ),
                                          SizedBox(width: 10.w),
                                          PopupMenuButton<String>(
                                            color: AppColors.white,
                                            child: Container(
                                              padding: EdgeInsets.all(18.r),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10.r),
                                                border: Border.all(
                                                  color: AppColors.infoGrey1,
                                                ),
                                              ),
                                              child: SvgPicture.asset(
                                                AppImage.earth,
                                              ),
                                            ),

                                            onSelected: (String result) async {
                                              model.isReminderStatus = result;
                                              await Future.delayed(
                                                Duration(milliseconds: 400),
                                              );
                                              model.getReminder(
                                                context,
                                                status: model.isReminderStatus,
                                                page: model.pageOngoing
                                                    .toString(),
                                              );
                                              setState(() {});
                                              model.notifyListeners();
                                            },
                                            itemBuilder:
                                                (
                                                  BuildContext context,
                                                ) => <PopupMenuItem<String>>[
                                                  PopupMenuItem<String>(
                                                    value: 'all',
                                                    child: TextView(
                                                      text: 'All',
                                                      textStyle: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontFamily: 'Arial',
                                                        fontSize: 15.2.sp,
                                                        color: AppColors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  PopupMenuItem<String>(
                                                    value: 'ongoing',
                                                    child: TextView(
                                                      text: 'Ongoing',
                                                      textStyle: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontFamily: 'Arial',
                                                        fontSize: 15.2.sp,
                                                        color: AppColors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  PopupMenuItem<String>(
                                                    value: 'completed',
                                                    child: TextView(
                                                      text: 'Completed',
                                                      textStyle: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontFamily: 'Arial',
                                                        fontSize: 15.2.sp,
                                                        color: AppColors.black,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20.h),
                                      if (model.isReminderStatus == 'all')
                                        if (model.searchuserByPharmReminder !=
                                            '')
                                          ...model
                                              .getReminderResponseModel!
                                              .data!
                                              .reminders!
                                              .reversed
                                              .where(
                                                (e) => e.patientDetails!.fullName!
                                                    .toLowerCase()
                                                    .contains(
                                                      model
                                                          .searchuserByPharmReminder!
                                                          .toLowerCase(),
                                                    ),
                                              )
                                              .map(
                                                (e) => reminderWidget(
                                                  context: context,
                                                  isTab: isTablet(context),
                                                  reminder: e,
                                                  model: model,
                                                ),
                                              )
                                        else
                                          ...model
                                              .getReminderResponseModel!
                                              .data!
                                              .reminders!
                                              .reversed
                                              .map(
                                                (e) => reminderWidget(
                                                  context: context,
                                                  isTab: isTablet(context),
                                                  reminder: e,
                                                  model: model,
                                                ),
                                              ),

                                      if (model.isReminderStatus == 'ongoing')
                                        if (model.searchuserByPharmReminder !=
                                            '')
                                          ...model
                                              .getReminderResponseModel!
                                              .data!
                                              .reminders!
                                              .reversed
                                              .where(
                                                (e) => e.user!.fullName!
                                                    .toLowerCase()
                                                    .contains(
                                                      model
                                                          .searchuserByPharmReminder!
                                                          .toLowerCase(),
                                                    ),
                                              )
                                              .map(
                                                (e) => reminderWidget(
                                                  context: context,
                                                  isTab: isTablet(context),
                                                  reminder: e,
                                                  model: model,
                                                ),
                                              )
                                        else
                                          ...model
                                              .getReminderResponseModel!
                                              .data!
                                              .reminders!
                                              .reversed
                                              .map(
                                                (e) => reminderWidget(
                                                  context: context,
                                                  isTab: isTablet(context),
                                                  reminder: e,
                                                  model: model,
                                                ),
                                              ),

                                      if (model.isReminderStatus == 'completed')
                                        if (model.searchuserByPharmReminder !=
                                            '')
                                          ...model
                                              .getReminderResponseModel!
                                              .data!
                                              .reminders!
                                              .reversed
                                              .where(
                                                (e) => e.user!.fullName!
                                                    .toLowerCase()
                                                    .contains(
                                                      model
                                                          .searchuserByPharmReminder!
                                                          .toLowerCase(),
                                                    ),
                                              )
                                              .map(
                                                (e) => reminderWidget(
                                                  context: context,
                                                  isTab: isTablet(context),
                                                  reminder: e,
                                                  model: model,
                                                ),
                                              )
                                        else
                                          ...model
                                              .getReminderResponseModel!
                                              .data!
                                              .reminders!
                                              .reversed
                                              .map(
                                                (e) => reminderWidget(
                                                  context: context,
                                                  isTab: isTablet(context),
                                                  reminder: e,
                                                  model: model,
                                                  isComplete: true,
                                                ),
                                              ),
                                      Padding(
                                        padding: EdgeInsets.all(10.w),
                                        child: Divider(
                                          thickness: .14,
                                          color: AppColors.infoGrey,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          IconButton(
                                            onPressed:
                                                model
                                                        .getReminderResponseModel!
                                                        .data!
                                                        .meta!
                                                        .page ==
                                                    1
                                                ? () {}
                                                : () async {
                                                    if (model
                                                            .isReminderStatus ==
                                                        'all') {
                                                      model.onSubAllLoading();
                                                    }
                                                    if (model
                                                            .isReminderStatus ==
                                                        'ongoing') {
                                                      model.onSubGoingLoading();
                                                    }
                                                    if (model
                                                            .isReminderStatus ==
                                                        'completed') {
                                                      model
                                                          .onSubCompletedLoading();
                                                    }
                                                    if (model
                                                            .isReminderStatus ==
                                                        'today') {
                                                      model.onSubTodayLoading();
                                                    }
                                                  },
                                            icon: Icon(
                                              Icons.arrow_back,
                                              color:
                                                  model
                                                          .getReminderResponseModel!
                                                          .data!
                                                          .meta!
                                                          .page ==
                                                      1
                                                  ? AppColors.primary1
                                                        .withOpacity(.4)
                                                  : AppColors.primary1,
                                              size: 20.sp,
                                            ),
                                          ),

                                          model.isLoading
                                              ? SpinKitFadingCircle(
                                                  size: 20.sp,
                                                  color: AppColors.fineGrey,
                                                )
                                              : TextView(
                                                  text:
                                                      'Page ${model.getReminderResponseModel!.data!.meta!.page} of ${model.getReminderResponseModel!.data!.meta!.totalPages}',
                                                  textStyle: TextStyle(
                                                    fontFamily: 'Arial',
                                                    fontSize: 15.2.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color: AppColors.black,
                                                  ),
                                                ),
                                          IconButton(
                                            onPressed:
                                                model
                                                        .getReminderResponseModel!
                                                        .data!
                                                        .meta!
                                                        .page ==
                                                    model
                                                        .getReminderResponseModel!
                                                        .data!
                                                        .meta!
                                                        .totalPages
                                                ? () {}
                                                : () async {
                                                    if (model
                                                            .isReminderStatus ==
                                                        'all') {
                                                      model.onAddAllLoading();
                                                    }
                                                    if (model
                                                            .isReminderStatus ==
                                                        'ongoing') {
                                                      model.onAddGoingLoading();
                                                    }
                                                    if (model
                                                            .isReminderStatus ==
                                                        'completed') {
                                                      model
                                                          .onAddCompletedLoading();
                                                    }
                                                    if (model
                                                            .isReminderStatus ==
                                                        'today') {
                                                      model.onAddTodayLoading();
                                                    }
                                                  },
                                            icon: Icon(
                                              Icons.arrow_forward,
                                              color:
                                                  model
                                                          .getReminderResponseModel!
                                                          .data!
                                                          .meta!
                                                          .page ==
                                                      model
                                                          .getReminderResponseModel!
                                                          .data!
                                                          .meta!
                                                          .totalPages
                                                  ? AppColors.primary1
                                                        .withOpacity(.4)
                                                  : AppColors.primary1,
                                              size: 20.sp,
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
                            SizedBox(height: 20.h),
                            // if (model.isReminderStatus == 'today' &&
                            //     model.getTodaysReminderModel != null)
                            //   Container(
                            //     padding: EdgeInsets.symmetric(
                            //       vertical: 14.w,
                            //       horizontal: 20.w,
                            //     ),
                            //     margin: EdgeInsets.only(bottom: 16.w),
                            //     width: double.infinity,
                            //     decoration: BoxDecoration(
                            //       color: AppColors.white,
                            //       borderRadius: BorderRadius.circular(10.r),
                            //     ),
                            //     child: Column(
                            //       crossAxisAlignment:
                            //           CrossAxisAlignment.start,
                            //       children: [
                            //         TextView(
                            //           text: 'Today’s Medications',
                            //           textStyle: TextStyle(
                            //             fontFamily: 'Arial',
                            //             fontSize: 13.2.sp,
                            //             fontWeight: FontWeight.w400,
                            //             color: AppColors.infoGrey,
                            //           ),
                            //         ),
                            //         SizedBox(height: 4.h),
                            //         Row(
                            //           mainAxisAlignment:
                            //               MainAxisAlignment.start,
                            //           children: [
                            //             SvgPicture.asset(
                            //               AppImage.calendar,
                            //               height: 18.h,
                            //               width: 18.w,
                            //               color: AppColors.infoGrey,
                            //             ),
                            //             SizedBox(width: 10.h),
                            //             TextView(
                            //               text: DateFormat(
                            //                 'EEEE, MMMM dd',
                            //               ).format(DateTime.now()),
                            //               textStyle: TextStyle(
                            //                 fontFamily: 'GoogleSans',
                            //                 fontSize: 15.2.sp,
                            //                 fontWeight: FontWeight.w700,
                            //                 color: AppColors.black,
                            //               ),
                            //             ),
                            //           ],
                            //         ),
                            //         SizedBox(height: 10.h),
                            // Divider(
                            //   thickness: .14,
                            //   color: AppColors.infoGrey,
                            // ),
                            //         SizedBox(height: 14.h),
                            //         Row(
                            //           children: [
                            //             GestureDetector(
                            //               onTap: () async {
                            //                 model.timePeriod = 'morning';
                            //                 await Future.delayed(
                            //                   Duration(milliseconds: 100),
                            //                 );
                            //                 model.getTodaysReminder(
                            //                   context,
                            //                   period: model.timePeriod,
                            //                   date: DateFormat(
                            //                     'yyyy-MM-dd',
                            //                   ).format(DateTime.now()),
                            //                 );
                            //                 model.notifyListeners();
                            //               },
                            //               child: Container(
                            //                 padding: EdgeInsets.symmetric(
                            //                   vertical: 8.w,
                            //                   horizontal: 24.0.w,
                            //                 ),
                            //                 decoration: BoxDecoration(
                            //                   border: Border.all(
                            //                     color:
                            //                         model.timePeriod ==
                            //                             'morning'
                            //                         ? AppColors.primary
                            //                         : AppColors.f1,
                            //                   ),
                            //                   borderRadius:
                            //                       BorderRadius.circular(
                            //                         22.0,
                            //                       ),
                            //                 ),
                            //                 child: Row(
                            //                   children: [
                            //                     SvgPicture.asset(
                            //                       AppImage.set,
                            //                     ),
                            //                     SizedBox(width: 6.w),
                            //                     TextView(
                            //                       text: 'Morning',
                            //                       textStyle: TextStyle(
                            //                         fontFamily: 'Arial',
                            //                         fontSize: 13.2.sp,
                            //                         fontWeight:
                            //                             FontWeight.w400,
                            //                         color:
                            //                             AppColors.infoGrey,
                            //                       ),
                            //                     ),
                            //                   ],
                            //                 ),
                            //               ),
                            //             ),
                            //             SizedBox(width: 10.4.h),
                            //             GestureDetector(
                            //               onTap: () async {
                            //                 model.timePeriod = 'afternoon';

                            //                 await Future.delayed(
                            //                   Duration(milliseconds: 100),
                            //                 );
                            //                 model.getTodaysReminder(
                            //                   context,
                            //                   period: model.timePeriod,
                            //                   date: DateFormat(
                            //                     'yyyy-MM-dd',
                            //                   ).format(DateTime.now()),
                            //                 );
                            //                 model.notifyListeners();
                            //               },
                            //               child: Container(
                            //                 padding: EdgeInsets.symmetric(
                            //                   vertical: 8.w,
                            //                   horizontal: 24.0.w,
                            //                 ),
                            //                 decoration: BoxDecoration(
                            //                   border: Border.all(
                            //                     color:
                            //                         model.timePeriod ==
                            //                             'afternoon'
                            //                         ? AppColors.primary
                            //                         : AppColors.f1,
                            //                   ),
                            //                   borderRadius:
                            //                       BorderRadius.circular(
                            //                         22.0,
                            //                       ),
                            //                 ),
                            //                 child: Row(
                            //                   children: [
                            //                     SvgPicture.asset(
                            //                       AppImage.noon,
                            //                     ),
                            //                     SizedBox(width: 6.w),
                            //                     TextView(
                            //                       text: 'Afternoon',
                            //                       textStyle: TextStyle(
                            //                         fontFamily: 'Arial',
                            //                         fontSize: 13.2.sp,
                            //                         fontWeight:
                            //                             FontWeight.w400,
                            //                         color:
                            //                             AppColors.infoGrey,
                            //                       ),
                            //                     ),
                            //                   ],
                            //                 ),
                            //               ),
                            //             ),
                            //           ],
                            //         ),
                            //         SizedBox(height: 10.h),
                            //         GestureDetector(
                            //           onTap: () async {
                            //             model.timePeriod = 'evening';
                            //             await Future.delayed(
                            //               Duration(milliseconds: 100),
                            //             );
                            //             model.getTodaysReminder(
                            //               context,
                            //               period: model.timePeriod,
                            //               date: DateFormat(
                            //                 'yyyy-MM-dd',
                            //               ).format(DateTime.now()),
                            //             );
                            //             model.notifyListeners();
                            //           },
                            //           child: Container(
                            //             width: 130.0.w,
                            //             padding: EdgeInsets.symmetric(
                            //               vertical: 8.w,
                            //               horizontal: 24.0.w,
                            //             ),
                            //             decoration: BoxDecoration(
                            //               border: Border.all(
                            //                 color:
                            //                     model.timePeriod ==
                            //                         'evening'
                            //                     ? AppColors.primary
                            //                     : AppColors.f1,
                            //               ),
                            //               borderRadius:
                            //                   BorderRadius.circular(22.0),
                            //             ),
                            //             child: Row(
                            //               children: [
                            //                 SvgPicture.asset(AppImage.dawn),
                            //                 SizedBox(width: 6.w),
                            //                 TextView(
                            //                   text: 'Evening',
                            //                   textStyle: TextStyle(
                            //                     fontFamily: 'Arial',
                            //                     fontSize: 13.2.sp,
                            //                     fontWeight: FontWeight.w400,
                            //                     color: AppColors.infoGrey,
                            //                   ),
                            //                 ),
                            //               ],
                            //             ),
                            //           ),
                            //         ),
                            //         SizedBox(height: 30.h),
                            //         ...model.getTodaysReminderModel!.data!.asMap().entries.map((
                            //           entry,
                            //         ) {
                            //           final index = entry.key;
                            //           final o = entry.value;
                            //           final isLast =
                            //               index ==
                            //               model
                            //                       .getTodaysReminderModel!
                            //                       .data!
                            //                       .length -
                            //                   1;
                            //           return Column(
                            //             children: [
                            //               Row(
                            //                 children: [
                            //                   Container(
                            //                     padding: EdgeInsets.all(
                            //                       14.w,
                            //                     ),
                            //                     decoration: BoxDecoration(
                            //                       color: AppColors.skyBlue,
                            //                       shape: BoxShape.circle,
                            //                     ),
                            //                     child: SvgPicture.asset(
                            //                       model.isMedTypeView(
                            //                         o.medicationType,
                            //                       ),
                            //                       color: AppColors.primary,
                            //                       height: 18.h,
                            //                       width: 18.w,
                            //                     ),
                            //                   ),
                            //                   SizedBox(width: 20.w),
                            //                   Column(
                            //                     crossAxisAlignment:
                            //                         CrossAxisAlignment
                            //                             .start,
                            //                     children: [
                            //                       TextView(
                            //                         text:
                            //                             o.medicationType
                            //                                 ?.capitalize() ??
                            //                             '',
                            //                         textStyle: TextStyle(
                            //                           fontFamily: 'Arial',
                            //                           fontSize: 13.2.sp,
                            //                           fontWeight:
                            //                               FontWeight.w400,
                            //                           color:
                            //                               AppColors.grey1,
                            //                         ),
                            //                       ),
                            //                       SizedBox(
                            //                         width: 120.w,
                            //                         child: TextView(
                            //                           text:
                            //                               o.medicationName ??
                            //                               '',
                            //                           textOverflow:
                            //                               TextOverflow
                            //                                   .ellipsis,
                            //                           maxLines: 1,
                            //                           textStyle: TextStyle(
                            //                             fontFamily:
                            //                                 'GoogleSans',
                            //                             fontSize: 15.2.sp,
                            //                             fontWeight:
                            //                                 FontWeight.w500,
                            //                             color:
                            //                                 AppColors.deep,
                            //                           ),
                            //                         ),
                            //                       ),
                            //                     ],
                            //                   ),
                            //                   Spacer(),
                            //                   Row(
                            //                     children: [
                            //                       TextView(
                            //                         text:
                            //                             '${o.time} ${model.checkTimePeriod(o.time)}',
                            //                         textStyle: TextStyle(
                            //                           fontFamily:
                            //                               'GoogleSans',
                            //                           fontSize: 18.2.sp,
                            //                           fontWeight:
                            //                               FontWeight.w400,
                            //                           color: AppColors
                            //                               .reminder,
                            //                         ),
                            //                       ),
                            //                       SizedBox(width: 10.w),
                            //                       Container(
                            //                         padding: EdgeInsets.all(
                            //                           1.2.w,
                            //                         ),
                            //                         decoration: BoxDecoration(
                            //                           color: model
                            //                               .checkMedsStatusColor(
                            //                                 o.status,
                            //                               ),
                            //                           shape:
                            //                               BoxShape.circle,
                            //                         ),
                            //                         child: model
                            //                             .checkMedsStatusWidget(
                            //                               o.status,
                            //                             ),
                            //                       ),
                            //                     ],
                            //                   ),
                            //                 ],
                            //               ),
                            //               SizedBox(height: 10.30.h),
                            //               if (!isLast)
                            //                 Divider(
                            //                   color: AppColors.infoGrey,
                            //                   thickness: .14,
                            //                 ),
                            //             ],
                            //           );
                            //         }),
                            //       ],
                            //     ),
                            //   ),

                            // SizedBox(height: 2.0.h),
                            // model.isReminderStatus == 'today'
                            //     ? SizedBox.shrink()
                            //     : Divider(
                            //         color: AppColors.buttonGrey1,
                            //         thickness: .4,
                            //       ),
                            // SizedBox(height: 4.0.h),
                            // model.isReminderStatus == 'today'
                            //     ? SizedBox.shrink()
                            //     : Row(
                            //         mainAxisAlignment:
                            //             MainAxisAlignment.spaceBetween,
                            //         children: [
                            //           IconButton(
                            //             onPressed:
                            //                 model
                            //                         .getReminderResponseModel!
                            //                         .data!
                            //                         .meta!
                            //                         .page ==
                            //                     1
                            //                 ? () {}
                            //                 : () async {
                            //                     if (model
                            //                             .isReminderStatus ==
                            //                         'all') {
                            //                       model.onSubAllLoading();
                            //                     }
                            //                     if (model
                            //                             .isReminderStatus ==
                            //                         'ongoing') {
                            //                       model.onSubGoingLoading();
                            //                     }
                            //                     if (model
                            //                             .isReminderStatus ==
                            //                         'completed') {
                            //                       model
                            //                           .onSubCompletedLoading();
                            //                     }
                            //                     if (model
                            //                             .isReminderStatus ==
                            //                         'today') {
                            //                       model.onSubTodayLoading();
                            //                     }
                            //                   },
                            //             icon: Icon(
                            //               Icons.arrow_back,
                            //               color:
                            //                   model
                            //                           .getReminderResponseModel!
                            //                           .data!
                            //                           .meta!
                            //                           .page ==
                            //                       1
                            //                   ? AppColors.primary1
                            //                         .withOpacity(.4)
                            //                   : AppColors.primary1,
                            //               size: 20.sp,
                            //             ),
                            //           ),

                            //           model.isLoading
                            //               ? SpinKitFadingCircle(
                            //                   size: 20.sp,
                            //                   color: AppColors.fineGrey,
                            //                 )
                            //               : TextView(
                            //                   text:
                            //                       'Page ${model.getReminderResponseModel!.data!.meta!.page} of ${model.getReminderResponseModel!.data!.meta!.totalPages}',
                            //                   textStyle: TextStyle(
                            //                     fontFamily: 'Arial',
                            //                     fontSize: 15.2.sp,
                            //                     fontWeight: FontWeight.w400,
                            //                     color: AppColors.black,
                            //                   ),
                            //                 ),
                            //           IconButton(
                            //             onPressed:
                            //                 model
                            //                         .getReminderResponseModel!
                            //                         .data!
                            //                         .meta!
                            //                         .page ==
                            //                     model
                            //                         .getReminderResponseModel!
                            //                         .data!
                            //                         .meta!
                            //                         .totalPages
                            //                 ? () {}
                            //                 : () async {
                            //                     if (model
                            //                             .isReminderStatus ==
                            //                         'all') {
                            //                       model.onAddAllLoading();
                            //                     }
                            //                     if (model
                            //                             .isReminderStatus ==
                            //                         'ongoing') {
                            //                       model.onAddGoingLoading();
                            //                     }
                            //                     if (model
                            //                             .isReminderStatus ==
                            //                         'completed') {
                            //                       model
                            //                           .onAddCompletedLoading();
                            //                     }
                            //                     if (model
                            //                             .isReminderStatus ==
                            //                         'today') {
                            //                       model.onAddTodayLoading();
                            //                     }
                            //                   },
                            //             icon: Icon(
                            //               Icons.arrow_forward,
                            //               color:
                            //                   model
                            //                           .getReminderResponseModel!
                            //                           .data!
                            //                           .meta!
                            //                           .page ==
                            //                       model
                            //                           .getReminderResponseModel!
                            //                           .data!
                            //                           .meta!
                            //                           .totalPages
                            //                   ? AppColors.primary1
                            //                         .withOpacity(.4)
                            //                   : AppColors.primary1,
                            //               size: 20.sp,
                            //             ),
                            //           ),
                            //         ],
                            //       ),
                            // SizedBox(height: 10.h),
                            // !model.isTapped
                            //     ? SizedBox.shrink()
                            //     : Container(
                            //         width: 156.0.w,
                            //         padding: EdgeInsets.symmetric(
                            //           horizontal: 18.22.w,
                            //           vertical: 18.20.w,
                            //         ),
                            //         decoration: BoxDecoration(
                            //           color: AppColors.white,
                            //           borderRadius: BorderRadius.circular(
                            //             20.w,
                            //           ),
                            //         ),
                            //         child: Column(
                            //           children: [
                            //             GestureDetector(
                            //               onTap: () => model
                            //                   .showCreateAddPhoneDialog(
                            //                     context,
                            //                   ),
                            //               child: Row(
                            //                 mainAxisAlignment:
                            //                     MainAxisAlignment.start,
                            //                 children: [
                            //                   SvgPicture.asset(
                            //                     AppImage.person_plus,
                            //                   ),
                            //                   SizedBox(width: 6.10.w),
                            //                   TextView(
                            //                     text: 'Set up Yourself',
                            //                     textStyle: TextStyle(
                            //                       fontFamily: 'Arial',
                            //                       fontSize: 13.2.sp,
                            //                       fontWeight:
                            //                           FontWeight.w400,
                            //                       color: AppColors.reminder,
                            //                     ),
                            //                   ),
                            //                 ],
                            //               ),
                            //             ),
                            //             SizedBox(height: 10.h),
                            //             Row(
                            //               mainAxisAlignment:
                            //                   MainAxisAlignment.start,
                            //               children: [
                            //                 SvgPicture.asset(
                            //                   AppImage.ai_star,
                            //                 ),
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
                            //           ],
                            //         ),
                            //       ),

                            // SizedBox(height: model.isTapped ? 70.h : 50.h),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 130.h),
                            SvgPicture.asset(AppImage.reminder),
                            SizedBox(height: 20.h),
                            TextView(
                              text: 'Here you’ll see your schedule for the day',
                              textStyle: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 15.2.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.black,
                              ),
                            ),
                            SizedBox(height: 2.10.h),
                            TextView(
                              text: 'Tap on the plus button to add one',
                              textStyle: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 13.2.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.infoGrey,
                              ),
                            ),
                            SizedBox(height: 20.h),
                            PopupMenuButton(
                              color: AppColors.white,
                              offset: const Offset(-78, 60),
                              padding: EdgeInsets.symmetric(
                                horizontal: 18.22.w,
                                vertical: 18.20.w,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.w),
                              ),
                              onSelected: (String value) {},
                              itemBuilder: (BuildContext context) {
                                return [
                                  PopupMenuItem(
                                    value: 'setup yourself',
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 18.22.w,
                                      vertical: 12.w,
                                    ),
                                    onTap: () =>
                                        model.showReminderModal(context),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SvgPicture.asset(AppImage.person_plus),
                                        SizedBox(width: 6.10.w),
                                        TextView(
                                          text: 'Set up Yourself',
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
                                  PopupMenuItem(
                                    value: 'ai setup',
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 18.22.w,
                                      vertical: 12.w,
                                    ),
                                    onTap: () {},
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SvgPicture.asset(AppImage.ai_star),
                                        SizedBox(width: 6.10.w),
                                        TextView(
                                          text: 'AI Setup',
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
                                ];
                              },
                              child: Container(
                                padding: EdgeInsets.all(12.w),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.primary,
                                ),
                                child: !model.isTapped
                                    ? Icon(
                                        Icons.add,
                                        color: AppColors.white,
                                        size: 20.sp,
                                      )
                                    : SvgPicture.asset(
                                        AppImage.x,
                                        color: AppColors.white,
                                        height: 20.h,
                                        width: 20.w,
                                      ),
                              ),
                            ),

                            SizedBox(height: 30.h),
                          ],
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget reminderWidget({
    context,
    isTab,
    Reminder? reminder,
    PharmViewModel? model,
    bool isComplete = false,
  }) => GestureDetector(
    onTap: () => navigate.navigateTo(
      Routes.pharmViewMedicationScreen,
      arguments: PharmViewMedicationScreenArguments(id: reminder.id),
    ),
    child: Container(
      padding: EdgeInsets.all(12.w),
      margin: EdgeInsets.only(bottom: 12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.infoGrey1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                    text: DateFormat(
                      'yyyy-MM-dd',
                    ).format(DateTime.parse(reminder!.createdAt!.toString())),
                    textStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 12.50.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.infoGrey,
                    ),
                  ),
                  SizedBox(height: 4.20.h),
                  TextView(
                    text: reminder.patientDetails?.fullName?.capitalize()?? '',
                    textStyle: TextStyle(
                      fontFamily: 'GoogleSans',
                      fontSize: 14.50.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.reminder,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h),
                  TextView(
                    text:
                        reminder.medication?.medicationStatus?.capitalize() ??
                        '',
                    textStyle: TextStyle(
                      fontFamily: 'GoogleSans',
                      fontSize: 12.50.sp,
                      fontWeight: FontWeight.w500,
                      color: reminder.medication?.medicationStatus == 'ONGOING'
                          ? AppColors.yellow
                          : reminder.medication?.medicationStatus == 'FAILED'
                          ? AppColors.red
                          : AppColors.app_green,
                    ),
                  ),
                  SizedBox(height: 4.20.h),
                  TextView(
                    text: reminder.payments!.isEmpty
                        ? '₦0'
                        : '₦${reminder.payments![0].amount ?? 0}',
                    textStyle: TextStyle(
                      fontFamily: 'GoogleSans',
                      fontSize: 16.50.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.thickGrey,
                    ),
                  ),
                  // SizedBox(height: 40.h),
                ],
              ),
            ],
          ),

          SizedBox(height: 14.20.h),
          Wrap(
            runSpacing: 4,
            alignment: WrapAlignment
                .start, // 👈 this makes it start from the beginning
            children: [
              if (reminder.payments!.isNotEmpty &&
                  reminder.payments![0].notificationChannelsPaidFor!.contains(
                    'SMS',
                  ))
                Container(
                  width: 80.w,
                  padding: EdgeInsets.symmetric(
                    horizontal: 11.4.w,
                    vertical: 4.2.w,
                  ),
                  margin: EdgeInsets.only(right: 10.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(color: AppColors.infoGrey1),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        AppImage.sms,
                        height: 18.h,
                        width: 19.2.w,
                      ),
                      SizedBox(width: 6.8.w),
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
              if (reminder.payments!.isNotEmpty &&
                  reminder.payments![0].notificationChannelsPaidFor!.contains(
                    'PHONE_CALL',
                  ))
                Container(
                  width: 120.w,
                  padding: EdgeInsets.symmetric(
                    horizontal: 11.4.w,
                    vertical: 4.2.w,
                  ),
                  margin: EdgeInsets.only(right: 10.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(color: AppColors.infoGrey1),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        AppImage.phone,
                        height: 16.h,
                        width: 16.w,
                        color: AppColors.infoGrey,
                      ),
                      SizedBox(width: 6.8.w),
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
              if (reminder.payments!.isNotEmpty &&
                  reminder.payments![0].notificationChannelsPaidFor!.contains(
                    'WHATSAPP',
                  ))
                Container(
                  width: 120.w,
                  padding: EdgeInsets.symmetric(
                    horizontal: 11.4.w,
                    vertical: 4.2.w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(color: AppColors.infoGrey1),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        AppImage.whatsapp,
                        height: 16.h,
                        width: 16.w,
                        color: AppColors.infoGrey,
                      ),
                      SizedBox(width: 6.8.w),
                      TextView(
                        text: 'WhatsApp',
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
    ),
  );

  payStatus(List<Payment>? payments) {
    if (payments!.isNotEmpty && payments[0].status == 'SUCCESS') {
      return 'Paid';
    }
    if (payments.isNotEmpty && payments[0].status == 'PENDING') {
      return 'Pending';
    }
    return 'Free';
  }

  payStatusColor(List<Payment>? payments) {
    if (payments!.isNotEmpty && payments[0].status == 'SUCCESS') {
      return AppColors.app_green;
    }
    if (payments.isNotEmpty && payments[0].status == 'PENDING') {
      return AppColors.yellow;
    }
    return AppColors.greygrey;
  }
}
