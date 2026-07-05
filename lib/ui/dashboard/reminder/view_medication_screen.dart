// ignore_for_file: strict_top_level_inference, prefer_typing_uninitialized_variables, must_be_immutable, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:medicate_app/core/app_assets/constant.dart';
import 'package:medicate_app/core/config/colors.dart';
import 'package:stacked/stacked.dart';
import '../../../core/app_assets/image.dart';
import '../../../core/connect_end/view_model/auth_view_model.dart';
import '../../widget/button.dart';
import '../../widget/text.dart';

class ViewMedicationScreen extends StatelessWidget {
  ViewMedicationScreen({super.key, required this.id});
  String? id;
  var medication;
  var imageUrl;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
      viewModelBuilder: () => AuthViewModel(),
      onViewModelReady: (model) {
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          await model.getReminderById(context, id);
          imageUrl = model.sanitizeImageUrl(medication?.medicationImage?.url);
          model.allNotificationChannels.addAll(
            model.getReminderByIdModel!.data!.notificationChannels!,
          );
          if (model.getReminderByIdModel!.data!.payments!.isNotEmpty &&
              model
                  .getReminderByIdModel!
                  .data!
                  .payments![0]
                  .notificationChannelsPaidFor!
                  .isNotEmpty) {
            bool hasList = model.allNotificationChannels.any(
              (item) => model
                  .getReminderByIdModel!
                  .data!
                  .payments![0]
                  .notificationChannelsPaidFor!
                  .contains(item),
            );
            if (hasList == true) {
            } else {
              model.allNotificationChannels.addAll(
                model
                    .getReminderByIdModel!
                    .data!
                    .payments![0]
                    .notificationChannelsPaidFor!,
              );
            }
            if (model.allNotificationChannels.isEmpty) {
              model.allNotificationChannels.addAll(
                model
                    .getReminderByIdModel!
                    .data!
                    .payments![0]
                    .notificationChannelsPaidFor!,
              );
            }
          }
        });
      },
      disposeViewModel: false,
      onDispose: (viewModel) {},
      builder: (_, AuthViewModel model, _) {
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
                                    color:
                                        model
                                                .getReminderByIdModel
                                                ?.data
                                                ?.medication
                                                ?.medicationStatus ==
                                            'COMPLETED'
                                        ? AppColors.app_green
                                        : AppColors.yellow,
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
                        TextView(
                          text: 'MEDICATION DETAILS',
                          textStyle: TextStyle(
                            fontFamily: 'GoogleSans',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.deep,
                          ),
                        ),
                        SizedBox(height: 10.h),
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
                                child: (imageUrl == null || imageUrl.isEmpty)
                                    ? model.fallbackMedicationIcon(model)
                                    : Image.network(
                                        imageUrl,
                                        height: 70.h,
                                        width: 70.w,
                                        errorBuilder: (_, _, _) =>
                                            model.fallbackMedicationIcon(model),
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
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.deep,
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
                                text: 'Start Date',
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
                                text: 'Frequency',
                                textStyle: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 12.8.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.infoGrey,
                                ),
                              ),
                              SizedBox(height: 4.10.h),
                              model
                                          .getReminderByIdModel!
                                          .data!
                                          .medication!
                                          .scheduleType ==
                                      'CUSTOM'
                                  ? SizedBox(
                                      height:
                                          model
                                                  .getReminderByIdModel!
                                                  .data!
                                                  .medication!
                                                  .dailyDoseTimes!
                                                  .length >
                                              1
                                          ? 160.h
                                          : 90.h,
                                      child: SingleChildScrollView(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ...model.getReminderByIdModel!.data!.medication!.dailyDoseTimes!.map(
                                              (e) => Container(
                                                padding: EdgeInsets.all(10.w),
                                                margin: EdgeInsets.only(
                                                  bottom: 12.w,
                                                ),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: AppColors.f1,
                                                  ),
                                                  color: AppColors.white
                                                      .withOpacity(.8),
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            SizedBox(
                                                              width: 254.h,
                                                              child: Wrap(
                                                                spacing: 2.10,
                                                                runSpacing: 6,
                                                                children: (() {
                                                                  final Set<
                                                                    String
                                                                  >
                                                                  uniqueTimes =
                                                                      {};
                                                                  for (final dose
                                                                      in e) {
                                                                    uniqueTimes.add(
                                                                      dose.time!,
                                                                    );
                                                                  }
                                                                  return uniqueTimes.map((
                                                                    time,
                                                                  ) {
                                                                    return Container(
                                                                      width:
                                                                          100.w,
                                                                      margin: EdgeInsets.only(
                                                                        right:
                                                                            5.10.w,
                                                                      ),
                                                                      padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            6.0.w,
                                                                        vertical:
                                                                            4.w,
                                                                      ),
                                                                      decoration: BoxDecoration(
                                                                        border: Border.all(
                                                                          color:
                                                                              AppColors.infoGrey1,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                              22,
                                                                            ),
                                                                        color: AppColors
                                                                            .white,
                                                                      ),
                                                                      child: Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          SvgPicture.asset(
                                                                            AppImage.timer,
                                                                            color:
                                                                                AppColors.reminder,
                                                                            width:
                                                                                15.20.sp,
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                4.10.w,
                                                                          ),
                                                                          TextView(
                                                                            text: convertTo12HourFormat(
                                                                              time,
                                                                            ),
                                                                            textStyle: TextStyle(
                                                                              fontFamily: 'GoogleSans',
                                                                              fontSize: 12.8.sp,
                                                                              fontWeight: FontWeight.w500,
                                                                              color: AppColors.reminder,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    );
                                                                  }).toList();
                                                                })(),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  : Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Wrap(
                                          spacing: 4.10,
                                          runSpacing: 6,
                                          children: (() {
                                            final Set<String> uniqueTimes = {};

                                            for (final day
                                                in model
                                                    .getReminderByIdModel!
                                                    .data!
                                                    .medication!
                                                    .dailyDoseTimes!) {
                                              for (final dose in day) {
                                                uniqueTimes.add(dose.time!);
                                              }
                                            }
                                            return uniqueTimes.map((time) {
                                              return Container(
                                                width: 100.w,
                                                margin: EdgeInsets.only(
                                                  right: 4.10.w,
                                                ),
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 4.0.w,
                                                  vertical: 6.w,
                                                ),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: AppColors.infoGrey1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(22),
                                                  color: AppColors.white,
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    SvgPicture.asset(
                                                      AppImage.timer,
                                                      color: AppColors.reminder,
                                                      width: 18.20.sp,
                                                    ),
                                                    SizedBox(width: 5.10.w),
                                                    TextView(
                                                      text:
                                                          convertTo12HourFormat(
                                                            time,
                                                          ),
                                                      textStyle: TextStyle(
                                                        fontFamily:
                                                            'GoogleSans',
                                                        fontSize: 12.8.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            AppColors.reminder,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }).toList();
                                          })(),
                                        ),
                                      ],
                                    ),
                              SizedBox(height: 5.10.h),
                              Divider(
                                color: AppColors.infoGrey,
                                thickness: .14,
                              ),
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
                                text: 'Duration',
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
                                    '${model.getReminderByIdModel!.data!.medication!.durationInDays} ${model.returnNumberOfDays(model.getReminderByIdModel!.data!.medication!.durationInDays).toString().capitalize()}',
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
                                text: 'Notes & Instructionse',
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
                                    model
                                        .getReminderByIdModel!
                                        .data!
                                        .medication!
                                        .note ??
                                    'No note',
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextView(
                              text: 'NOTIFICATION CHANNEL',
                              textStyle: TextStyle(
                                fontFamily: 'GoogleSans',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.deep,
                              ),
                            ),
                            SizedBox(height: 5.10.h),
                            Divider(color: AppColors.infoGrey, thickness: .2),
                            SizedBox(height: 5.10.h),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                vertical: 10.w,
                                horizontal: 14.0.w,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.dashboard,
                                borderRadius: BorderRadius.circular(8.2),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 5.0.h),
                                  TextView(
                                    text: 'Selected Channels',
                                    textStyle: TextStyle(
                                      fontFamily: 'Arial',
                                      fontSize: 13.4.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.infoGrey,
                                    ),
                                  ),
                                  SizedBox(height: 5.0.h),
                                  Wrap(
                                    spacing: 4.10,
                                    runSpacing: 6,
                                    children: [
                                      ...model.allNotificationChannels.map(
                                        (e) =>
                                            model.notificationChannelFlowWidget(
                                              notificationType: e,
                                            ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5.0.h),
                                  model
                                          .getReminderByIdModel!
                                          .data!
                                          .phoneNumbers!
                                          .isEmpty
                                      ? SizedBox.shrink()
                                      : Divider(
                                          color: AppColors.infoGrey,
                                          thickness: .14,
                                        ),
                                  SizedBox(
                                    height:
                                        model
                                            .getReminderByIdModel!
                                            .data!
                                            .phoneNumbers!
                                            .isEmpty
                                        ? 0.h
                                        : 5.10.h,
                                  ),
                                  model
                                          .getReminderByIdModel!
                                          .data!
                                          .phoneNumbers!
                                          .isEmpty
                                      ? SizedBox.shrink()
                                      : TextView(
                                          text: 'Phone Numbers',
                                          textStyle: TextStyle(
                                            fontFamily: 'Arial',
                                            fontSize: 13.8.sp,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.infoGrey,
                                          ),
                                        ),
                                  SizedBox(
                                    height:
                                        model
                                            .getReminderByIdModel!
                                            .data!
                                            .phoneNumbers!
                                            .isEmpty
                                        ? 0.h
                                        : 5.0.h,
                                  ),
                                  Wrap(
                                    spacing: 4.10,
                                    runSpacing: 6,
                                    children: [
                                      ...model
                                          .getReminderByIdModel!
                                          .data!
                                          .phoneNumbers!
                                          .map((e) => model.convert234To0(e)),
                                    ],
                                  ),
                                  model
                                          .getReminderByIdModel!
                                          .data!
                                          .emails!
                                          .isEmpty
                                      ? SizedBox.shrink()
                                      : Divider(
                                          color: AppColors.infoGrey,
                                          thickness: .14,
                                        ),
                                  SizedBox(
                                    height:
                                        model
                                            .getReminderByIdModel!
                                            .data!
                                            .emails!
                                            .isEmpty
                                        ? 0.h
                                        : 5.10.h,
                                  ),
                                  model
                                          .getReminderByIdModel!
                                          .data!
                                          .emails!
                                          .isEmpty
                                      ? SizedBox.shrink()
                                      : TextView(
                                          text: 'Email',
                                          textStyle: TextStyle(
                                            fontFamily: 'Arial',
                                            fontSize: 13.8.sp,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.infoGrey,
                                          ),
                                        ),
                                  SizedBox(
                                    height:
                                        model
                                            .getReminderByIdModel!
                                            .data!
                                            .emails!
                                            .isEmpty
                                        ? 0.h
                                        : 5.0.h,
                                  ),
                                  Wrap(
                                    spacing: 4.10,
                                    runSpacing: 6,
                                    children: [
                                      ...model
                                          .getReminderByIdModel!
                                          .data!
                                          .emails!
                                          .map(
                                            (e) =>
                                                model.convertToProperEmail(e),
                                          ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30.0.h),
                        buttonMedication(context: context, model: model),

                        SizedBox(height: 14.0.h),
                      ],
                    ),
                  )
                : SizedBox.shrink(),
          ),
        );
      },
    );
  }

  Widget buttonMedication({context, AuthViewModel? model}) {
    if (model!.getReminderByIdModel!.data!.payments!.isNotEmpty &&
            model.getReminderByIdModel!.data!.payments!.last.status ==
                'SUCCESS' ||
        model.getReminderByIdModel!.data!.payments!.isEmpty) {
      return ButtonWidget(
        border: 100.r,
        buttonColor: AppColors.primary,
        buttonText: 'Edit Medication',
        color: AppColors.white,
        buttonBorderColor: AppColors.transparent,
        onPressed: () => model.showUpdateMedicationDialog(
          context: context,
          data: model.getReminderByIdModel!.data,
          model: model,
        ),
        fontSize: 14.sp,
      );
    }
    if (model.getReminderByIdModel!.data!.payments!.isNotEmpty &&
            model.getReminderByIdModel!.data!.payments!.last.status ==
                'PENDING' ||
        model.getReminderByIdModel!.data!.payments!.isEmpty) {
      return ButtonWidget(
        border: 100.r,
        buttonColor: AppColors.primary,
        buttonText: 'Make Payment',
        color: AppColors.white,
        isLoading: model.isLoading,
        buttonBorderColor: AppColors.transparent,
        onPressed: () {
          model.reminderRetryPayment(
            context: context,
            reminderId: model.getReminderByIdModel!.data!.id,
          );
        },
        fontSize: 14.sp,
      );
    }
    return SizedBox.shrink();
  }
}
