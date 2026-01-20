// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:medicate_app/core/app_assets/constant.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/config/colors.dart';
import '../../../../core/connect_end/view_model/pharm_auth_view_model.dart';
import '../../../widget/button.dart';
import '../../../widget/text.dart';

// ignore: must_be_immutable
class PharmViewMedicationScreen extends StatelessWidget {
  PharmViewMedicationScreen({super.key, required this.id});
  String? id;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PharmViewModel>.reactive(
      viewModelBuilder: () => PharmViewModel(),
      onViewModelReady: (model) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
           model.getReminderById(context, id:id);
        });
      },
      disposeViewModel: false,
      onDispose: (viewModel) {},
      builder: (_, PharmViewModel model, _) {
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
            child:
                model.getReminderByIdModel != null &&
                    model.getReminderByIdModel!.data != null
                ? Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      vertical: 20.w,
                      horizontal: 16.w,
                    ),
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
                                  text:
                                      model
                                          .getReminderByIdModel
                                          ?.data
                                          ?.medication
                                          ?.medicationStatus
                                          ?.capitalize() ??
                                      '',
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
                              text:
                                  '${model.calculateDaysLeft()}/${model.getReminderByIdModel!.data!.medication!.durationInDays} days left',
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
                                text:
                                    '${model.getReminderByIdModel!.data!.medication!.medicationName}',
                                textStyle: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 14.8.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.reminder,
                                ),
                              ),
                              SizedBox(height: 5.10.h),
                              Divider(
                                color: AppColors.infoGrey,
                                thickness: .14,
                              ),
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
                                text:
                                    '${model.getReminderByIdModel!.data!.medication!.drugName}',
                                textStyle: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 14.8.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.reminder,
                                ),
                              ),
                              SizedBox(height: 10.h),
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(
                                  vertical: 30.w,
                                  horizontal: 20..w,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child:
                                    model
                                            .getReminderByIdModel!
                                            .data!
                                            .medication!
                                            .medicationImage ==
                                        null
                                    ? Padding(
                                        padding: EdgeInsets.all(8.w),
                                        child: SvgPicture.asset(
                                          color: AppColors.primary,
                                          model.errorRemidnderImage(
                                            model
                                                .getReminderByIdModel!
                                                .data!
                                                .medication!
                                                .medicationType,
                                          ),
                                          height: 70.h,
                                          width: 70.w,
                                        ),
                                      )
                                    : Image.network(
                                        model
                                            .getReminderByIdModel!
                                            .data!
                                            .medication!
                                            .medicationImage!
                                            .url!,
                                        height: 70.h,
                                        width: 70.w,
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                                Padding(
                                                  padding: EdgeInsets.all(8.w),
                                                  child: SvgPicture.asset(
                                                    color: AppColors.primary,
                                                    model.errorRemidnderImage(
                                                      model
                                                          .getReminderByIdModel!
                                                          .data!
                                                          .medication!
                                                          .medicationType,
                                                    ),
                                                    height: 70.h,
                                                    width: 70.w,
                                                  ),
                                                ),
                                      ),
                              ),
                              SizedBox(height: 5.10.h),
                              Divider(
                                color: AppColors.infoGrey,
                                thickness: .14,
                              ),
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
                                    model.isMedTypeView(
                                      model
                                          .getReminderByIdModel!
                                          .data!
                                          .medication!
                                          .medicationType,
                                    ),
                                    color: AppColors.primary,
                                  ),
                                  SizedBox(width: 6.10.h),
                                  TextView(
                                    text: model
                                        .getReminderByIdModel!
                                        .data!
                                        .medication!
                                        .medicationType!
                                        .capitalize(),
                                    textStyle: TextStyle(
                                      fontFamily: 'Arial',
                                      fontSize: 14.8.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.reminder,
                                    ),
                                  ),
                                ],
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
                                text:
                                    '${model.getReminderByIdModel!.data!.medication!.dosage}',
                                textStyle: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 14.8.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.reminder,
                                ),
                              ),
                              SizedBox(height: 5.10.h),
                              Divider(
                                color: AppColors.infoGrey,
                                thickness: .14,
                              ),
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
                                text: DateFormat('d MMM, yyyy').format(
                                  model
                                      .getReminderByIdModel!
                                      .data!
                                      .medication!
                                      .startDateTime!,
                                ),
                                textStyle: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 14.8.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.reminder,
                                ),
                              ),
                              SizedBox(height: 5.10.h),
                              Divider(
                                color: AppColors.infoGrey,
                                thickness: .14,
                              ),
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
                                    text:
                                        '${model.calculateDaysLeft()}/${model.getReminderByIdModel!.data!.medication!.durationInDays} days',
                                    letterSpacing: 1,
                                    textStyle: TextStyle(
                                      fontFamily: 'Arial',
                                      fontSize: 14.8.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.reminder,
                                    ),
                                  ),
                                  SizedBox(width: 6.10.h),
                                  GestureDetector(
                                    onTap: () {
                                      model.onTapViewSingleReminder =
                                          !model.onTapViewSingleReminder;
                                      model.notifyListeners();
                                    },
                                    child: TextView(
                                      text: !model.onTapViewSingleReminder
                                          ? 'Show more'
                                          : 'Hide details',
                                      textStyle: TextStyle(
                                        fontFamily: 'Arial',
                                        fontSize: 12.8.sp,
                                        decoration: TextDecoration.underline,
                                        decorationColor: AppColors.primary,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.primary,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5.10.h),
                              Divider(
                                color: AppColors.infoGrey,
                                thickness: .14,
                              ),
                              SizedBox(
                                height: !model.onTapViewSingleReminder
                                    ? 0.h
                                    : 5.10.h,
                              ),
                              !model.onTapViewSingleReminder
                                  ? SizedBox.shrink()
                                  : Column(
                                      children: [
                                        ...model
                                            .getReminderByIdModel!
                                            .data!
                                            .medication!
                                            .dailyDoseTimes!
                                            .asMap()
                                            .entries
                                            .map((entry) {
                                              final i = entry.key; // 0, 1, 2
                                              final v = entry
                                                  .value; // {day: x, doses: [...]}
                                              return model.viewPreviewWidgetContainer(
                                                context: context,
                                                callback:
                                                    i, // ✅ now an index (int)
                                                color: AppColors.grey,
                                                listOfTimes: List.generate(
                                                  model
                                                      .getReminderByIdModel!
                                                      .data!
                                                      .medication!
                                                      .timesPerDay!,
                                                  (index) => index,
                                                ),
                                                dosageMap:
                                                    v, // ✅ wrap v in a list so widget only sees one day
                                              );
                                            }),
                                      ],
                                    ),

                              SizedBox(height: 10.h),
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
                                text: DateFormat('d MMM, yyyy').format(
                                  model
                                      .getReminderByIdModel!
                                      .data!
                                      .medication!
                                      .endDateTime!,
                                ),
                                textStyle: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 14.8.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.reminder,
                                ),
                              ),
                              SizedBox(height: 5.10.h),
                              Divider(
                                color: AppColors.infoGrey,
                                thickness: .14,
                              ),
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
                                text: model.getNumberOfTimes(
                                  model
                                      .getReminderByIdModel!
                                      .data!
                                      .medication!
                                      .timesPerDay!,
                                ),
                                textStyle: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 14.8.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.reminder,
                                ),
                              ),
                              SizedBox(height: 5.10.h),
                              Divider(
                                color: AppColors.infoGrey,
                                thickness: .14,
                              ),
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
                                text:
                                    '${model.getReminderByIdModel!.data!.medication!.note}',
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
                        model
                                .getReminderByIdModel!
                                .data!
                                .notificationChannels!
                                .isEmpty
                            ? SizedBox.shrink()
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
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
                                  Divider(
                                    color: AppColors.infoGrey,
                                    thickness: .2,
                                  ),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 10.h),
                                        ...model
                                            .getReminderByIdModel!
                                            .data!
                                            .notificationChannels!
                                            .map(
                                              (e) => Padding(
                                                padding: EdgeInsets.only(
                                                  bottom: 20.w,
                                                ),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      padding: EdgeInsets.all(
                                                        2.w,
                                                      ),
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
                                                        fontWeight:
                                                            FontWeight.w400,
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
                                ],
                              ),
                        SizedBox(height: 30.0.h),
                        ButtonWidget(
                          border: 100.r,
                          buttonColor: AppColors.primary,
                          buttonText: 'Edit Medication',
                          color: AppColors.white,
                          buttonBorderColor: AppColors.transparent,
                          onPressed: () => model.showUpdateMedicationDialog(
                            context: context,
                            data: model.getReminderByIdModel!.data,
                          ),
                          fontSize: 14.sp,
                        ),
                      ],
                    ),
                  )
                : SizedBox.shrink(),
          ),
        );
      },
    );
  }
}
