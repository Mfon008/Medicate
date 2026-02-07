// ignore_for_file: deprecated_member_use, strict_top_level_inference, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:medicate_app/core/app_assets/constant.dart';
import 'package:stacked/stacked.dart';
import '../../../core/app_assets/image.dart';
import '../../../core/config/colors.dart';
import '../../../core/connect_end/model/get_reminder_response_model/payment.dart';
import '../../../core/connect_end/model/get_reminder_response_model/reminder.dart';
import '../../../core/connect_end/view_model/auth_view_model.dart';
import '../../../core/core_folder/app/app.router.dart';
import '../../../main.dart';
import '../../widget/text.dart';

class ReminderScreen extends StatefulWidget {
  const ReminderScreen({super.key});

  @override
  State<ReminderScreen> createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  @override
  Widget build(BuildContext context) {
    bool isTablet(BuildContext context) =>
        MediaQuery.of(context).size.shortestSide >= 600;
    return ViewModelBuilder<AuthViewModel>.reactive(
      viewModelBuilder: () => AuthViewModel(),
      onViewModelReady: (model) {
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          await model.getTodaysReminder(
            context,
            period: model.timePeriod,
            date: DateFormat('yyyy-MM-dd').format(DateTime.now()),
          );
          model.getReminder(
            context,
            status: model.isReminderStatus,
            page: model.pageOngoing.toString(),
          );
        });
      },
      disposeViewModel: false,
      onDispose: (viewModel) {},
      builder: (_, AuthViewModel model, _) {
        return Scaffold(
          backgroundColor: AppColors.dashboard,
          floatingActionButton:
              model.getReminderResponseModel != null &&
                  model.getReminderResponseModel!.data!.reminders!.isEmpty
              ? SizedBox.shrink()
              : FloatingActionButton(
                  onPressed: () {
                    // setState(() {
                    //   model.isTapped = !model.isTapped;
                    // });
                  },
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
                    child: Icon(Icons.add, color: AppColors.white, size: 25.sp)
                    // !model.isTapped
                    //     ? Icon(Icons.add, color: AppColors.white, size: 25.sp)
                    //     : SvgPicture.asset(
                    //         AppImage.x,
                    //         color: AppColors.white,
                    //         height: 20.h,
                    //         width: 20.w,
                    //       ),
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
                      onPressed: () => navigate.navigateTo(Routes.moreScreen),
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
            // physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(
              vertical: model.checkReminderEmpty() ? 20.w : 50.w,
              horizontal: 16.w,
            ),
            child: Column(
              children: [
                model.checkReminderEmpty()
                    ? Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(10.w),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(32.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () async {
                                  model
                                      .getReminderResponseModel!
                                      .data!
                                      .reminders!
                                      .clear();
                                  await Future.delayed(
                                    Duration(milliseconds: 500),
                                  );
                                  model.isReminderStatus = 'today';
                                  model.getTodaysReminder(
                                    context,
                                    period: model.timePeriod,
                                    date: DateFormat(
                                      'yyyy-MM-dd',
                                    ).format(DateTime.now()),
                                  );
                                  setState(() {});
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 10.w),
                                  decoration: model.isReminderStatus == 'today'
                                      ? BoxDecoration(
                                          color: AppColors.primary.withOpacity(
                                            .04,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            22.r,
                                          ),
                                        )
                                      : BoxDecoration(),
                                  alignment: Alignment.center,
                                  child: TextView(
                                    text: 'Today’s Med',
                                    textStyle: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: model.isReminderStatus == 'today'
                                          ? AppColors.primary
                                          : AppColors.grey1,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Expanded(
                              child: GestureDetector(
                                onTap: () async {
                                  model
                                      .getReminderResponseModel!
                                      .data!
                                      .reminders!
                                      .clear();
                                  await Future.delayed(
                                    Duration(milliseconds: 500),
                                  );
                                  model.isReminderStatus = 'all';
                                  model.getReminder(
                                    context,
                                    status: model.isReminderStatus,
                                    page: model.pageOngoing.toString(),
                                  );
                                  setState(() {});
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 10.w),
                                  decoration: model.isReminderStatus == 'all'
                                      ? BoxDecoration(
                                          color: AppColors.primary.withOpacity(
                                            .04,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            22.r,
                                          ),
                                        )
                                      : BoxDecoration(),
                                  alignment: Alignment.center,
                                  child: TextView(
                                    text: 'My Reminders',
                                    textStyle: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color:
                                          model.isReminderStatus == 'all' ||
                                              model.isReminderStatus ==
                                                  'ongoing' ||
                                              model.isReminderStatus ==
                                                  'completed'
                                          ? AppColors.primary
                                          : AppColors.grey1,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : SizedBox.shrink(),

                model.isReminderStatus == 'all' ||
                        model.isReminderStatus == 'ongoing' ||
                        model.isReminderStatus == 'completed'
                    ? Align(
                        alignment: Alignment.topLeft,
                        child: PopupMenuButton<String>(
                          color: AppColors.white,
                          child: Container(
                            width: 166.0.w,
                            padding: EdgeInsets.symmetric(
                              vertical: 3.2.w,
                              horizontal: 12.w,
                            ),
                            margin: EdgeInsets.symmetric(vertical: 20.w),
                            decoration: BoxDecoration(
                              color: AppColors.primary.withOpacity(.04),
                              borderRadius: BorderRadius.circular(32.r),
                              border: Border.all(color: AppColors.primary),
                            ),
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextView(
                                  text: model.isReminderStatus.capitalize(),
                                  textStyle: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.primary,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(14.20.w),
                                  child: SvgPicture.asset(AppImage.arrow_down),
                                ),
                              ],
                            ),
                          ),

                          onSelected: (String result) async {
                            // genderController.text = result;
                            model.isReminderStatus = result;
                            await Future.delayed(Duration(milliseconds: 400));
                            model.getReminder(
                              context,
                              status: model.isReminderStatus,
                              page: model.pageOngoing.toString(),
                            );
                            setState(() {});
                            model.notifyListeners();
                          },
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuItem<String>>[
                                PopupMenuItem<String>(
                                  value: 'all',
                                  child: TextView(
                                    text: 'All',
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
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
                                      fontWeight: FontWeight.w400,
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
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Arial',
                                      fontSize: 15.2.sp,
                                      color: AppColors.black,
                                    ),
                                  ),
                                ),
                              ],
                        ),
                      )
                    : SizedBox.shrink(),

                model.isReminderStatus == 'today'
                    ? Center(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * .62,
                          child: RefreshIndicator(
                            onRefresh: () async {
                              model.getTodaysReminder(
                                context,
                                period: model.timePeriod,
                                date: DateFormat(
                                  'yyyy-MM-dd',
                                ).format(DateTime.now()),
                              );
                            },
                            child: SingleChildScrollView(
                              physics: AlwaysScrollableScrollPhysics(),
                              child: Column(
                                children: [
                                  SizedBox(height: 30.h),
                                  if (model.isReminderStatus == 'today' &&
                                      model.getTodaysReminderModel != null)
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 14.w,
                                        horizontal: 20.w,
                                      ),
                                      margin: EdgeInsets.only(bottom: 16.w),
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: AppColors.white,
                                        borderRadius: BorderRadius.circular(
                                          10.r,
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextView(
                                            text: 'Today’s Medications',
                                            textStyle: TextStyle(
                                              fontFamily: 'Arial',
                                              fontSize: 13.2.sp,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.infoGrey,
                                            ),
                                          ),
                                          SizedBox(height: 4.h),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SvgPicture.asset(
                                                AppImage.calendar,
                                                height: 18.h,
                                                width: 18.w,
                                                color: AppColors.infoGrey,
                                              ),
                                              SizedBox(width: 10.h),
                                              TextView(
                                                text: DateFormat(
                                                  'EEEE, MMMM dd',
                                                ).format(DateTime.now()),
                                                textStyle: TextStyle(
                                                  fontFamily: 'GoogleSans',
                                                  fontSize: 15.2.sp,
                                                  fontWeight: FontWeight.w700,
                                                  color: AppColors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 10.h),
                                          Divider(
                                            thickness: .14,
                                            color: AppColors.infoGrey,
                                          ),
                                          SizedBox(height: 14.h),
                                          Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () async {
                                                  model.timePeriod = 'morning';
                                                  await Future.delayed(
                                                    Duration(milliseconds: 100),
                                                  );
                                                  model.getTodaysReminder(
                                                    context,
                                                    period: model.timePeriod,
                                                    date: DateFormat(
                                                      'yyyy-MM-dd',
                                                    ).format(DateTime.now()),
                                                  );
                                                  model.notifyListeners();
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                    vertical: 8.w,
                                                    horizontal: 24.0.w,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color:
                                                          model.timePeriod ==
                                                              'morning'
                                                          ? AppColors.primary
                                                          : AppColors.f1,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          22.0,
                                                        ),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      SvgPicture.asset(
                                                        AppImage.set,
                                                      ),
                                                      SizedBox(width: 6.w),
                                                      TextView(
                                                        text: 'Morning',
                                                        textStyle: TextStyle(
                                                          fontFamily: 'Arial',
                                                          fontSize: 13.2.sp,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: AppColors
                                                              .infoGrey,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 10.4.h),
                                              GestureDetector(
                                                onTap: () async {
                                                  model.timePeriod =
                                                      'afternoon';

                                                  await Future.delayed(
                                                    Duration(milliseconds: 100),
                                                  );
                                                  model.getTodaysReminder(
                                                    context,
                                                    period: model.timePeriod,
                                                    date: DateFormat(
                                                      'yyyy-MM-dd',
                                                    ).format(DateTime.now()),
                                                  );
                                                  model.notifyListeners();
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                    vertical: 8.w,
                                                    horizontal: 24.0.w,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color:
                                                          model.timePeriod ==
                                                              'afternoon'
                                                          ? AppColors.primary
                                                          : AppColors.f1,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          22.0,
                                                        ),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      SvgPicture.asset(
                                                        AppImage.noon,
                                                      ),
                                                      SizedBox(width: 6.w),
                                                      TextView(
                                                        text: 'Afternoon',
                                                        textStyle: TextStyle(
                                                          fontFamily: 'Arial',
                                                          fontSize: 13.2.sp,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: AppColors
                                                              .infoGrey,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 10.h),
                                          GestureDetector(
                                            onTap: () async {
                                              model.timePeriod = 'evening';
                                              await Future.delayed(
                                                Duration(milliseconds: 100),
                                              );
                                              model.getTodaysReminder(
                                                context,
                                                period: model.timePeriod,
                                                date: DateFormat(
                                                  'yyyy-MM-dd',
                                                ).format(DateTime.now()),
                                              );
                                              model.notifyListeners();
                                            },
                                            child: Container(
                                              width: 130.0.w,
                                              padding: EdgeInsets.symmetric(
                                                vertical: 8.w,
                                                horizontal: 24.0.w,
                                              ),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color:
                                                      model.timePeriod ==
                                                          'evening'
                                                      ? AppColors.primary
                                                      : AppColors.f1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(22.0),
                                              ),
                                              child: Row(
                                                children: [
                                                  SvgPicture.asset(
                                                    AppImage.dawn,
                                                  ),
                                                  SizedBox(width: 6.w),
                                                  TextView(
                                                    text: 'Evening',
                                                    textStyle: TextStyle(
                                                      fontFamily: 'Arial',
                                                      fontSize: 13.2.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: AppColors.infoGrey,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 30.h),
                                          ...model.getTodaysReminderModel!.data!.asMap().entries.map((
                                            entry,
                                          ) {
                                            final index = entry.key;
                                            final o = entry.value;
                                            final isLast =
                                                index ==
                                                model
                                                        .getTodaysReminderModel!
                                                        .data!
                                                        .length -
                                                    1;
                                            return Column(
                                              children: [
                                                GestureDetector(
                                                  onTap: () => model
                                                      .showUpdateDoseDialog(
                                                        context,
                                                        o: o,
                                                      ),
                                                  child: Container(
                                                    color:
                                                        AppColors.transparent,
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          padding:
                                                              EdgeInsets.all(
                                                                14.w,
                                                              ),
                                                          decoration:
                                                              BoxDecoration(
                                                                color: AppColors
                                                                    .skyBlue,
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                          child: SvgPicture.asset(
                                                            model.isMedTypeView(
                                                              o.medicationType,
                                                            ),
                                                            color: AppColors
                                                                .primary,
                                                            height: 18.h,
                                                            width: 18.w,
                                                          ),
                                                        ),
                                                        SizedBox(width: 20.w),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            TextView(
                                                              text:
                                                                  o.medicationType
                                                                      ?.capitalize() ??
                                                                  '',
                                                              textStyle: TextStyle(
                                                                fontFamily:
                                                                    'Arial',
                                                                fontSize:
                                                                    13.2.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: AppColors
                                                                    .grey1,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 120.w,
                                                              child: TextView(
                                                                text:
                                                                    o.drugName ??
                                                                    '',
                                                                textOverflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                maxLines: 1,
                                                                textStyle: TextStyle(
                                                                  fontFamily:
                                                                      'GoogleSans',
                                                                  fontSize:
                                                                      15.2.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color:
                                                                      AppColors
                                                                          .deep,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Spacer(),
                                                        Row(
                                                          children: [
                                                            TextView(
                                                              text:
                                                                  '${o.time} ${model.checkTimePeriod(o.time)}',
                                                              textStyle: TextStyle(
                                                                fontFamily:
                                                                    'GoogleSans',
                                                                fontSize:
                                                                    18.2.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: AppColors
                                                                    .reminder,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 10.w,
                                                            ),
                                                            Container(
                                                              padding:
                                                                  EdgeInsets.all(
                                                                    1.2.w,
                                                                  ),
                                                              decoration: BoxDecoration(
                                                                color: model
                                                                    .checkMedsStatusColor(
                                                                      o.status,
                                                                    ),
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child: model
                                                                  .checkMedsStatusWidget(
                                                                    o.status,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 10.30.h),
                                                if (!isLast)
                                                  Divider(
                                                    color: AppColors.infoGrey,
                                                    thickness: .14,
                                                  ),
                                              ],
                                            );
                                          }),
                                        ],
                                      ),
                                    ),

                                  SizedBox(height: 30.h),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    : Center(
                        child:
                            model.getReminderResponseModel != null &&
                                model
                                    .getReminderResponseModel!
                                    .data!
                                    .reminders!
                                    .isNotEmpty
                            ? SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .62,
                                child: SingleChildScrollView(
                                  physics: AlwaysScrollableScrollPhysics(),
                                  child: Column(
                                    children: [
                                      SizedBox(height: 30.h),
                                      if (model.isReminderStatus == 'all')
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
                                      if (model.isReminderStatus == 'today' &&
                                          model.getTodaysReminderModel != null)
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 14.w,
                                            horizontal: 20.w,
                                          ),
                                          margin: EdgeInsets.only(bottom: 16.w),
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: AppColors.white,
                                            borderRadius: BorderRadius.circular(
                                              10.r,
                                            ),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TextView(
                                                text: 'Today’s Medications',
                                                textStyle: TextStyle(
                                                  fontFamily: 'Arial',
                                                  fontSize: 13.2.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.infoGrey,
                                                ),
                                              ),
                                              SizedBox(height: 4.h),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  SvgPicture.asset(
                                                    AppImage.calendar,
                                                    height: 18.h,
                                                    width: 18.w,
                                                    color: AppColors.infoGrey,
                                                  ),
                                                  SizedBox(width: 10.h),
                                                  TextView(
                                                    text: DateFormat(
                                                      'EEEE, MMMM dd',
                                                    ).format(DateTime.now()),
                                                    textStyle: TextStyle(
                                                      fontFamily: 'GoogleSans',
                                                      fontSize: 15.2.sp,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: AppColors.black,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 10.h),
                                              Divider(
                                                thickness: .14,
                                                color: AppColors.infoGrey,
                                              ),
                                              SizedBox(height: 14.h),
                                              Row(
                                                children: [
                                                  GestureDetector(
                                                    onTap: () async {
                                                      model.timePeriod =
                                                          'morning';
                                                      await Future.delayed(
                                                        Duration(
                                                          milliseconds: 100,
                                                        ),
                                                      );
                                                      model.getTodaysReminder(
                                                        context,
                                                        period:
                                                            model.timePeriod,
                                                        date:
                                                            DateFormat(
                                                              'yyyy-MM-dd',
                                                            ).format(
                                                              DateTime.now(),
                                                            ),
                                                      );
                                                      model.notifyListeners();
                                                    },
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                            vertical: 8.w,
                                                            horizontal: 24.0.w,
                                                          ),
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                          color:
                                                              model.timePeriod ==
                                                                  'morning'
                                                              ? AppColors
                                                                    .primary
                                                              : AppColors.f1,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              22.0,
                                                            ),
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          SvgPicture.asset(
                                                            AppImage.set,
                                                          ),
                                                          SizedBox(width: 6.w),
                                                          TextView(
                                                            text: 'Morning',
                                                            textStyle: TextStyle(
                                                              fontFamily:
                                                                  'Arial',
                                                              fontSize: 13.2.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: AppColors
                                                                  .infoGrey,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: 10.4.h),
                                                  GestureDetector(
                                                    onTap: () async {
                                                      model.timePeriod =
                                                          'afternoon';

                                                      await Future.delayed(
                                                        Duration(
                                                          milliseconds: 100,
                                                        ),
                                                      );
                                                      model.getTodaysReminder(
                                                        context,
                                                        period:
                                                            model.timePeriod,
                                                        date:
                                                            DateFormat(
                                                              'yyyy-MM-dd',
                                                            ).format(
                                                              DateTime.now(),
                                                            ),
                                                      );
                                                      model.notifyListeners();
                                                    },
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                            vertical: 8.w,
                                                            horizontal: 24.0.w,
                                                          ),
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                          color:
                                                              model.timePeriod ==
                                                                  'afternoon'
                                                              ? AppColors
                                                                    .primary
                                                              : AppColors.f1,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              22.0,
                                                            ),
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          SvgPicture.asset(
                                                            AppImage.noon,
                                                          ),
                                                          SizedBox(width: 6.w),
                                                          TextView(
                                                            text: 'Afternoon',
                                                            textStyle: TextStyle(
                                                              fontFamily:
                                                                  'Arial',
                                                              fontSize: 13.2.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: AppColors
                                                                  .infoGrey,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 10.h),
                                              GestureDetector(
                                                onTap: () async {
                                                  model.timePeriod = 'evening';
                                                  await Future.delayed(
                                                    Duration(milliseconds: 100),
                                                  );
                                                  model.getTodaysReminder(
                                                    context,
                                                    period: model.timePeriod,
                                                    date: DateFormat(
                                                      'yyyy-MM-dd',
                                                    ).format(DateTime.now()),
                                                  );
                                                  model.notifyListeners();
                                                },
                                                child: Container(
                                                  width: 130.0.w,
                                                  padding: EdgeInsets.symmetric(
                                                    vertical: 8.w,
                                                    horizontal: 24.0.w,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color:
                                                          model.timePeriod ==
                                                              'evening'
                                                          ? AppColors.primary
                                                          : AppColors.f1,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          22.0,
                                                        ),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      SvgPicture.asset(
                                                        AppImage.dawn,
                                                      ),
                                                      SizedBox(width: 6.w),
                                                      TextView(
                                                        text: 'Evening',
                                                        textStyle: TextStyle(
                                                          fontFamily: 'Arial',
                                                          fontSize: 13.2.sp,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: AppColors
                                                              .infoGrey,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 30.h),
                                              ...model.getTodaysReminderModel!.data!.asMap().entries.map((
                                                entry,
                                              ) {
                                                final index = entry.key;
                                                final o = entry.value;
                                                final isLast =
                                                    index ==
                                                    model
                                                            .getTodaysReminderModel!
                                                            .data!
                                                            .length -
                                                        1;
                                                return Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Container(
                                                          padding:
                                                              EdgeInsets.all(
                                                                14.w,
                                                              ),
                                                          decoration:
                                                              BoxDecoration(
                                                                color: AppColors
                                                                    .skyBlue,
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                          child: SvgPicture.asset(
                                                            model.isMedTypeView(
                                                              o.medicationType,
                                                            ),
                                                            color: AppColors
                                                                .primary,
                                                            height: 18.h,
                                                            width: 18.w,
                                                          ),
                                                        ),
                                                        SizedBox(width: 20.w),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            TextView(
                                                              text:
                                                                  o.medicationType
                                                                      ?.capitalize() ??
                                                                  '',
                                                              textStyle: TextStyle(
                                                                fontFamily:
                                                                    'Arial',
                                                                fontSize:
                                                                    13.2.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: AppColors
                                                                    .grey1,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 120.w,
                                                              child: TextView(
                                                                text:
                                                                    o.drugName ??
                                                                    '',
                                                                textOverflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                maxLines: 1,
                                                                textStyle: TextStyle(
                                                                  fontFamily:
                                                                      'GoogleSans',
                                                                  fontSize:
                                                                      15.2.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color:
                                                                      AppColors
                                                                          .deep,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Spacer(),
                                                        Row(
                                                          children: [
                                                            TextView(
                                                              text:
                                                                  '${o.time} ${model.checkTimePeriod(o.time)}',
                                                              textStyle: TextStyle(
                                                                fontFamily:
                                                                    'GoogleSans',
                                                                fontSize:
                                                                    18.2.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: AppColors
                                                                    .reminder,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 10.w,
                                                            ),
                                                            Container(
                                                              padding:
                                                                  EdgeInsets.all(
                                                                    1.2.w,
                                                                  ),
                                                              decoration: BoxDecoration(
                                                                color: model
                                                                    .checkMedsStatusColor(
                                                                      o.status,
                                                                    ),
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child: model
                                                                  .checkMedsStatusWidget(
                                                                    o.status,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(height: 10.30.h),
                                                    if (!isLast)
                                                      Divider(
                                                        color:
                                                            AppColors.infoGrey,
                                                        thickness: .14,
                                                      ),
                                                  ],
                                                );
                                              }),
                                            ],
                                          ),
                                        ),

                                      SizedBox(height: 2.0.h),
                                      model.isReminderStatus == 'today'
                                          ? SizedBox.shrink()
                                          : Divider(
                                              color: AppColors.buttonGrey1,
                                              thickness: .4,
                                            ),
                                      SizedBox(height: 4.0.h),
                                      model.isReminderStatus == 'today'
                                          ? SizedBox.shrink()
                                          : Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                IconButton(
                                                  onPressed:
                                                      model
                                                              .getReminderResponseModel!
                                                              .data!
                                                              .meta!
                                                              .page ==
                                                          '1'
                                                      ? () {}
                                                      : () async {
                                                          if (model
                                                                  .isReminderStatus ==
                                                              'ongoing') {
                                                            model
                                                                .onSubGoingLoading();
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
                                                            model
                                                                .onSubTodayLoading();
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
                                                            '1'
                                                        ? AppColors.primary1
                                                              .withOpacity(.4)
                                                        : AppColors.primary1,
                                                    size: 20.sp,
                                                  ),
                                                ),

                                                model.isLoading
                                                    ? SpinKitFadingCircle(
                                                        size: 20.sp,
                                                        color:
                                                            AppColors.fineGrey,
                                                      )
                                                    : TextView(
                                                        text:
                                                            'Page ${model.getReminderResponseModel!.data!.meta!.page} of ${model.getReminderResponseModel!.data!.meta!.totalPages}',
                                                        textStyle: TextStyle(
                                                          fontFamily: 'Arial',
                                                          fontSize: 15.2.sp,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color:
                                                              AppColors.black,
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
                                                              .toString()
                                                      ? () {}
                                                      : () async {
                                                          if (model
                                                                  .isReminderStatus ==
                                                              'ongoing') {
                                                            model
                                                                .onAddGoingLoading();
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
                                                            model
                                                                .onAddTodayLoading();
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
                                                                .toString()
                                                        ? AppColors.primary1
                                                              .withOpacity(.4)
                                                        : AppColors.primary1,
                                                    size: 20.sp,
                                                  ),
                                                ),
                                              ],
                                            ),
                                      SizedBox(height: 10.h),
                                      !model.isTapped
                                          ? SizedBox.shrink()
                                          : Container(
                                              width: 156.0.w,
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 18.22.w,
                                                vertical: 18.20.w,
                                              ),
                                              decoration: BoxDecoration(
                                                color: AppColors.white,
                                                borderRadius:
                                                    BorderRadius.circular(20.w),
                                              ),
                                              child: Column(
                                                children: [
                                                  GestureDetector(
                                                    onTap: () =>
                                                        model.showReminderModal(
                                                          context,
                                                        ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        SvgPicture.asset(
                                                          AppImage.person_plus,
                                                        ),
                                                        SizedBox(width: 6.10.w),
                                                        TextView(
                                                          text:
                                                              'Set up Yourself',
                                                          textStyle: TextStyle(
                                                            fontFamily: 'Arial',
                                                            fontSize: 13.2.sp,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: AppColors
                                                                .reminder,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height: 10.h),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      SvgPicture.asset(
                                                        AppImage.ai_star,
                                                      ),
                                                      SizedBox(width: 6.10.w),
                                                      TextView(
                                                        text: 'AI Setup',
                                                        textStyle: TextStyle(
                                                          fontFamily: 'Arial',
                                                          fontSize: 13.2.sp,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: AppColors
                                                              .reminder,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),

                                      SizedBox(
                                        height: !model.isTapped ? 60.h : 30.h,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : Column(
                                children: [
                                  SizedBox(height: 130.h),
                                  SvgPicture.asset(AppImage.reminder),
                                  SizedBox(height: 20.h),
                                  TextView(
                                    text:
                                        'Here you’ll see your schedule for the day',
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
                                  GestureDetector(
                                    onTap: () => setState(() {
                                      model.isTapped = !model.isTapped;
                                    }),
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
                                  //                   .showReminderModal(context),
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
                                  //                       color:
                                  //                           AppColors.reminder,
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
                                  //                     fontWeight:
                                  //                         FontWeight.w400,
                                  //                     color: AppColors.reminder,
                                  //                   ),
                                  //                 ),
                                  //               ],
                                  //             ),
                                  //           ],
                                  //         ),
                                  //       ),
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

  reminderWidget({
    context,
    isTab,
    Reminder? reminder,
    AuthViewModel? model,
    bool isComplete = false,
  }) => GestureDetector(
    onTap: () => navigate.navigateTo(
      Routes.viewMedicationScreen,
      arguments: ViewMedicationScreenArguments(id: reminder.id),
    ),
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 12.w, horizontal: 10.w),
      margin: EdgeInsets.only(bottom: 16.w),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 36.0.w,
                horizontal: 36.40.w,
              ),
              width: MediaQuery.of(context).size.width / 2.5,
              height: 150.h,
              decoration: BoxDecoration(
                color: AppColors.dashboard,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Image.network(
                reminder?.medication?.medicationImage?.url ?? '',
                height: 76.h,
                width: 76.w,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Padding(
                  padding: EdgeInsets.all(18.w),
                  child: SvgPicture.asset(
                    color: AppColors.primary,
                    model!.errorRemidnderImage(
                      reminder!.medication!.medicationType,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 15.20.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 140.w,
                child: TextView(
                  text: reminder?.medication?.medicationName ?? '',
                  maxLines: 1,
                  textOverflow: TextOverflow.ellipsis,
                  textStyle: TextStyle(
                    fontFamily: 'GoogleSans',
                    fontSize: 16.2.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.reminder,
                  ),
                ),
              ),
              SizedBox(height: 4.h),
              TextView(
                text:
                    '${DateFormat('MMM d').format(reminder!.medication!.startDateTime!)} - ${DateFormat('MMM d').format(reminder.medication!.endDateTime!)}',
                textStyle: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 13.2.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey1,
                ),
              ),
              SizedBox(height: 6.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: isTab ? 230.w : 130.w,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5.0),
                      ), // Adjust radius as needed
                      child: LinearProgressIndicator(
                        minHeight: 4.0, // Adjust height as needed
                        value: model!.getReminderStatusValue(
                          reminder.medication!.dailyDoseTimes!,
                        ),
                        color: AppColors.lightBlue, // Progress bar color
                        backgroundColor:
                            Colors.grey[300], // Background track color
                      ),
                    ),
                  ),
                  SizedBox(width: 7.10.w),
                  TextView(
                    text: '${model.takenCount}/${model.totalCount}',
                    textStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.infoGrey,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 14.h),
              TextView(
                text: 'Dosage',
                textStyle: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 13.2.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.infoGrey,
                ),
              ),
              SizedBox(height: 2.h),
              Row(
                children: [
                  TextView(
                    text: reminder.medication?.dosage ?? '',
                    textStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 14.2.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.reminder,
                    ),
                  ),
                  SizedBox(width: 4.6.w),
                  TextView(
                    text: 'x${reminder.medication?.timesPerDay} daily',
                    textStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.infoGrey,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 6.h),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(3.2.w),
                    decoration: BoxDecoration(
                      color: !isComplete
                          ? payStatusColor(reminder.payments)
                          : AppColors.app_green,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 4.6.w),
                  TextView(
                    text: !isComplete
                        ? payStatus(reminder.payments)
                        : 'Completed',
                    textStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.reminder,
                    ),
                  ),
                ],
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
