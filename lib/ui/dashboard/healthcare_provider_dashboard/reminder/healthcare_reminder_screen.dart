// ignore_for_file: deprecated_member_use, strict_top_level_inference, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:medicate_app/core/app_assets/constant.dart';
import 'package:medicate_app/core/connect_end/model/get_reminder_for_tenant_response_model/payment.dart';
import 'package:medicate_app/core/core_folder/manager/shared_preference.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/app_assets/image.dart';
import '../../../../core/config/colors.dart';
import '../../../../core/connect_end/model/get_reminder_for_tenant_response_model/reminder.dart';
import '../../../../core/connect_end/view_model/health_care_view_model.dart';
import '../../../../core/core_folder/app/app.router.dart';
import '../../../../main.dart';
import '../../../widget/text.dart';
import '../../../widget/text_form_widget.dart';

class HealthCareReminderScreen extends StatefulWidget {
  const HealthCareReminderScreen({super.key});

  @override
  State<HealthCareReminderScreen> createState() => _HealthCareReminderScreenState();
}

class _HealthCareReminderScreenState extends State<HealthCareReminderScreen> {
  @override
  Widget build(BuildContext context) {
    bool isTablet(BuildContext context) =>
        MediaQuery.of(context).size.shortestSide >= 600;
    return ViewModelBuilder<HealthCareViewModel>.reactive(
      viewModelBuilder: () => HealthCareViewModel(),
      onViewModelReady: (model) {
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          await model.getReminder(
            context,
            status: model.isReminderStatus,
            page: model.pageOngoing.toString(),
          );
        });
      },
      disposeViewModel: false,
      onDispose: (viewModel) {},
      builder: (_, HealthCareViewModel model, _) {
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
                      onPressed: () => SharedPreferencesService.instance.usersData['memberships'][0]['tenantType']=='HEALTHCARE_PRACTITIONER'?
                          navigate.navigateTo(Routes.specialistsProvidersMoreScreen):navigate.navigateTo(Routes.businessProvidersMoreScreen),
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
                
                Center(
                  child:
                      model.getReminderResponseModel != null &&
                          model.getReminderResponseModel!.data!.reminders !=
                              null &&
                          model
                              .getReminderResponseModel!
                              .data!
                              .reminders!
                              .isNotEmpty
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
                                                model.searchuserByHealthCareReminder =
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
                                        if (model.searchuserByHealthCareReminder !=
                                            '')
                                          ...model
                                              .getReminderResponseModel!
                                              .data!
                                              .reminders!
                                              .where(
                                                (e) => e
                                                    .patientDetails!
                                                    .fullName!
                                                    .toLowerCase()
                                                    .contains(
                                                      model
                                                          .searchuserByHealthCareReminder!
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
                                              .map(
                                                (e) => reminderWidget(
                                                  context: context,
                                                  isTab: isTablet(context),
                                                  reminder: e,
                                                  model: model,
                                                ),
                                              ),

                                      if (model.isReminderStatus == 'ongoing')
                                        if (model.searchuserByHealthCareReminder !=
                                            '')
                                          ...model
                                              .getReminderResponseModel!
                                              .data!
                                              .reminders!
                                              .where(
                                                (e) => e.user!.fullName!
                                                    .toLowerCase()
                                                    .contains(
                                                      model
                                                          .searchuserByHealthCareReminder!
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
                                              .map(
                                                (e) => reminderWidget(
                                                  context: context,
                                                  isTab: isTablet(context),
                                                  reminder: e,
                                                  model: model,
                                                ),
                                              ),

                                      if (model.isReminderStatus == 'completed')
                                        if (model.searchuserByHealthCareReminder !=
                                            '')
                                          ...model
                                              .getReminderResponseModel!
                                              .data!
                                              .reminders!
                                              .where(
                                                (e) => e.user!.fullName!
                                                    .toLowerCase()
                                                    .contains(
                                                      model
                                                          .searchuserByHealthCareReminder!
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
    HealthCareViewModel? model,
    bool isComplete = false,
  }) => GestureDetector(
    onTap: () => navigate.navigateTo(
      Routes.healthcareViewMedicationScreen,
      arguments: HealthcareViewMedicationScreenArguments(id: reminder.id),
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
                    text: reminder.patientDetails?.fullName?.capitalize() ?? '',
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
